package command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.StaffDao;

public class StaffLoin implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		StaffDao dao = StaffDao.getInstance();
		
		int result = dao.login(id, pw);
		
		if(result == 1) {
			request.setAttribute("loginResult", result);
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", id);
			RequestDispatcher dispatcher = request.getRequestDispatcher("menu.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else if(result == 0){
			request.setAttribute("loginResult", result);
			RequestDispatcher dispatcher = request.getRequestDispatcher("Login.jsp");
			try {
				dispatcher.forward(request, response);
			} catch (ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

}
