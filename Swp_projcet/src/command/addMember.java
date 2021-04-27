package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

public class addMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("Name");
		String phoen = request.getParameter("fnum")+"-"+request.getParameter("snum")+"-"+request.getParameter("lnum");
		String arrd = request.getParameter("address1")+request.getParameter("address2");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");				
		String sex = request.getParameter("sex");
		String classNum = request.getParameter("classNum");
		
		MemberDao dao = MemberDao.getInstance();
		dao.addMember(name, phoen, arrd, sex, email, classNum);
		
	}

}
