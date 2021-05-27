package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnection.DBConnection;

public class StaffDao {

	private static StaffDao instance;
	
	public static StaffDao getInstance() {
		if(instance == null) {
			instance = new StaffDao();
		}
		return instance;
	}
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(conn!=null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(rs != null) {
				rs.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public int login(String id,String pw) {
		try {
			StringBuffer sql= new StringBuffer();
			sql.append("select * from staff where s_id=? ");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("s_pw").equals(pw)) {
					return 1;		//입력한 비밀번호와 DB에있는 비밀번호가 같다면 1을
				}
				else {
					return 0;		//다르면 0을 리턴해줌
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return -1;// 없는아이디		
	}
	
	public int chackId(String id) {
		try {
			StringBuffer sql= new StringBuffer();
			sql.append("select * from staff where s_id=? ");
			conn =DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0; //이미 존재하는 아이디
			}else {
				return 1; //사용 가능한 아이디
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return -1;//db오류
	}
	
	
}
