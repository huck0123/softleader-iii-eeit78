package tw.org.iiiedu.thegivers.web;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

public class LogoutAction extends ActionSupport {

	HttpSession session;

	// logout
	public String logout() {

		session = ServletActionContext.getRequest().getSession(false);
		if(session != null){
			session.invalidate();
		}

		return "success";

	}
}
