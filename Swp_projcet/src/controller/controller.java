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
import command.joinClass;
import command.joinClassView;
import command.joinMemberList;
import command.lockerList;
import command.lockerUesr;
import command.modalList;
import command.nextid;
import command.paymentList;
import command.Command;
import command.MemberList;
import command.addClass;
import command.addMember;
import command.addpayment;
import command.changeClass;
import command.changeClassView;
import command.checkMember;
import command.classList;
import command.endDayMember;
import command.extend;
import command.inputUesr;
import command.updateClass;
import command.updateClassView;
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
		// ��湲� ���μ�� 源⑥� 諛⑹�
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
		}
		else if (com.equals("/nextid.do")) {
	         command = new nextid();
	         command.execute(request, response);
	         viewPage = "JoinMember.jsp";
	      }
		
		//가입
		else if (com.equals("/joinMember.do")) {
			command = new addMember();
			command.execute(request, response);
			viewPage = "addpayment.do";
		}

		//memberList에 select가 시작일 마지막일이 포함 되어있어서 빈 payment추가
		//없으면 회원목록에 등록 회원 안나타남
		else if(com.equals("/addpayment.do")) {
			command = new addpayment();
			command.execute(request, response);
			viewPage = "MemberList.do";
		}
		//회원리스트 출력
		else if (com.equals("/MemberList.do")) {
			command = new MemberList();
			command.execute(request, response);
			viewPage = "MemberList.jsp";
		}
		
		//회원정보 수정
		else if(com.equals("/updateMemberView.do")) {
			command = new updateMemberView();
			command.execute(request, response);
			viewPage = "updateMember.jsp";
		}
		else if(com.equals("/updateMember.do")) {
			command = new updateMember();
			command.execute(request, response);
			viewPage = "MemberList.do";
		}
		//수업 목록
		else if(com.equals("/ClassList.do")) {
			command = new classList();
			command.execute(request, response);
			viewPage = "ClassList.jsp";
		}
		//수업 추가하기
		else if(com.equals("/addClass.do")) {
			command = new addClass();
			command.execute(request, response);
			viewPage = "ClassList.do";
		}
		//수업 정보 수정
		else if(com.equals("/updateClassView.do")) {
			command = new updateClassView();
			command.execute(request, response);
			viewPage = "updateClass.jsp";
		}
		else if(com.equals("/updateClass.do")) {
			command = new updateClass();
			command.execute(request, response);
			viewPage = "ClassList.do";
		}
		//회원 수업신청
		else if(com.equals("/joinClassList.do")) {
			command = new classList();
			command.execute(request, response);
			viewPage = "joinClassList.jsp";
		}
		else if(com.equals("/joinClassView.do")) {
			command = new joinClassView();
			command.execute(request, response);
			viewPage = "joinClass.jsp";
		}
		else if(com.equals("/joinClass.do")) {
			command = new joinClass();
			command.execute(request, response);
			viewPage ="joinClassList.do";
		}
		else if(com.equals("/joinMemberList.do")) {
			command = new joinMemberList();
			command.execute(request, response);
			viewPage = "joinClassView.do";
		}
		//수업 변경
		else if(com.equals("/changeClassView.do")) {
			command = new changeClassView();
			command.execute(request, response);
			viewPage = "changeClass.jsp";
		}
		else if(com.equals("/changeClass.do")) {
			command = new changeClass();
			command.execute(request, response);
			viewPage = "changeClassView.do";
		}
		//결제 관리
		else if(com.equals("/paymentList.do")) {
			command = new paymentList();
			command.execute(request, response);
			viewPage = "paymentView.jsp";
		}
		else if(com.equals("/endDayMember.do")) {
			command = new endDayMember();
			command.execute(request, response);
			viewPage = "MemberList.do";
		}
		else if(com.equals("/modalList.do")) {
			command = new modalList();
			command.execute(request, response);
			viewPage ="layer.jsp";
		}
		else if(com.equals("/locker.do")) {
			command = new lockerList();
			command.execute(request, response);
			viewPage ="locker.jsp";
		}
		else if(com.equals("/LockerUesr.do")) {
			command = new inputUesr();
			command.execute(request, response);
			viewPage ="lockerlayer.jsp";
		}
		else if(com.equals("/inputUesr.do")) {
			command = new lockerUesr();
			command.execute(request, response);
			viewPage = "locker.do";
		}
		else if(com.equals("/extend.do")) {
			command = new extend();
			command.execute(request, response);
			viewPage = "locker.do";
		}
		else if(com.equals("/checkMember.do")){
			command = new checkMember();
			command.execute(request, response);
			viewPage ="checkMember.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
}
