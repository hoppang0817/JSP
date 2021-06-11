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
	

	//페이징 해보자
	public ArrayList<MemberDto> searchList(String search, String searchKey, int startPage, int pageCnt){
		ArrayList<MemberDto> mdtos = new ArrayList<MemberDto>();
		try {
			conn = DBConnection.getConnection();
			StringBuffer sql = new StringBuffer();
			// 검색한경우
			if(searchKey != "" && searchKey != null) {
				sql.append("select a.*, max(b.startDate) as startDate, max(b.endDate) as endDate from member a "
						+ "right join payment b on b.m_id = a.m_id group by m_id "
						+ " having "+ search +" like ? order by m_id LIMIT ?,?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setString(1, "%"+searchKey+"%");
				pstmt.setInt(2, startPage);
				pstmt.setInt(3, pageCnt);
			}
			//검색하지 않았을때
			else{
				sql.append("select a.*, max(b.startDate) as startDate,max(b.endDate) as endDate from member a "
						+ "right join payment b on b.m_id = a.m_id group by m_id order by m_id LIMIT ?,?");
				pstmt = conn.prepareStatement(sql.toString());
				pstmt.setInt(1, startPage);
				pstmt.setInt(2, pageCnt);
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
	
	//데이터 총개수 구하기
	public int selectCnt(String search, String searchKey) {
		int totalCount =0;
		String sql =null;
		try {
			conn = DBConnection.getConnection();
			//System.out.println(searchKey == "");
			if(searchKey != "" && searchKey != null) {
				sql = "select count(*) from member where "+ search +" like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchKey+"%");
			}
			else {
				sql = "select count(*) from member";
				pstmt = conn.prepareStatement(sql);
			}
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		
		return totalCount;
		
	}
	
	
	//update시 불러올 데이터
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
				//전화번호 중앙
				String m_phone = allphone.substring(4, 8);
				//마지막 번호
				String lnum = allphone.substring(9,13);
				
				//전체 주소
				String allarrd = rs.getString("m_arrd");
				//전체주소에서 나눌 기준설정
				int idx1 = allarrd.indexOf(")");
				int idx2 = allarrd.indexOf(",");
				//전체 주소에서 )기준으로 잘라 우편번호 
				String postCoed = allarrd.substring(1, idx1); //우편번호
				//전체 주소에서 , 기준으로 자름
				String m_arrd = allarrd.substring(7, idx2);  //주소
				//,의 뒤부분 주소
				String arrd1 = allarrd.substring(idx2+1);  //상세주소
				
				String m_sex = rs.getString("m_sex");
				
				//전체이메일
				String allemail = rs.getString("m_email");
				//전체 이메일에서 나눌 기준설정
				int idx = allemail.indexOf("@");
				// @ ��遺�遺��� 異�異�
				// substring�� 泥ル�吏� 吏����� �몃�깆�ㅻ�� �ы�⑦��吏� ������.
				// ������ 寃쎌�곕�� 泥ル�吏� 臾몄���� 遺��� 異�異�����.
				String m_email = allemail.substring(0, idx);  //처음부터 @까지 주소
				 
				String email2 = allemail.substring(idx+1);   //@뒤부분 주소
				
			
				int c_num = rs.getInt("c_num");
				
				dto = new MemberDto(m_id, m_name, m_phone, lnum, m_arrd, postCoed, arrd1, m_sex, m_email, email2, c_num);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return dto;
		
	}
	
	//실제 update기능
	public void update(String id,String name,String phone,String arrd,String sex,String email) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update member set m_name=?,m_phone=?,m_arrd=?,m_sex=?,m_email=? where m_id=?");
			conn=DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, name);
			pstmt.setNString(2, phone);
			pstmt.setString(3, arrd);
			pstmt.setString(4, sex);
			pstmt.setString(5, email);
			//pstmt.setInt(6, Integer.valueOf(classNum));
			pstmt.setInt(6, Integer.valueOf(id));
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
	
	//수업에 참석하고있는 회원 리스트
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
	
	
	//수업신청시 있는 아이디인지 확인  and 보관함 신청시 있는 아이디인지 확인 and 출석체크시 있는아이디인지 확인
	public int checkMemberid(String id) {
		try {
			StringBuffer sql= new StringBuffer();
			sql.append("select * from member where m_id=? ");
			conn =DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return 0; //있는 아이디
			}else {
				return 1; //없는 아이디
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		
		return -1;
		
	}
	
	
	
	//모달에 사용할 회원찾기
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
				MemberDto dto = new MemberDto();
				dto.setM_id(rs.getInt(1));
				dto.setM_name(rs.getString(2));
				dto.setM_phone(rs.getString(3));
				//dto.setM_arrd(m_arrd);
				dto.setM_email(rs.getString(4));
				//dto.setM_sex(m_sex);
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
