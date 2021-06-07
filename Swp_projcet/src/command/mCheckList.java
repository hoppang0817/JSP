package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.checkDao;
import Dto.mCheck;

public class mCheckList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("Id");
		checkDao dao = checkDao.getInstance();
		ArrayList<mCheck>list=dao.listPerOne(id);
		request.setAttribute("list", list);
	}

}
