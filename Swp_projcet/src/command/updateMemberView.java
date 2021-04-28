package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class updateMemberView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
			String m_id = request.getParameter("m_id");
			MemberDao dao = MemberDao.getInstance();
			MemberDto dto = dao.updateView(m_id);
			
			request.setAttribute("MemberView", dto);
	}

}
