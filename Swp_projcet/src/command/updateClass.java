package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dto.ClassDto;

public class updateClass implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("num");
		String name = request.getParameter("className");
		String count = request.getParameter("classCount");
		String time = request.getParameter("timeHour") + ":" + request.getParameter("timeMinute");
		String grade = request.getParameter("grade");
		
		ClassDao dao = ClassDao.getInstance();
		dao.updateClass(num, name, count, time, grade);
	}

}
