package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class MemberList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> mdtos = dao.MemberList();
		request.setAttribute("list", mdtos);
	}

}
