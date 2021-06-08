package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.LockerDao;
import Dto.LockerDto;

public class lockerList implements Command {

	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LockerDao dao = LockerDao.getInstance();
		String startPage = request.getParameter("page");
		int cPage =0;
		int onePageCnt = 10;
		if(startPage != null){ 
			cPage = (Integer.parseInt(startPage)-1)*onePageCnt;
		}
		ArrayList<LockerDto> list = dao.list(cPage, onePageCnt);
		request.setAttribute("list", list);
	}
}
