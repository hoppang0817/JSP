package command;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BDao;
import dto.bDto;

public class search implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BDao dao = new BDao();
		String keyField = request.getParameter("keyField");
		String keyWord = request.getParameter("keyWord");
	
		String tempStart = request.getParameter("page"); // 현재 페이지 
		int cPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=3; // 한페이지에 출력할 데이터 수
		
		if(tempStart != null){ // 처음에는 실행되지 않는다.
			cPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}
		
		
		ArrayList<bDto> v=dao.selectPage(keyField, keyWord, cPage, onePageCnt);
		
		request.setAttribute("v", v);
		request.setAttribute("keyWord1", keyWord);
		request.setAttribute("keyField", keyField);
		System.out.println(tempStart);
		request.setAttribute("page", tempStart);
	}

}
