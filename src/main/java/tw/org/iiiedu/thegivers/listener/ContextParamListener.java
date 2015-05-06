package tw.org.iiiedu.thegivers.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;

import tw.org.iiiedu.thegivers.service.CampaignService;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.service.RaiserService;
import tw.org.iiiedu.thegivers.service.TransactionService;

public class ContextParamListener implements ServletContextListener{
	
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	@Autowired
	private CampaignService campaignService;
	@Autowired
	private GiverService giverService;
	@Autowired
	private RaiserService raiserService;
	@Autowired
	private TransactionService transactionService;
	
	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		log.error("Running ContextParamListener {}", sce);
		
		ServletContext sc = sce.getServletContext();

		WebApplicationContextUtils.getRequiredWebApplicationContext(sc).getAutowireCapableBeanFactory().autowireBean(this);
		
		sc.setAttribute("campaignCount", campaignService.getCount() );
		sc.setAttribute("giverCount", giverService.getCount() );
		sc.setAttribute("campaignShowPageSize", 5 );
		sc.setAttribute("raiserCount", raiserService.getCount());
		sc.setAttribute("transactionCount", transactionService.getCount());
	}

	
	
	
}
