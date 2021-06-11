package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class inputUesr implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String l_num = request.getParameter("l_num");
		String page = request.getParameter("page");
		request.setAttribute("l_num", Integer.valueOf(l_num));
		request.setAttribute("page", page);
	}

}
