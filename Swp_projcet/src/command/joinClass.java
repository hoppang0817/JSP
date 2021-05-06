package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dao.paymentDao;

public class joinClass implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String num = request.getParameter("c_num");
		String id = request.getParameter("Id");
		ClassDao dao = ClassDao.getInstance();
		paymentDao pdao = paymentDao.getInstance();
		dao.joinClass(num, id);
		pdao.insertpay(num, id);
		
	}

}
