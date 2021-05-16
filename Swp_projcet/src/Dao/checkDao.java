package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnection.DBConnection;


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
					+ "value(curdate(), curtime(), m_id=?, (select c_num from member where m_id=?))");
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
}
