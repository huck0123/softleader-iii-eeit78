package tw.org.iiiedu.thegivers.web;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.service.CampaignService;

import com.opensymphony.xwork2.ActionSupport;

public class UtilAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CampaignService campaignService;
	
	public String util(){
		System.out.println(campaignService.getHighestCurrentFund());
		System.out.println(campaignService.getHighestGoal());
		System.out.println(campaignService.getCampaignCount());
		
		return SUCCESS;
	}
	
	
}
