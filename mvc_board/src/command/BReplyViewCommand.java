package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;
import dto.bDto;

public class BReplyViewCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String bId = request.getParameter("bId");
		BDao dao= new BDao();
		bDto dto = dao.reply_view(bId);
		
		request.setAttribute("reply_view",dto);

	}

}
