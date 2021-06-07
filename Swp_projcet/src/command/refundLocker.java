package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LockerDao;

public class refundLocker implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("l_num");
		LockerDao dao = LockerDao.getInstance();
		dao.refundLocker(num);
	}

}
