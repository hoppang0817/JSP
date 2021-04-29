package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dto.ClassDto;

public class updateClassView implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		ClassDao dao = ClassDao.getInstance();
		ClassDto dto = dao.updateClassView(num);
		
		request.setAttribute("classView", dto);
	}

}
