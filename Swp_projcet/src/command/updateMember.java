package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

public class updateMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("Id");
		String name = request.getParameter("Name");
		String phone = request.getParameter("fnum")+"-"+request.getParameter("snum")+"-"+request.getParameter("lnum");
		String arrd = "("+request.getParameter("post_code")+")"+request.getParameter("address1")+","+request.getParameter("address2");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");				
		String sex = request.getParameter("sex");
		//String classNum = request.getParameter("classNum");

		
		MemberDao dao = MemberDao.getInstance();
		dao.update(id, name, phone, arrd, sex, email);

	}

}
