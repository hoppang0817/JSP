package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class searchList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		MemberDao dao = MemberDao.getInstance();
		String search = request.getParameter("search");
		String searchKey = request.getParameter("searchKey");
		System.out.println("command : "+search);
		
		String startPage = request.getParameter("page");
		System.out.println("command :" +startPage);
		int cPage =0;
		int onePageCnt = 10;
		
		if(startPage != null){ 
			cPage = (Integer.parseInt(startPage)-1)*onePageCnt;
		}
		System.out.println(cPage);
		
	
		
		ArrayList<MemberDto> mdtos = dao.searchList(search, searchKey, cPage, onePageCnt);
		
		request.setAttribute("list", mdtos);
		request.setAttribute("search", search);
		request.setAttribute("searchKey", searchKey);

	}

}
