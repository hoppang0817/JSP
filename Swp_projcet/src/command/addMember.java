package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.imageio.ImageIO;
import javax.mail.BodyPart;
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
		
		
		
		//바코드 이미지 저장
		String str = id;
        try {
             Barcode barcode = BarcodeFactory.createCode128(str);
             System.out.println(barcode);
             String dirPath = "C:\\upload\\"; // 이미지 파일 생성될 경로
             String filePath = dirPath+id+".png";
             File cImg = new File(filePath);
             BarcodeImageHandler.savePNG(barcode, cImg);
       } catch (Exception e) {
            e.printStackTrace();
       }
	
		
//		BufferedImage image1 = null; 
//		try {
//		//로컬 파일을 사용하는 경우
//		File imageFile = new File("C:\\upload\\"+id+".png"); 
//		image1 = ImageIO.read(imageFile);
//		}catch (Exception e) {
//			e.printStackTrace();
//		}


		final String user="tndusdlzzz__@naver.com";
		final String password="hoppang0817";
		
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
			//수신자 이메일
			message.addRecipient(Message.RecipientType.TO, new InternetAddress("tndusdlzzz__@naver.com")); 
			//이메일 제목
			message.setSubject("KTKO SMTP TEST1111"); 
			
			
		      MimeBodyPart mbp1 = new MimeBodyPart();
		      
		      	//내용
	            mbp1.setText("가입을 축하합니다 "+name+" 회원님 \n 회원번호: "+ id+" 입니다.");
	            
	            
	            String fileaddress="C:\\upload\\"+id+".png";
	            MimeBodyPart mbp2 = new MimeBodyPart();
	            FileDataSource  fds = new FileDataSource(fileaddress); //파일 읽어오기
	            mbp2.setDataHandler(new DataHandler(fds));                      //파일 첨부
	            mbp2.setFileName(fds.getName());
	            
	            Multipart mp = new MimeMultipart();
	            mp.addBodyPart(mbp1);
	            mp.addBodyPart(mbp2);
	            
	            message.setContent(mp);
	            
	            Transport.send(message);
	            
	            
//			//내용
//			message.setText("가입을 축하합니다 "+name+" 회원님 \n 회원번호: "+ id+" 입니다. \n"+ image1);
//			// send the message 
//			Transport.send(message); 
	            
			System.out.println("Success Message Send"); 
			} catch(MessagingException e) { 
				e.printStackTrace(); 
			}

	}

}
