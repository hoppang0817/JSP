package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dao.MemberDao;
import Dto.MemberDto;

public class joinMemberList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		ClassDao dao = ClassDao.getInstance();
		ArrayList<MemberDto> dto = dao.joinClassView(num);
		 
		request.setAttribute("member_view", dto);
	}

}
