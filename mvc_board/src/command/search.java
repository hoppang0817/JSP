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
		System.out.println(keyWord);
		
		String tempStart = request.getParameter("page"); // ���� ���댁� 


		int cPage = 0; // limit�� ����媛� -> 泥� limit 0,10
		int onePageCnt=3; // �����댁��� 異��ν�� �곗�댄�� ��
		
		if(tempStart != null){ // 泥������� �ㅽ����吏� ������.
			cPage = (Integer.parseInt(tempStart)-1)*onePageCnt;
		}
		
		
		ArrayList<bDto> v=dao.selectPage(keyField, keyWord, cPage, onePageCnt);
		
		request.setAttribute("v", v);
		request.setAttribute("keyWord1", keyWord);
		request.setAttribute("keyField", keyField);
	}

}
