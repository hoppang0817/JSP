package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ClassDao;
import Dao.paymentDao;

public class changeClass implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("m_id");
		String num = request.getParameter("c_num");
		ClassDao dao = ClassDao.getInstance();
		paymentDao pdao = paymentDao.getInstance();
		dao.changeClass(id, num);
		pdao.changepayment(id, num);
	}

}
