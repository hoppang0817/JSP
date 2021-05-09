package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.ClassDto;
import Dto.MemberDto;

public class ClassDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static ClassDao instance;
	private ClassDao(){
		
	}
	public static ClassDao getInstance(){
		if(instance ==null) {
			instance = new ClassDao();	
		}
		return instance;
	}
	
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn) {
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
	public void addClass(String name, String count,String time,String grade) {
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into class (c_name,c_limitedNum,c_time,c_grade) value(?,?,?,?)");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.valueOf(count));
			pstmt.setString(3, time);
			pstmt.setString(4, grade);
			pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public ArrayList<ClassDto> classList() {
		ArrayList<ClassDto> list = new ArrayList<ClassDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.c_num,c_name,c_limitedNum,c_grade,date_format(c_time,\"%H:%i\") as c_time,ifnull(count,0) as count  from class as a  "
					+ "Left outer join(select c_num,count(c_num) as count from member group by c_num)as b on(a.c_num =b.c_num);");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int c_num = rs.getInt("c_num");
				String c_name = rs.getString("c_name");
				int c_limitedNum = rs.getInt("c_limitedNum");
				String c_time = rs.getString("c_time");
				String c_grade = rs.getString("c_grade");
				int count = rs.getInt("count");
				ClassDto dto = new ClassDto(c_num, c_name, c_limitedNum, c_time, c_grade, count);
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
		
	}
	
	
	public void updateClass(String num,String name, String count,String time,String grade) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update class set c_name=?,c_limitedNum=?,c_time=?,c_grade=? where c_num=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setInt(2, Integer.valueOf(count));
			pstmt.setString(3, time);
			pstmt.setString(4, grade);
			pstmt.setInt(5, Integer.valueOf(num));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	
	public ClassDto updateClassView(String num) {
		ClassDto dto = null;
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select c_num, c_name,c_limitedNum,date_format(c_time,\"%H:%i\") as c_time,c_grade from class where c_num=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int c_num = rs.getInt("c_num");
				String c_name = rs.getString("c_name");
				int c_limitedNum = rs.getInt("c_limitedNum");
				
				String c_time = rs.getString("c_time");
				int idx = c_time.indexOf(":");
				String timeHour = c_time.substring(0, idx);
				String timeMinute = c_time.substring(idx+1);
				
				String c_grade = rs.getString("c_grade");
				dto = new ClassDto(c_num, c_name, c_limitedNum, timeHour, timeMinute, c_grade);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return dto;
		
	}
	
	public ArrayList<MemberDto> joinClassView(String num) {
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from  member where c_num =?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int m_id = rs.getInt("m_id");
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_arrd = rs.getString("m_arrd");
				String m_sex = rs.getString("m_sex");
				String m_email = rs.getString("m_email");
				int c_num = rs.getInt("c_num");
				
				MemberDto dto = new MemberDto(m_id, m_name, m_phone, m_arrd, c_num, m_sex, m_email);
				list.add(dto);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return list;
		
	}
	public void joinClass(String num,String id) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update member set c_num=? where m_id=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			pstmt.setInt(2, Integer.valueOf(id));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
}
