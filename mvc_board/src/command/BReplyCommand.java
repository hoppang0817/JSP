package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;
import dto.bDto;

public class BReplyCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//request로 넘어온 값은 string으로 만 받을 수있음
		String bId =request.getParameter("bId");
		String bName =request.getParameter("bName");
		String bTitle =request.getParameter("bTitle");
		String bContent =request.getParameter("bContent");
		String bGroup =request.getParameter("bGroup");
		String bStep =request.getParameter("bStep");
		String bIndent =request.getParameter("bIndent");
		
		
		BDao dao = new BDao();
		dao.reply(bId, bName, bTitle, bContent, bGroup, bStep, bIndent);

	}

}
