package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;

public class joinClass implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		String id = request.getParameter("Id");
		ClassDao dao = ClassDao.getInstance();
		dao.ClassAppilcation(num, id);
		
	}

}
