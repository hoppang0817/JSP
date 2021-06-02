package frontController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;

import command.BCommand;
import command.BContentCommand;
import command.BDeleteCommand;
import command.BListCommand;
import command.BModifyCommand;
import command.BReplyCommand;
import command.BReplyViewCommand;
import command.BWriteCommand;
import command.search;


@WebServlet("*.do")
public class BFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BFrontController() {
        super();
    }

	//어떤 응답이와도 actionDo로감
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request,response);
	}
	protected void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		//한글출력을 위해사용
		//UTF-8로해줘야함
		request.setCharacterEncoding("UTF-8");
		
		String viewPage = null;
		BCommand command = null;
		
		//전체 주소중에 요청한 주소를 알기위해 사용
		String uri = request.getRequestURI();
		System.out.println("uri :" + uri);
		String conPath = request.getContextPath();
		System.out.println("conPath : "+ conPath);
		String com = uri.substring(conPath.length());
		System.out.println("com :"+ com);
		
		//요청주소가  write_view.do 이면 viewPage에 write_view.jsp 를 담는다 마지막엔 포워드를 사용해 jsp페이지로 위임함
		//포워드 동영상보기!!
		if(com.equals("/write_view.do")) {
			viewPage = "write_view.jsp";
		}
		else if(com.equals("/write.do")) {
			command = new BWriteCommand();
			command.execute(request,response);
			viewPage ="list.do";
		}
		else if(com.equals("/list.do")) {
			command = new BListCommand();
			command.execute(request, response);
			viewPage = "search.do";
		}
		else if(com.equals("/content_view.do")) {
			command = new BContentCommand();
			command.execute(request, response);
			viewPage ="content_view.jsp";
		}
		else if(com.equals("/modify.do")) { //수정
			command = new BModifyCommand();
			command.execute(request, response);
			viewPage ="list.do";
		}
		else if(com.equals("/delete.do")) {
			command = new BDeleteCommand();
			command.execute(request, response);
			viewPage ="list.do";
		}
		else if(com.equals("/reply_view.do")) {
			command = new BReplyViewCommand();
			command.execute(request, response);
			viewPage ="reply_view.jsp";
		}
		else if(com.equals("/reply.do")) {
			command = new BReplyCommand();
			command.execute(request, response);
			viewPage ="list.do";
		}
		else if(com.equals("/search.do")) {
			command=new search();
			command.execute(request, response);
			viewPage ="list.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
