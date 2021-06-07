package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class findIdview implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String c_num = request.getParameter("c_num");
		System.out.println("넘길 수업 번호"+c_num);
		request.setAttribute("c_num", Integer.valueOf(c_num));
	}

}
