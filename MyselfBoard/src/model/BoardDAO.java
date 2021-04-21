package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import database.DBConnection;

public class BoardDAO {

	private static BoardDAO instance;

	private BoardDAO() {

	}

	// 외부에서 인스턴스 객체를 사용할수있게 get메소드 생성
	public static BoardDAO getInstance() {
		if (instance == null)
			instance = new BoardDAO();
		return instance;
	}

	// DB연결해지 할때 사용할 메소드 DB연결은 메소드들 안에서...
	private void closeAll(ResultSet rs, PreparedStatement pstmt, Connection conn) {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception ex) {
			throw new RuntimeException(ex.getMessage());
		}
	}

	// 테이블의 레코드 개수
	public int getListCount(String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int x = 0;

		String sql;

		if (items == null && text == null)
			sql = "select count(*) from MyselfBoard"; // 검색결과가 없으면 전체 내용 개수를 세고
		else
			sql = "select count(*) from MyselfBoard where" + items + "like '%'" + text + '%'; // 검색 결과가 있음 결과에 대한 개수만 센다

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next())
				x = rs.getInt(1);
		} catch (Exception ex) {
			System.out.println("getListCount() 에러 :" + ex);
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return x;

	}

	// 테이블의 레코드 가져오기(내용들 가져와야지)
	public ArrayList<BoardDTO> getBoardList(int page, int limit, String items, String text) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int total_record = getListCount(items, text);
		int start = (page - 1) * limit;// ??
		int index = start + 1; // ??

		String sql;

		if (items == null && text == null)
			sql = "select * from MyselfBoard order by num desc";
		else
			sql = "select * from MyselfBoard where" + items + "like '%'" + text + "'%' order by num desc";

		ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.absolute(index)) {
				// 반복문으로 boardDTO에 DB에 있는 정보를 넣어 반복할거다
				BoardDTO board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("subject"));
				board.setRegist_day(rs.getString("subject"));
				board.setHit(rs.getInt("subject"));
				board.setIp(rs.getString("ip"));
				list.add(board);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} catch (Exception ex) {
			System.out.println("getBordList() 에러 : " + ex);
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}

	// member 테이블에서 인증된 id의 사용자명 가져오기
	public String getLoginNameBYId(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String name = null;
		String sql = "select * from member where id=?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next())
				name = rs.getString("name");

			return name;
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}

	// board테이블 새로운 글삽입
	public void insertBoard(BoardDTO board) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = DBConnection.getConnection();
			String sql = "insert into myselfboard values(?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board.getNum());
			pstmt.setString(2, board.getId());
			pstmt.setString(3, board.getName());
			pstmt.setString(4, board.getSubject());
			pstmt.setString(5, board.getContent());
			pstmt.setString(6, board.getRegist_day());
			pstmt.setInt(7, board.getHit());
			pstmt.setString(8, board.getIp());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			closeAll(null, pstmt, conn);
		}
	}

	//조회수 증가
	public void updateHit(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "select hit from myselfboard where num =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			int hit =0;
			if(rs.next()) 
				hit = rs.getInt("hit") +1;
				
				sql ="update myselfboard set hit =? where num=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, hit);
				pstmt.setInt(2, num);
				pstmt.executeUpdate();
				
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
	}
	//선택된 글 상세내용 가져오기
	public BoardDTO getBOardByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDTO board =null;
		
		updateHit(num);
		String sql = "select * from myselfboard where num=?";
		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				board = new BoardDTO();
				board.setNum(rs.getInt("num"));
				board.setId(rs.getString("id"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setRegist_day(rs.getString("regist_day"));
				board.setHit(rs.getInt("hit"));
				board.setIp(rs.getString("ip"));
			}
			return board;
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll(rs, pstmt, conn);
		}
		return null;
	}
	
	//선택된 글내용 수정하기
	public void updateBoard(BoardDTO board) {
		Connection conn =null;
		PreparedStatement pstmt =null;
		
		try {
			String sql = "update myselfboard set name =?,subject=?, content=? where num=?";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);
			
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getSubject());
			pstmt.setInt(4, board.getNum());
			
			pstmt.executeUpdate();
			conn.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}
	
	public void deleteBoard(int num) {
		Connection conn =null;
		PreparedStatement pstmt =null;
		
		try {
			String sql = "delete from myselfboard where num=?";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		}catch(Exception ex) {
			ex.printStackTrace();
		}finally {
			closeAll(null, pstmt, conn);
		}
	}

}
