package ch18.com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ch18.com.model.LoginBean;

public class ControllerServlet extends HttpServlet{

	
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req,resp);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8"); //한글 가능하게
		
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		LoginBean bean = new LoginBean();
		bean.setId(id);
		bean.setPassword(password);
		request.setAttribute("bean", bean); //setAttribute("객체명",객체) 객체명에 객체를 담아 jsp에서 request.getAttribute("객체명")으로 받아올수있음
		
		boolean status = bean.validate();
		
		if(status) {
			RequestDispatcher rd = request.getRequestDispatcher("mvc_success.jsp"); //요청 처리 결과를 보여줄 응답 페이지로 이동하는 형식
			rd.forward(request, response);//현재 페이지에서 요청페이지로 정보를 그대로 전달하고,뷰페이지가 이동해도 처음 요청된URL울 계속유지 시기는 방법
		}else {
			 RequestDispatcher rd = request.getRequestDispatcher("mvc_error.jsp");
			 rd.forward(request, response);
		}
		
	}

	
}
