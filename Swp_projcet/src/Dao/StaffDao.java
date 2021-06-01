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
					return 1;		//로그인 성공
				}
				else {
					return 0;		//로그인실패
				}
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return -1;// DB 오류
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
				return 0; //�대�� 議댁�ы���� ���대��
			}else {
				return 1; //�ъ�� 媛��ν�� ���대��
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return -1;//db�ㅻ�
	}
	
	public void insertStaff(String id,String pw,String name,String phone, String addr) {
		try {
			StringBuffer sql= new StringBuffer();
			sql.append("insert into staff (s_id,s_pw,s_phone,s_arrd,s_name) value(?,?,?,?,?)");
			conn =DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			pstmt.setString(3, phone);
			pstmt.setString(4, addr);
			pstmt.setString(5, name);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
		
	}
	
}
