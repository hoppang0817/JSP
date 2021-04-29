package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dto.ClassDto;

public class classList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		ClassDao dao = ClassDao.getInstance();
		ArrayList<ClassDto>list = dao.classList();
		request.setAttribute("list", list);

	}

}
