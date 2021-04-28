package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.MemberDto;

public class MemberDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static MemberDao instance;
	private MemberDao() {
		
	}
	public static MemberDao getInstance(){
		if(instance ==null) {
			instance = new MemberDao();	
		}
		return instance;
	}
	
	public void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if(rs !=null) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
			if(conn != null) {
				conn.close();
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addMember(String name,String phone,String arrd,String sex,String email,String classNum) {
	
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into member(m_name,m_phone,m_arrd,m_sex,m_email,c_num) value(?,?,?,?,?,?)");
			conn =DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, arrd);
			pstmt.setString(4, sex);
			pstmt.setString(5, email);
			pstmt.setInt(6, Integer.valueOf(classNum));
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
		
	}
	public ArrayList<MemberDto> MemberList() {
		ArrayList<MemberDto> mdtos = new ArrayList<MemberDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member");
			conn =DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int m_id = rs.getInt("m_id");
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_arrd = rs.getString("m_arrd");
				String m_sex = rs.getString("m_sex");
				String m_email = rs.getString("m_email");
				int c_num = rs.getInt("c_num");
				
				MemberDto mdto = new MemberDto(m_id, m_name, m_phone, m_arrd, c_num, m_sex, m_email);
				mdtos.add(mdto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return mdtos;
		
	}
	
	public MemberDto updateView(String id) {
		MemberDto dto =null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member where m_id=?");
			conn=DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int m_id = rs.getInt("m_id");
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_arrd = rs.getString("m_arrd");
				String m_sex = rs.getString("m_sex");
				
				String allemail = rs.getString("m_email");
				// 먼저 @ 의 인덱스를 찾는다  
				int idx = allemail.indexOf("@");
				// @ 앞부분을 추출
				// substring은 첫번째 지정한 인덱스는 포함하지 않는다.
				// 아래의 경우는 첫번째 문자열 부터 추출된다.
				String m_email = allemail.substring(0, idx);
				
				String email2 = allemail.substring(idx+1);
				
			
				int c_num = rs.getInt("c_num");
				
				dto = new MemberDto(m_id, m_name, m_phone, m_arrd, m_sex, m_email, email2, c_num);
				
			}
		}catch (Exception e) {
			e.printStackTrace();// TODO: handle exception
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return dto;
		
	}
	
	public void update(String id,String name,String phone,String arrd,String sex,String email,String classNum) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update member set m_name=?,m_phone=?,m_arrd=?,m_sex=?,m_email=?,c_num=? where m_id=?");
			conn=DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setNString(2, phone);
			pstmt.setString(3, arrd);
			pstmt.setString(4, sex);
			pstmt.setString(5, email);
			pstmt.setInt(6, Integer.valueOf(classNum));
			pstmt.setInt(7, Integer.valueOf(id));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
}
