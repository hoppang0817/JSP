package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.checkDto;
import Dto.mCheck;


public class checkDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static checkDao instance;

	public checkDao() {
		
	}
	
	public static checkDao getInstance() {
		if(instance == null) {
			instance = new checkDao();
		}
		return instance;
	}
	
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs != null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void checkMember(String id) {
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into mCheck (c_day, c_time, m_id, c_num) "
					+ "value(curdate(), curtime(), ?, (select c_num from member where m_id=?))");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.setInt(2, Integer.valueOf(id));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public int list(String id){
//		int cnt = 0;
//		ArrayList<checkDto>list = new ArrayList<checkDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select count(*) as cnt from mCheck where c_day=curdate() and m_id=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getInt("cnt") == 1) {
					return  1;
				}
				else {
					
					return 0;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
		return -1;
		
	}
	
	public ArrayList<mCheck> listPerOne(String id){
	      ArrayList<mCheck>list = new ArrayList<mCheck>();
	      try {
	         conn = DBConnection.getConnection();
	         StringBuffer sql = new StringBuffer();
	         sql.append("SELECT @rownum:=@rownum+1  rnum, A.c_day,A.c_time,A.c_num FROM  mcheck A,(SELECT @ROWNUM := 0) R WHERE  m_id=? ORDER BY A.c_day DESC");
	         pstmt = conn.prepareStatement(sql.toString());
	         pstmt.setInt(1, Integer.valueOf(id));
	         rs = pstmt.executeQuery();
	         while(rs.next()){
	            int rnum = rs.getInt("rnum");
	            String c_day = rs.getString("c_day");
	            String c_time = rs.getString("c_time");
	            int c_num = rs.getInt("c_num");
	            
	            mCheck dto = new mCheck();
	            dto.setRnum(rnum);
	            dto.setC_day(c_day);
	            dto.setC_time(c_time);
	            dto.setC_num(c_num);
	            list.add(dto);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();
	      }finally {
	         closeAll(rs, pstmt, conn);
	      }
	      
	      
	      return list;
	      
	   }
}
