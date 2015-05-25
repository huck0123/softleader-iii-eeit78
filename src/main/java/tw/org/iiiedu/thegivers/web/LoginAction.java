package tw.org.iiiedu.thegivers.web;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.model.AdminModel;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.AdminService;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.service.RaiserService;
import tw.org.iiiedu.thegivers.util.IdentityImage;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GiverService giverService;
	@Autowired 
	private RaiserService raiserService;
	@Autowired 
	private AdminService adminService;
	
	private String account;
	private String passwd;
	private InputStream inputStream;
	private String identityString;
	private HttpSession session;
	
	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String getIdentityString() {
		return identityString;
	}

	public void setIdentityString(String identityString) {
		this.identityString = identityString;
	}

	
	
	
	public String IdentityImage() throws IOException{
		
		Random random = new Random();
		String randomString = IdentityImage.getRandomString();
		
		session = ServletActionContext.getRequest().getSession();
		session.setAttribute("identityString", randomString);
		
		int width = 200;
		int height = 60;

		Color color = IdentityImage.getRandomColor();
		Color reverse = IdentityImage.getReverseColor(color);

		BufferedImage bi = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		Graphics2D g = bi.createGraphics();
		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 30));
		g.setColor(color);
		g.fillRect(0, 0, width, height);
		g.setColor(reverse);
		g.drawString(randomString, 40, 40);
		for (int i = 0, n = 250; i < n; i++) {
			g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
		}
		
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		ImageIO.write(bi, "png", baos);
		inputStream = new ByteArrayInputStream(baos.toByteArray());

		return "IdentityImage";
	}
	
	
	@Override
	public String execute() throws Exception {

		HttpSession preSession = ServletActionContext.getRequest().getSession(false);
		if(!preSession.getAttribute("identityString").equals(identityString)){
			return "login";
		}
		if(preSession.getAttribute("giver") != null || preSession.getAttribute("raiser") != null ||
				preSession.getAttribute("admin") != null){
			preSession.invalidate();
		}
		
		GiverModel gm = giverService.login(account.trim(),passwd);
		HttpSession session = ServletActionContext.getRequest()
				.getSession();
		if (gm != null) {
			if(!gm.isValid()){
				ServletActionContext.getRequest().setAttribute("wrongLogin",
						"帳號已被封鎖");
				return "login";
			}
			session.setAttribute("giver", gm);
			try { // *工作2: 看看有無來源網頁 (-如有:則重導之)
				String location = (String) session.getAttribute("location");
//				System.out.println("location(LoginHandler)=" + location);
				log.debug("loginAction----location:{}---GiverModel:{}",location, gm);
				if (location != null) {
					session.removeAttribute("location");
					HttpServletResponse response = ServletActionContext
							.getResponse();
					response.sendRedirect(location);
					return null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return SUCCESS;
		} 
		
		
		RaiserModel rm = raiserService.login(account.trim(),passwd);
		if (rm != null) {
			if(!rm.isValid()){
				ServletActionContext.getRequest().setAttribute("wrongLogin",
						"帳號已被封鎖");
				return "login";
			}
			session.setAttribute("raiser", rm);
			try { // *工作2: 看看有無來源網頁 (-如有:則重導之)
				String location = (String) session.getAttribute("location");
				System.out.println("location(LoginHandler)=" + location);
				if (location != null) {
					session.removeAttribute("location");
					HttpServletResponse response = ServletActionContext
							.getResponse();
					response.sendRedirect(location);
					return null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return SUCCESS;
		} 
		
		
		AdminModel am = adminService.login(account.trim(),passwd);
		if (am != null) {
			session.setAttribute("admin", am);
			try { // *工作2: 看看有無來源網頁 (-如有:則重導之)
				String location = (String) session.getAttribute("location");
				System.out.println("location(LoginHandler)=" + location);
				if (location != null) {
					session.removeAttribute("location");
					HttpServletResponse response = ServletActionContext
							.getResponse();
					response.sendRedirect(location);
					return null;
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
			return SUCCESS;
		} 
		
			ServletActionContext.getRequest().setAttribute("wrongLogin",
					"wrong account or password");
			return "login";
			
	}
}
