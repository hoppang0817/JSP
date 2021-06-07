package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class changeUesrNum implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String l_num = request.getParameter("l_num");
		String l_end = request.getParameter("l_end");
		System.out.println(l_end);
		request.setAttribute("l_num", Integer.valueOf(l_num));
		request.setAttribute("l_end", l_end);
	}

}
