package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.LockerDto;

public class LockerDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static LockerDao instance;

	private LockerDao() {
		
	}
	
	public static LockerDao getInstance() {
		if(instance == null) {
			instance = new LockerDao();
		}
		return instance;
	}
	
	public void closeAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
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
	
	public void LockerUesr(String id) {
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("insert into locker(l_start,l_end,m_id) value(now(),(select date_add(now(),interval+1 month)),?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, null);
		}
	}
	public ArrayList<LockerDto> list(){
		ArrayList<LockerDto>list = new ArrayList<LockerDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * from locker");
			pstmt= conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int l_num = rs.getInt("l_num");
				String l_start = rs.getString("l_start");
				String l_end = rs.getString("l_end");
				int m_id = rs.getInt("m_id");
				LockerDto dto = new LockerDto(l_num, l_start, l_end, m_id);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, rs);
		}
		return list;
		
	}
	
}
