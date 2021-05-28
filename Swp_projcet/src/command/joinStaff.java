package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.StaffDao;

public class joinStaff implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr = "("+request.getParameter("post_code")+")"+request.getParameter("address1")+","+request.getParameter("address2");
		
		StaffDao dao = StaffDao.getInstance();
		dao.insertStaff(id, pw, name, phone, addr);
		
	}

}
