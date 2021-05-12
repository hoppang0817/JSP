package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnection.DBConnection;

public class LockerDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static LockerDao instance;

	private static LockerDao getInstance() {
		if(instance == null) {
			instance = new LockerDao();
		}
		return instance;
	}
	
	public void colseAll(Connection conn, PreparedStatement pstmt, ResultSet rs) {
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
	
}
