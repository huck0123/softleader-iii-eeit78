package tw.org.iiiedu.thegivers.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import tw.org.iiiedu.thegivers.service.CampaignService;
import tw.org.iiiedu.thegivers.service.GiverService;

public class ContextParamListener implements ServletContextListener{

	@Autowired
	private CampaignService campaignService;
	@Autowired
	private GiverService giverService;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		ServletContext sc = sce.getServletContext();

		WebApplicationContextUtils.getRequiredWebApplicationContext(sc).getAutowireCapableBeanFactory().autowireBean(this);
		
		sc.setAttribute("campaignCount", campaignService.getCount() );
		sc.setAttribute("giverCount", giverService.getCount() );
		sc.setAttribute("campaignShowPageSize", 5 );
	}

	
	
	
}