package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.org.apache.xerces.internal.impl.xpath.regex.REUtil;

import model.BoardDTO;
import model.BoardDAO;
public class BoradController extends HttpServlet{

	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT =5; //limit

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURL = request.getRequestURI(); //전체주소를 가져옴
		String contextPath = request.getContentType(); //전체 주소중 프로젝트 이름까지의 주소
		String command = RequestURL.substring(contextPath.length()); //전체주소에서 프로젝트이름까지의 주소를 뺀나머니 주소구함
		
		response.setContentType("text/html; charset=utf-8"); //한글 나오게할려는거임
		request.setCharacterEncoding("utf-8");
		
		if(command.equals("/BoardListAction.do")) {//등록글 출력
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/list.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardWriteFrom.do")) {//글 등록 페이지 출력
			requestLoginName(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board/writeForm.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardWriteAction.do")) {//새로운 글쓰기
			requestBoardWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("./BoardListAction.do");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardViewAction.do")) {//선택된 글 상세페이지 가져오기
			requestBoardView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./boardView.do");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardView.do")) {//글 상세페이지 출력하기
			RequestDispatcher rd = request.getRequestDispatcher("./board/view.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardUpdateAction.do")) {//선택된 글의 조회수 증가하기
			requestBoardUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		else if(command.equals("/BoardDeleteAction.do")) {
			requestBoardDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/BoardListAction.do");
			rd.forward(request, response);
		}
		
	}
	
	//선택글 삭제

	private void requestBoardDelete(HttpServletRequest request) {
		
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDAO dao = BoardDAO.getInstance();
		dao.deleteBoard(num);
		
	}

	//선택글 내용 수정하기
	private void requestBoardUpdate(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = new BoardDTO();
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setContent(request.getParameter("content"));
		board.setSubject(request.getParameter("subject"));
		
		SimpleDateFormat formatter = new SimpleDateFormat();
		String regist_day  = formatter.format(new java.util.Date());
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}
	

	//선택된 글 상세페이지 가져오기
	private void requestBoardView(HttpServletRequest request) {
		
		BoardDAO dao = BoardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = dao.getBOardByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("page", pageNum);
		request.setAttribute("board", board);
		
	}

	//새로운 글쓰기
	private void requestBoardWrite(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("contnt"));
		
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("subject"));
		System.out.println(request.getParameter("content"));
		
		SimpleDateFormat formatter = new SimpleDateFormat();
		String regist_day  = formatter.format(new java.util.Date());
		
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());
		
		dao.insertBoard(board);
	}

	private void requestLoginName(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		BoardDAO dao = BoardDAO.getInstance();
		
		String name = dao.getLoginNameBYId(id);
		
		request.setAttribute("name", name);
		
	}

	//등록된 글목록 가져오기
	private void requestBoardList(HttpServletRequest request) {
		BoardDAO dao = BoardDAO.getInstance();
		List<BoardDTO>boardlist = new ArrayList<BoardDTO>();
		
		int pageNum =1;
		int limit=LISTCOUNT;
		
		if(request.getParameter("pageNum")!=null)
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		int total_record = dao.getListCount(items, text);
		
		boardlist= dao.getBoardList(pageNum, limit, items, text);
		
		int total_page = 0;
		if(total_page % limit ==0) {
			total_page = total_record/limit;
			Math.floor(total_page);
		}
		else {
			total_page = total_record/limit;
			Math.floor(total_page);
			total_page = total_page+1;
		}
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("total_page", total_page);
		request.setAttribute("total_record", total_record);
		request.setAttribute("boardlist", boardlist);
		
	}
	
	

}
