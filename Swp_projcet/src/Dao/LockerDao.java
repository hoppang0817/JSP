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
	
	public void LockerUesr(String num,String id) {
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update locker set l_start=now(),l_end=(select date_add(now(),interval+1 month)),m_id=? where l_num=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.setInt(2, Integer.valueOf(num));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, null);
		}
	}
	public ArrayList<LockerDto> list(int startPage, int pageCnt){
		ArrayList<LockerDto>list = new ArrayList<LockerDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * from locker LIMIT ?,?");
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setInt(1, startPage);
			pstmt.setInt(2, pageCnt);
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
	
	//데이터 총개수 구하기
			public int selectCnt(String search, String searchKey) {
				int totalCount =0;
				String sql =null;
				try {
					conn = DBConnection.getConnection();
					//System.out.println(searchKey == "");
					if(searchKey != "" && searchKey != null) {
						sql = "select count(*) from locker where "+ search +" like ?";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, "%"+searchKey+"%");
					}
					else {
						sql = "select count(*) from locker";
						pstmt = conn.prepareStatement(sql);
					}
					rs = pstmt.executeQuery();
					if(rs.next()) {
						totalCount = rs.getInt(1);
					}
				} catch (Exception e) {
					e.printStackTrace();
				}finally {
					closeAll(conn, pstmt, rs);
				}
				
				
				return totalCount;
				
			}
		
	
	public void extend(String num) {
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update locker set l_end=(select date_add(l_end,interval+1 month))where l_num=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	public void changeUesr(String num ,String id) {
		try {
		conn = DBConnection.getConnection();
		StringBuffer sql = new StringBuffer();
		sql.append("update locker set l_start=now(),l_end=(select date_add(now(),interval+1 month)),m_id=? where l_num=?");
		pstmt = conn.prepareStatement(sql.toString());
		pstmt.setInt(1, Integer.valueOf(id));
		pstmt.setInt(2, Integer.valueOf(num));
		pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	public void refundLocker(String num) {
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("update locker set l_start=null,l_end=null,m_id=null where l_num=?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(conn, pstmt, null);
		}
	}
	
	
	
}
