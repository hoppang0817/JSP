package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class modalList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto>list = dao.modalList(num);
		request.setAttribute("list", list);
	}

}
