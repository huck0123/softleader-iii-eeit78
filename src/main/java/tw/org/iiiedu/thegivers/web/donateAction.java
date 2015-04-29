package tw.org.iiiedu.thegivers.web;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
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

public class donateAction extends ActionSupport {
	
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	@Override
	public String execute() throws Exception {
		
log.debug("++++++++++++++++++++++++++++++donateAction");
		
		
		
			return SUCCESS;
		} 
}
