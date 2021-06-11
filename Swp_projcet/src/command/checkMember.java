package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Member;

import Dao.MemberDao;
import Dao.checkDao;

public class checkMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		checkDao dao = checkDao.getInstance();
		String id = request.getParameter("m_id");
		int cnt = dao.list(id);
		if(cnt == 1) {
			request.setAttribute("cnt", cnt);
		}
		else if(cnt == 0) {
			dao.checkMember(id);
			request.setAttribute("cnt", cnt);
		}
		else if(cnt == 2) {
			request.setAttribute("cnt", cnt);
		}

	}

}
