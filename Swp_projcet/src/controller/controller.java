package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.StaffDao;
import command.Command;
import command.MemberList;
import command.addMember;
import command.updateMember;
import command.updateMemberView;

@WebServlet("*.do")
public class controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}

	protected void actionDo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo");
		// 한글 입력시 깨짐 방지
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		Command command = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/LoginAction.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			StaffDao dao = StaffDao.getInstance();

			int result = dao.login(id, pw);

			if (result == 1) {
				request.setAttribute("loginResult", result);
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", id);
				viewPage = "menu.jsp";

			} else if (result == 0) {
				request.setAttribute("loginResult", result);
				viewPage = "Login.jsp";
			} else if (result == -1) {
				request.setAttribute("loginResult", result);
				viewPage = "Login.jsp";
			}
		} else if (com.equals("/joinMember.do")) {
			command = new addMember();
			command.execute(request, response);
			viewPage = "MemberList.do";
		} else if (com.equals("/MemberList.do")) {
			command = new MemberList();
			command.execute(request, response);
			viewPage = "MemberList.jsp";
		}else if(com.equals("/updateMemberView.do")) {
			command = new updateMemberView();
			command.execute(request, response);
			viewPage = "updateMember.jsp";
		}
		else if(com.equals("/updateMember.do")) {
			command = new updateMember();
			command.execute(request, response);
			viewPage = "MemberList.do";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
