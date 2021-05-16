package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

public class nextid implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = MemberDao.getInstance();
		int id = dao.nextid();
		request.setAttribute("id",id);

	}

}
