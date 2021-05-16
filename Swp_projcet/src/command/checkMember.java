package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.checkDao;

public class checkMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		checkDao dao = checkDao.getInstance();
		String id = request.getParameter("m_id");
		dao.checkMember(id);
	}

}
