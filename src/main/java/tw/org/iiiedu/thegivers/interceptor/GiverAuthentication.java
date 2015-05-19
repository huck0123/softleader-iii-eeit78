package tw.org.iiiedu.thegivers.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.junit.runner.Request;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class GiverAuthentication extends AbstractInterceptor {

	public String intercept(ActionInvocation invocation) throws Exception {

		// 從ActionInvocation取得ActionContext
		ActionContext ctx = invocation.getInvocationContext();
		// 從ActionContext取得session
		Map<String, Object> session = ctx.getSession();
		
		// 如為 null, 代表此user未登入過, 才做以下工作
		if (session.get("giver") == null) {
			// 取得HttpServletRequest
			HttpServletRequest request = ServletActionContext.getRequest();
			// 記下目前location(來源網頁)
			// 以便於login.jsp登入成功後 , 能夠直接導至此location來源網頁(須配合LoginHandler.java)
//			String location = request.getRequestURI();
			//預設回到首頁
			String location = request.getContextPath()+"/index.jsp";
			session.put("location", location);
			
			
			return "login";
		} else {
			return invocation.invoke(); // 繼續下一個攔截器或下一個Action的execute()方法
		}
	}
}
