package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LockerDao;

public class lockerUesr implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String num = request.getParameter("l_num");
		String page = request.getParameter("page");
		LockerDao dao = LockerDao.getInstance();
		dao.LockerUesr(num, id);
		request.setAttribute("page", page);
	}

}
