package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class findId implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.findIdlist(name);
		request.setAttribute("list", list);

	}

}
