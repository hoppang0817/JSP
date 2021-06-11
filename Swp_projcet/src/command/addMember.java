package command;

import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Dao.MemberDao;
import net.sourceforge.barbecue.Barcode;
import net.sourceforge.barbecue.BarcodeFactory;
import net.sourceforge.barbecue.BarcodeImageHandler;

public class addMember implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("Name");
		String phone = request.getParameter("fnum")+"-"+request.getParameter("snum")+"-"+request.getParameter("lnum");
		String arrd = "("+request.getParameter("post_code")+")"+request.getParameter("address1")+","+request.getParameter("address2");
		String email = request.getParameter("email1")+"@"+request.getParameter("email2");				
		String sex = request.getParameter("sex");

		
		MemberDao dao = MemberDao.getInstance();
		dao.addMember(name, phone, arrd, sex, email, null);
		
		
		
		//바코드 생성
		String str = id;
        try {
             Barcode barcode = BarcodeFactory.createCode128(str);
             System.out.println(barcode);
             String dirPath = "C:\\upload\\"; // 바코드 생성 이미지 저장 위치
             String filePath = dirPath+id+".png";
             File cImg = new File(filePath);
             BarcodeImageHandler.savePNG(barcode, cImg);
       } catch (Exception e) {
            e.printStackTrace();
       }
	
		
//		BufferedImage image1 = null; 
//		try {
//		//濡�而� ���쇱�� �ъ�⑺���� 寃쎌��
//		File imageFile = new File("C:\\upload\\"+id+".png"); 
//		image1 = ImageIO.read(imageFile);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}


        //가입 이메일 전송
		final String user=""; //발신자 이메일 아이디
		final String password=""; // 발신자 이메일 패스워드
		
		//네이버 이메일 설정
		Properties prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 587); 
		prop.put("mail.smtp.auth", "true");
		
		Session session = Session.getDefaultInstance(prop, new javax.mail.Authenticator() { 
			protected PasswordAuthentication getPasswordAuthentication(){ 
				return new PasswordAuthentication(user, password);
				} 
			});


		try { 
			MimeMessage message = new MimeMessage(session); 
			message.setFrom(new InternetAddress(user));
			//수신자 메일 주소
			System.out.println(email);
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(email)); 
			//이메일 제목
			message.setSubject("KTKO SMTP TEST1111"); 
			
			
		      MimeBodyPart mbp1 = new MimeBodyPart();
		      
		      	//이메일 전송 내용
	            mbp1.setText("회원 등록 을 축하합니다. "+name+"/n 회원님 아이디는: "+ id+" 입니다.");
	            
	            
	            String fileaddress="C:\\upload\\"+id+".png";
	            MimeBodyPart mbp2 = new MimeBodyPart();
	            FileDataSource  fds = new FileDataSource(fileaddress); //바코드 이미지 경로
	            mbp2.setDataHandler(new DataHandler(fds));                     
	            mbp2.setFileName(fds.getName());
	            
	            Multipart mp = new MimeMultipart();
	            mp.addBodyPart(mbp1);
	            mp.addBodyPart(mbp2);
	            
	            message.setContent(mp);
	            
	            Transport.send(message); //전송
	            
	        //이메일 전송 성공시
			System.out.println("Success Message Send"); 
			} catch(MessagingException e) { 
				e.printStackTrace(); 
			}

	}

}
