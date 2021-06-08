package command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.MemberDao;
import Dto.MemberDto;

public class findId implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("���� ������");
		String name = request.getParameter("m_name");
		System.out.println("���� �̸���:"+name);
		String num = request.getParameter("c_num");
		System.out.println("���� ������ȣ :"+num);
		try {
			response.getWriter().write(getJSON(name));
		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	
	//�����͸� Json�������� �Ľ�
	public String getJSON(String name) {
		System.out.println("�̸��� �޴°Ŵ�?"+name);
		if(name == null) name="";
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		MemberDao dao = MemberDao.getInstance();
		ArrayList<MemberDto> list = dao.findIdlist(name);
		for(int i=0;i<list.size();i++) {
			result.append("[{\"value\":\""+ list.get(i).getM_id()+"\"},");
			result.append("{\"value\":\""+ list.get(i).getM_name()+"\"},");
			result.append("{\"value\":\""+ list.get(i).getM_phone()+"\"},");
			result.append("{\"value\":\""+ list.get(i).getM_email()+"\"}],");
		}
		result.append("]}");
		System.out.println(result);
		return result.toString();
	}

}
