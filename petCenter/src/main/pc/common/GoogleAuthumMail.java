package main.pc.common;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;

public class GoogleAuthumMail {
	Logger logger = LogManager.getLogger(getClass());
	
	public void authumMail(String resiveMail, String sendMsg) {
		logger.info("authumMail() 함수 진입");
		
		String mailSubject = "임시 인증번호 메일입니다.";
		sendMsg = "<h2 style='color:blue'> " + sendMsg + " </h2>";
		logger.info("resiveMail >>> : " + resiveMail);
		logger.info("sendMsg >>> : " + sendMsg);
		
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
		
		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("hgkang1316@gmail.com", "xejzestmvqisbjet");
			}
		});
		
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(resiveMail, "관리자", "UTF-8"));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(resiveMail));
			message.setSubject(mailSubject);
			message.setContent(sendMsg, "text/html; charset=utf-8");
			
			Transport.send(message);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String resiveMail = "potone1316@gmail.com";
		String sendMsg = "<h2 style='color:blue'>안녕하세요 테스트 메일 입니다.</h2>";
		
		GoogleAuthumMail gas = new GoogleAuthumMail();
		gas.authumMail(resiveMail, sendMsg);
	}

}
