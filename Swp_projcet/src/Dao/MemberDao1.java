package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.MemberDto;

public class MemberDao1 {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static MemberDao1 instance;
	private MemberDao1() {
		
	}
	public static MemberDao1 getInstance(){
		if(instance ==null) {
			instance = new MemberDao1();	
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
	
	   public int nextid() {
		      int nextid1 =0;
		      try {
		         StringBuffer sql = new StringBuffer();
		         sql.append("select max(m_id)+1 as nextid from member");
		         conn =DBConnection.getConnection();
		         pstmt = conn.prepareStatement(sql.toString());
		         rs = pstmt.executeQuery();
		         if(rs.next()) {
		            int nextid = rs.getInt("nextid");
		            nextid1 = nextid;
		         }
		      } catch (Exception e) {
		         e.printStackTrace();
		      }
		      return nextid1;
		   }


	   public void addMember(String name,String phone,String arrd,String sex,String email,String classNum) {
	
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into member(m_name,m_phone,m_arrd,m_sex,m_email) value(?,?,?,?,?)");
			conn =DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setString(2, phone);
			pstmt.setString(3, arrd);
			pstmt.setString(4, sex);
			pstmt.setString(5, email);

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
			sql.append("select a.*, max(b.startDate) as startDate,max(b.endDate) as endDate from member a right join payment b on b.m_id = a.m_id group by m_id order by m_id");
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
	
	public ArrayList<MemberDto> searchList(String search, String searchKey){
		ArrayList<MemberDto> mdtos = new ArrayList<MemberDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			//이름으로 검색한경우
			if(search.equals("m_name") && searchKey != null) {
				sql.append("select a.*, max(b.startDate) as startDate, max(b.endDate) as endDate from member a right join payment b on b.m_id = a.m_id group by m_id  having m_name like ? order by m_id");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+searchKey+"%");
			}
			//id로 검색한경우
			else if(search.equals("m_id") && searchKey != null) {
				sql.append("select a.*, max(b.startDate) as startDate,max(b.endDate) as endDate from member a right join payment b on b.m_id = a.m_id group by m_id  having m_id=? order by m_id");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, Integer.valueOf(searchKey));
			}
			//검색하지 않았을때
			else{
				sql.append("select a.*, max(b.startDate) as startDate,max(b.endDate) as endDate from member a right join payment b on b.m_id = a.m_id group by m_id order by m_id");
				pstmt = conn.prepareStatement(sql.toString());
			}
			
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
			
		}catch (Exception e){
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
				
				//��泥� ����踰���
				String allphone = rs.getString("m_phone");
				//以��� 踰���(�����몃�깆��,留�吏�留��몃�깆��)
				String m_phone = allphone.substring(4, 8);
				//�� 踰���
				String lnum = allphone.substring(9,13);
				
				//��泥� 二쇱��
				String allarrd = rs.getString("m_arrd");
				//��泥� 二쇱������ 湲곗��대�� �뱀�� 遺��몄�� �몃�깆�ㅻ�� 援ы��
				int idx1 = allarrd.indexOf(")");
				int idx2 = allarrd.indexOf(",");
				//�뱀��遺��� 湲곗��쇰� �����몃�깆��,湲곗��몃�깆�� 源�吏� �ㅺ��ㅺ린
				String postCoed = allarrd.substring(1, idx1); //�고�몃���
				String m_arrd = allarrd.substring(7, idx2);  //二쇱��
				//�뱀��遺��� �ㅻ�遺� �댁�⑸�ㅺ��ㅺ린
				String arrd1 = allarrd.substring(idx2+1);  //���몄＜��
				
				String m_sex = rs.getString("m_sex");
				
				//�대���
				String allemail = rs.getString("m_email");
				// 癒쇱�� @ �� �몃�깆�ㅻ�� 李얜����  
				int idx = allemail.indexOf("@");
				// @ ��遺�遺��� 異�異�
				// substring�� 泥ル�吏� 吏����� �몃�깆�ㅻ�� �ы�⑦��吏� ������.
				// ������ 寃쎌�곕�� 泥ル�吏� 臾몄���� 遺��� 異�異�����.
				String m_email = allemail.substring(0, idx);  //�대��� ��遺�遺�
				 
				String email2 = allemail.substring(idx+1);   //�대��� �룸�遺�
				
			
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
	
	public void endDayMember(String id) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update member set c_num =null where m_id=?");
			conn = DBConnection.getConnection();
			pstmt= conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public ArrayList<MemberDto> modalList(String num){
		ArrayList<MemberDto>list = new ArrayList<MemberDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member where c_num=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(num));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int m_id = rs.getInt("m_id");
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_arrd = rs.getString("m_arrd");
				String m_email = rs.getString("m_email");
				String m_sex = rs.getString("m_sex");
				MemberDto dto = new MemberDto();
				dto.setM_id(m_id);
				dto.setM_name(m_name);
				dto.setM_phone(m_phone);
				dto.setM_arrd(m_arrd);
				dto.setM_email(m_email);
				dto.setM_sex(m_sex);
				list.add(dto);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
	}
	
	public ArrayList<MemberDto> findIdlist(String name){
		ArrayList<MemberDto> list = new ArrayList<MemberDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			sql.append("select * from member where m_name like ? ");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, "%"+name+"%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				int m_id = rs.getInt("m_id");
				String m_name = rs.getString("m_name");
				String m_phone = rs.getString("m_phone");
				String m_arrd = rs.getString("m_arrd");
				String m_email = rs.getString("m_email");
				String m_sex = rs.getString("m_sex");
				
				MemberDto dto = new MemberDto();
				dto.setM_id(m_id);
				dto.setM_name(m_name);
				dto.setM_phone(m_phone);
				dto.setM_arrd(m_arrd);
				dto.setM_email(m_email);
				dto.setM_sex(m_sex);
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
		
	}
}
