package tw.org.iiiedu.thegivers.interceptor;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.service.GiverService;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class CountInterceptor extends AbstractInterceptor{

	@Autowired
	private GiverService gService;
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		
		ServletContext context = ServletActionContext.getServletContext();
		
		if(context.getAttribute("giverCount") == null){
			context.setAttribute("giverCount", gService.getCount());
		}
		
		
		
	
		return invocation.invoke();
	}

}
