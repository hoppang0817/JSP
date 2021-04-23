package command;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	void execute(HttpServletRequest request, HttpServletResponse response);
	// 액션 코드 작성
}
