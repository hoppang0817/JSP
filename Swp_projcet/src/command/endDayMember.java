package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;

public class endDayMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("m_id");
		MemberDao dao= MemberDao.getInstance();
		dao.endDayMember(id);
	}

}
