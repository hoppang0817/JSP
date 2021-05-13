package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LockerDao;
import Dto.LockerDto;

public class lockerList implements Command {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LockerDao dao = LockerDao.getInstance();
		ArrayList<LockerDto> list = dao.list();
		request.setAttribute("list", list);
	}
}
