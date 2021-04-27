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
	
	public void addMember(String name,String phoen,String arrd,String sex,String email,String classNum) {
	
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into member(m_name,m_phone,m_arrd,m_sex,m_email,c_num) value(?,?,?,?,?,?)");
			conn =DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, phoen);
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
	
}
