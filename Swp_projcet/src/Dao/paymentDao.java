package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DBConnection.DBConnection;
import Dto.paymentDto;

public class paymentDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private static paymentDao instance;
	public paymentDao(){
		
	}
	public static paymentDao getInstance() {
		if(instance == null) {
			instance = new paymentDao();
		}
		return instance;
	}
	public void closeAll(ResultSet rs,PreparedStatement pstmt,Connection conn) {
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
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void addpayment() {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into payment(m_id) select max(a.m_id) from member a");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
		}finally {
			closeAll(null, pstmt, conn);
		}
		
	}

	public void insertpay(String num,String id) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into payment (startDate,endDate,m_id,c_num) value(now(),(select date_add(now(),interval+1 month)),?,?)");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			pstmt.setInt(2, Integer.valueOf(num));
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public ArrayList<paymentDto> paymentList(String id){
		ArrayList<paymentDto> list = new ArrayList<paymentDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select a.m_name,b.* from payment b left join member a on a.m_id=b.m_id where b.m_id=? order by startDate desc");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.valueOf(id));
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String m_name = rs.getString("m_name");
				String startDate = rs.getString("startDate");
				String endDate = rs.getString("endDate");
				int c_num = rs.getInt("c_num");
				int m_id = rs.getInt("m_id");
				
				paymentDto pdto = new paymentDto();
				pdto.setM_name(m_name);
				pdto.setStartDate(startDate);
				pdto.setEndDate(endDate);
				pdto.setC_num(c_num);
				pdto.setM_id(m_id);
				
				list.add(pdto);
				
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return list;
		
	}


}
