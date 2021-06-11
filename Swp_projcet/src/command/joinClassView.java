
package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dto.MemberDto;

public class joinClassView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		String page = request.getParameter("page");
		System.out.println("왜여기로오는걸까 :"+num);
		ClassDao dao = ClassDao.getInstance();
		ArrayList<MemberDto> dto = dao.joinClassView(num);
		 
		request.setAttribute("member_view", dto);
		request.setAttribute("c_num", num);
		request.setAttribute("page", page);
	}

}
