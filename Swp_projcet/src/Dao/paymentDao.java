package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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
	
	

}
