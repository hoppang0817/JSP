package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class searchList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String search = request.getParameter("search");
		String searchKey = request.getParameter("searchKey");
		
		System.out.println(search);
		System.out.println(searchKey);
		
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> mdtos = dao.searchList(search, searchKey);
		
		request.setAttribute("list", mdtos);

	}

}
