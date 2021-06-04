package dao;

import java.security.Timestamp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Vector;

import DBConnection.DBConnection;
import dto.bDto;

public class BDao {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	//전체 데이터수
	public int selectCnt(String keyField, String keyWord){
		int totalCount = 0;
		String sql = null;
		try {
			conn = DBConnection.getConnection();
			System.out.println(keyWord != "");
			System.out.println(keyWord !=null);
			System.out.println(keyField);
			System.out.println(keyWord);
			if(keyWord != "" && keyWord != null) {
				//검색일경우 전체 데이터수
				sql = "select count(*) from mvc_board where "+ keyField +" like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%");
				System.out.println(sql);
			}
			else {
				//검색이 아닌경우 전체 데이터수
				sql="select count(*) from mvc_board";
				pstmt = conn.prepareStatement(sql);
				System.out.println(sql);
			}
			rs = pstmt.executeQuery();
			if(rs.next()){
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			try { // 다 썻으니 닫아줘야 한다.
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return totalCount;
	}
	
	
	public ArrayList<bDto> selectPage(String keyField,String keyWord, int startPage, int pageCnt){
		String sql =null;
		ArrayList<bDto> v = new ArrayList<bDto>();
		
		try{
			conn = DBConnection.getConnection();
			if(keyWord != "" && keyWord != null) {
				//검색인 경우
				sql ="SELECT * FROM mvc_board where "+ keyField +" like ? order by bId desc limit ?,?";
				pstmt = conn.prepareStatement(sql); // db에 연결하여 SQL 사용 준비
				pstmt.setString(1, "%"+keyWord+"%");
				pstmt.setInt(2, startPage);
				pstmt.setInt(3, pageCnt);
				System.out.println(sql);
			}
			else{
				//검색이 아닌 경우
				sql ="SELECT * FROM mvc_board order by bId desc limit ?,?";
				pstmt = conn.prepareStatement(sql); // db에 연결하여 SQL 사용 준비
				pstmt.setInt(1, startPage);
				pstmt.setInt(2, pageCnt);
				System.out.println(sql);
			}
			rs = pstmt.executeQuery();
			while(rs.next()){
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getNString("bTitle");
				String bContent = rs.getNString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");

				bDto dto = new bDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
				v.add(dto);
			}
		}catch(Exception e){
			e.printStackTrace();
		} finally{
			try { // 다 썻으니 닫아줘야 한다.
				if(rs != null){
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return v;
	}
	
	public void write(String bName, String bTitle, String bContent) {

		try {
			StringBuffer sql = new StringBuffer();
			sql.append(
					"insert into mvc_board (bName,bTitle,bContent,bDate,bHit,bGroup,bStep,bIndent)values(?,?,?,now(),0,(select*from(select max(bId)+1 from mvc_board)next),0,0)");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public ArrayList<bDto> list() {
		ArrayList<bDto> dtos = new ArrayList<bDto>();
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from mvc_board order by bGroup desc,bStep asc");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getNString("bTitle");
				String bContent = rs.getNString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");

				bDto dto = new bDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
				dtos.add(dto);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					rs.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dtos;
	}

	public bDto contentView(String strID) {

		upHit(strID); //���� 湲� 蹂닿린濡�媛�硫� hit�� 1�⑹�媛� ��
		bDto dto = null;

		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from mvc_board where bId=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(strID));
			rs = pstmt.executeQuery();

			if (rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getNString("bTitle");
				String bContent = rs.getNString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");

				dto = new bDto(bId, bName, bTitle, bContent, bDate, bHit, bGroup, bStep, bIndent);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return dto;

	}

	public void modify(String bId, String bName, String bTitle, String bContent) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update mvc_board set bName=?, bTitle=?, bContent=? where bId=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bId));
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
	}
	
	public void delete(String bId) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("delete from mvc_board where bId=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(bId));
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	private void upHit(String strID) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update mvc_board set bHit = bHit+1 where bId=?");
			conn = DBConnection.getConnection();
			pstmt=conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(strID));
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
			if(pstmt!=null) {
				pstmt.close();
			}
			if(conn !=null) {
				conn.close();
			}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	public bDto reply_view(String str) {
		bDto dto = null;
		
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("select * from mvc_board where bId=?");
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(str));
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int bId = rs.getInt("bId");
				String bName = rs.getString("bName");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getNString("bContent");
				Date bDate = rs.getDate("bDate");
				int bHit = rs.getInt("bHit");
				int bGroup = rs.getInt("bGroup");
				int bStep = rs.getInt("bStep");
				int bIndent = rs.getInt("bIndent");
				
				dto =new bDto(bId,bName,bTitle,bContent,bDate,bHit,bGroup,bStep,bIndent);
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(rs != null) {
					rs.close();
				}
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn !=null) {
					conn.close();
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
		
	}
	
	public void reply(String bId, String bName, String bTitle, String bContent, String bGroup, String bStep, String bIndent) {//�듦� �ш린
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("insert into mvc_board (bName,bTitle,bContent,bGroup,bStep,bIndent) values(?,?,?,?,?,?)");
			conn=DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, bName);
			pstmt.setString(2, bTitle);
			pstmt.setString(3, bContent);
			pstmt.setInt(4, Integer.parseInt(bGroup));
			pstmt.setInt(5, Integer.parseInt(bStep));
			pstmt.setInt(6, Integer.parseInt(bIndent));
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	public void repluShape(String strGroup, String strStep) {
		try {
			StringBuffer sql = new StringBuffer();
			sql.append("update mvc_board set bStep = bStep+1 where bGroup=? and bStep > ?");
			conn = DBConnection.getConnection();
			pstmt =conn.prepareStatement(sql.toString());
			pstmt.setInt(1, Integer.parseInt(strGroup));
			pstmt.setInt(2, Integer.parseInt(strStep));
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) {
					pstmt.close();
				}
				if(conn != null) {
					conn.close();
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}
