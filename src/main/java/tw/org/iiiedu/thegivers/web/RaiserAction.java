package tw.org.iiiedu.thegivers.web;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.RaiserForm;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.RaiserService;

import com.opensymphony.xwork2.ActionSupport;

public class RaiserAction extends ActionSupport implements ServletRequestAware{
	@Autowired
	RaiserService raiserService;
	
	private RaiserForm raiserForm;
	

	public RaiserForm getRaiserForm() {
		return raiserForm;
	}

	public void setRaiserForm(RaiserForm raiserForm) {
		this.raiserForm = raiserForm;
	}

	

	public String insert() throws Exception {
		RaiserModel rm = new RaiserModel();
		
		rm.setAccount(raiserForm.getAccount());	
		rm.setPasswd(raiserForm.getPasswd());	
		rm.setName(raiserForm.getName());	
		rm.setTel(raiserForm.getTel());	
		rm.setContactPerson(raiserForm.getContactPerson());	
		rm.setContactTel(raiserForm.getContactTel());	
		rm.setEmail(raiserForm.getEmail());	
		rm.setAddress(raiserForm.getAddress());	
		rm.setDetail(raiserForm.getDetail());	
		rm.setVideoUrl(raiserForm.getVideoUrl());	
		
		rm = raiserService.register(rm);
		if (rm != null) {
			return "insert";
		} else {
			return "error";
		}
	}
	
	public String select(){
		RaiserModel rm = new RaiserModel();
		rm = raiserService.getByAccount(raiserForm.getAccount());
		if (rm != null) {
			return "select";
		} else {
			return "error";
		}
	}

	public String update(){
		RaiserModel rm = new RaiserModel();
		rm.setAccount(raiserForm.getAccount());	
		rm.setPasswd(raiserForm.getPasswd());	
		rm.setName(raiserForm.getName());	
		rm.setTel(raiserForm.getTel());	
		rm.setContactPerson(raiserForm.getContactPerson());	
		rm.setContactTel(raiserForm.getContactTel());	
		rm.setEmail(raiserForm.getEmail());	
		rm.setAddress(raiserForm.getAddress());	
		rm.setDetail(raiserForm.getDetail());	
		rm.setVideoUrl(raiserForm.getVideoUrl());	
		rm = raiserService.dataUpdate(rm);
		if (rm != null) {
			return "update";
		} else {
			return "error";
		}
	}
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		
	}
	
	

}
