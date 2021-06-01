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
		int startPage = 0; // limit의 시작값 -> 첫 limit 0,10
		int onePageCnt=3; // 한페이지에 출력할 데이터 수
		System.out.println(keyField);
		System.out.println(keyWord);
		ArrayList<bDto> v=dao.selectPage(keyField, keyWord, startPage, onePageCnt);
		
		request.setAttribute("v", v);
		request.setAttribute("keyWord", keyWord);
		request.setAttribute("keyField", keyField);
	}

}
