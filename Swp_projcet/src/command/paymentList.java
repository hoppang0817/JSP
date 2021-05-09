package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.paymentDao;
import Dto.paymentDto;

public class paymentList implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("Id");
		paymentDao dao = paymentDao.getInstance();
		ArrayList<paymentDto> list = dao.paymentList(id);
		request.setAttribute("list", list);

	}

}
