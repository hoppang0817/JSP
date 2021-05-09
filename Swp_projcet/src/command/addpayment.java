package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.paymentDao;

public class addpayment implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		paymentDao dao = paymentDao.getInstance();
		dao.addpayment();
	}

}
