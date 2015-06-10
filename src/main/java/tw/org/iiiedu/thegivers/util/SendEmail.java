package tw.org.iiiedu.thegivers.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {
	private String email;
	private String newPassword;
	
	public SendEmail(){
		
	}
	
	public SendEmail(String email, String newPassword){
		this.email = email;
		this.newPassword = newPassword;
	}
	
	public void email(){
		final String username = "Thegivers2016@gmail.com";
		final String password = "eeit7804";

		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");

		Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(username, password);
					}
				});

		try {

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("Thegivers2016@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(email));
			message.setSubject("新密碼");
			message.setText("http://thegivers.cloudapp.net/softleader-iii-eeit78/login/login"
					+ "\n\n 您的新密碼為:  " + newPassword + "\n\n請記得變更密碼");
//			message.setText("http://localhost:8080/softleader-iii-eeit78/login/login"
//					+ "\n\n 您的新密碼為:  " + newPassword + "\n\n請記得變更密碼");
			
			Transport.send(message);

		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
	
}
