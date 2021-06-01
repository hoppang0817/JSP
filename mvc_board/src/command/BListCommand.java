package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;
import dto.bDto;

public class BListCommand implements BCommand{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BDao dao = new BDao();
		ArrayList<bDto>v = dao.list();
		request.setAttribute("v", v);
	}

}
