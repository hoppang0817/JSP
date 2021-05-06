package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import DBConnection.DBConnection;

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
	

}
