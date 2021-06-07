package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LockerDao;

public class changeUesr implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("m_id");
		String num = request.getParameter("l_num");
		LockerDao dao = LockerDao.getInstance();
		dao.changeUesr(num, id);
	}

}
