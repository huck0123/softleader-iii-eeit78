package tw.org.iiiedu.demo.web;

import java.util.HashMap;
import java.util.Map;

import tw.org.iiiedu.demo.form.DemoForm;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class DemoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private DemoForm form;
	private Map<String, String> errorMsgs;

	public DemoForm getForm() {
		return form;
	}

	public void setForm(DemoForm form) {
		this.form = form;
	}

	public Map<String, String> getErrorMsgs() {
		return errorMsgs;
	}
	
	public String getHahaha() {
		return "HAHAHA";
	}
	
	public String page() {
		return "success";
	}
	
	public String execute() {
		Map<String, Object> session = ActionContext.getContext().getSession();
		errorMsgs = new HashMap<>();
		
		System.out.println(form);
		
		if (form != null) {
			if (form.getCode() == null || form.getCode().equals("")) {
				errorMsgs.put("code", "code is empty");
			}
			if (form.getName() == null || form.getName().equals("")) {
				errorMsgs.put("name", "name is empty");
			}
		} else {
			errorMsgs.put("code", "code is empty");
			errorMsgs.put("name", "name is empty");
		}
		
		session.put("user", "demo user");
		
		if (!errorMsgs.isEmpty()) {
			return "fail";
		} else {
			return "success";
		}
	}
	
}
