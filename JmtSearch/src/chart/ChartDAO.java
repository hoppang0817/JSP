package chart;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.DBConnection;

public class ChartDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	//성별이 남자 회원의 가입 수
		public int num() {
			String x=null;
			String sql = "select count(*) as cnt from member where m_gender='남'";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);
		}
		//성별이 여자 회원의 가입 수
		public int wnum() {
			String x=null;
			String sql = "select count(*) as cnt from member where m_gender='여'";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);
		}
		
		//지역별 (대표지역만....)
		public int addrnum() {
			String x=null;
			String sql ="select count(*) from member where m_addr like'경기%'";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		
		public int addrnum1() {
			String x=null;
			String sql ="select count(*) from member where m_addr like'서울%'";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		public int addrnum2() {
			String x=null;
			String sql ="select count(*) from member where m_addr like'부산%';";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		
		public int addrnum3() {
			String x=null;
			String sql ="SELECT COUNT(*) FROM member WHERE not m_addr LIKE '경기%' and not m_addr LIKE'부산%' and not m_addr like'서울%'";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		
		
		//방문자수 
		public int visitnum() {
			String x= null;
			String sql="SELECT COUNT(*) AS TotalCnt FROM VISIT";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		
		public int visitTodayeNum() {
			String x= null;
			String sql="SELECT COUNT(*) AS TodayCnt FROM VISIT WHERE STR_TO_DATE(V_DATE, '%Y-%m-%d') = STR_TO_DATE(sysdate(), '%Y-%m-%d')";
			try {
				conn=DBConnection.getConnection();
				pstmt = conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					x=rs.getString(1);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}return Integer.valueOf(x);	
		}
		
}
