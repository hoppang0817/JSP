package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.MemberDao;
import Dao.StaffDao;
import Dto.MemberDto;
import command.changeUesr;
import command.joinClass;
import command.joinClassView;
import command.joinMemberList;
import command.joinStaff;
import command.lockerList;
import command.lockerUesr;
import command.mCheckList;
import command.modalList;
import command.nextid;
import command.paymentList;
import command.refundLocker;
import command.searchList;
import command.Command;
import command.MemberList;
import command.addClass;
import command.addMember;
import command.addpayment;
import command.changeClass;
import command.changeClassView;
import command.changeUesrNum;
import command.checkMember;
import command.classList;
import command.endDayMember;
import command.extend;
import command.findId;
import command.findIdview;
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
		//한글 깨짐 방지를 위해 utf-8로 인코딩
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");

		String viewPage = null;
		Command command = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		//로그인
		if (com.equals("/LoginAction.do")) {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");

			StaffDao dao = StaffDao.getInstance();

			int result = dao.login(id, pw);

			if (result == 1) {
				request.setAttribute("loginResult", result);
				HttpSession session = request.getSession();
				session.setAttribute("sessionId", id);
				viewPage = "main.jsp";

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
		else if(com.equals("/joinStaff.do")) {
			command = new joinStaff();
			command.execute(request, response);
			viewPage = "Login.jsp";
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
			viewPage = "searchList.do";
		}
		//회원리스트 출력
		/*else if (com.equals("/MemberList.do")) {
			command = new MemberList();
			command.execute(request, response);
			viewPage = "MemberList.jsp";
		}*/
		
		else if(com.equals("/searchList.do")) {
			command = new searchList();
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
			viewPage = "searchList.do";
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
			System.out.println("여기들오왔냐");
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
			System.out.println("들어오나요?");
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
		else if(com.equals("/findIdview.do")) {
			command = new findIdview();
			command.execute(request, response);
			viewPage = "findId.jsp";
		}
		else if(com.equals("/changeUesrNum.do")) {
			command = new changeUesrNum();
			command.execute(request, response);
			viewPage = "lockerlayer2.jsp";
		}
		else if(com.equals("/changeUesr.do")) {
			command = new changeUesr();
			command.execute(request, response);
			viewPage = "locker.do";
		}
		else if(com.equals("/refundLocker.do")) {
			command = new refundLocker();
			command.execute(request, response);
			viewPage = "locker.do";
		}
		else if(com.equals("/mCheckList.do")) {
			command = new mCheckList();
			command.execute(request, response);
			viewPage = "mCheckList.jsp";
		}
		
		else if(com.equals("/findId.do")) {
			command = new findId();
			command.execute(request, response);
			viewPage = "findId.jsp";
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}
	
}
