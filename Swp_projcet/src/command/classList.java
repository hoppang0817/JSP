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
		String startPage = request.getParameter("page");
		int cPage =0;
		int onePageCnt = 10;
		
		if(startPage != null){ 
			cPage = (Integer.parseInt(startPage)-1)*onePageCnt;
		}
		ArrayList<ClassDto>list = dao.classList(cPage, onePageCnt);
		request.setAttribute("list", list);


	}

}
