package command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;

public class BWriteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//여기 수행할 작업 코딩
		//글쓰기 기능  write_view.jsp에서 쓴 내용을 write.do로 서블릿을 걸처 여기로옴
		//form에서 쓴 데이터를 request해서 dao에있는 DB와연결한 메소드로보내 글추가함
		String bName = request.getParameter("bName");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		
		BDao dao = new BDao();
		dao.write(bName,bTitle,bContent);
		
	}

}
