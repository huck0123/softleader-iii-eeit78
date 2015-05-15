package tw.org.iiiedu.thegivers.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.opensymphony.xwork2.ActionSupport;

import tw.org.iiiedu.thegivers.model.AdminModel;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.AdminService;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.service.RaiserService;

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



	@Override
	public String execute() throws Exception {
	
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
