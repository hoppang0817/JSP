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
			sql.append("select * from member a left join payment b on a.m_id=b.m_id");
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
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int c_num = rs.getInt("c_num");
				
				MemberDto mdto = new MemberDto(m_id, m_name, m_phone, m_arrd, m_sex, m_email, startDate, endDate, c_num);
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
				
				//전체 전화번호
				String allphone = rs.getString("m_phone");
				//중앙 번호(시작인덱스,마지막인덱스)
				String m_phone = allphone.substring(4, 8);
				//끝 번호
				String lnum = allphone.substring(9,13);
				
				//전체 주소
				String allarrd = rs.getString("m_arrd");
				//전체 주소에서 기준이될 특정 부호의 인덱스를 구함
				int idx1 = allarrd.indexOf(")");
				int idx2 = allarrd.indexOf(",");
				//특정부호 기준으로 시작인덱스,기준인덱스 까지 들고오기
				String postCoed = allarrd.substring(1, idx1); //우편번호
				String m_arrd = allarrd.substring(7, idx2);  //주소
				//특정부호 뒤부분 내용들고오기
				String arrd1 = allarrd.substring(idx2+1);  //상세주소
				
				String m_sex = rs.getString("m_sex");
				
				//이메일
				String allemail = rs.getString("m_email");
				// 먼저 @ 의 인덱스를 찾는다  
				int idx = allemail.indexOf("@");
				// @ 앞부분을 추출
				// substring은 첫번째 지정한 인덱스는 포함하지 않는다.
				// 아래의 경우는 첫번째 문자열 부터 추출된다.
				String m_email = allemail.substring(0, idx);  //이메일 앞부분
				 
				String email2 = allemail.substring(idx+1);   //이메일 뒷부분
				
			
				int c_num = rs.getInt("c_num");
				
				dto = new MemberDto(m_id, m_name, m_phone, lnum, m_arrd, postCoed, arrd1, m_sex, m_email, email2, c_num);
				
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
