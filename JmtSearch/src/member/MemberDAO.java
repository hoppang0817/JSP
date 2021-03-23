package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import database.DBConnection;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//로그인
	public int login(String id, String password) {
		String sql="select * from member where m_id=?";
		try {
			conn = DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("m_pw").equals(password)) {
					return 1; //로그인 성공
				}else {
					return 0; //비밀번호틀림
				}
			}
			return -1; //없는 아이디
		}catch(Exception e) {
			e.printStackTrace();
		}return -2; //DB오류
		
	}
	
	//아이디 중복체크
	public int joinIdCheck(String id){
		int result = -1;//SQL에러
		try {
		
			conn = DBConnection.getConnection();
			
			String sql = "select * from member where m_id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);

			rs = pstmt.executeQuery();

			if(rs.next()){	
				result = 0; //중복아이디
			}else{
				result = 1; //사용가능한 아이디
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		return result;
	}
	
	//아이디 찾기
	public String findid(String name,String email) {
		String find_id=null;//id를못찾았을때
		String sql = "select * from member where m_name=? and m_email=?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("m_name").equals(name) && rs.getString("m_email").equals(email)) {
					find_id = rs.getString("m_id");  //이름과 이메일이 맞으면 해당 아이디 가져오기
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return find_id; 
	}
	
	//비밀번호 찾기
	public String findpw(String name,String id,String email) {
		String find_pw=null;//pw를못찾았을때
		String sql = "select * from member where m_name=? and m_id=? and m_email=?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, email);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString("m_name").equals(name) && rs.getString("m_id").equals(id) &&rs.getString("m_email").equals(email)) {
					find_pw = rs.getString("m_pw"); //이름,아이디,이메일이 맞을경우 해당 비밀번호 가져오기
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}return find_pw; 
	}
}
