package tw.org.iiiedu.thegivers.web;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.CampaignService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CampaignAction extends ActionSupport implements ServletRequestAware {

	private CampaignForm campaignForm;
	private HttpServletRequest request;
	@Autowired
	private CampaignService campaignService;
	
	public CampaignForm getCampaignForm() {
		return campaignForm;
	}

	public void setCampaignForm(CampaignForm campaignForm) {
		this.campaignForm = campaignForm;
	}

	public String insert() throws Exception {
		System.out.println(campaignForm);
		CampaignModel cm = new CampaignModel();
		RaiserModel rm = (RaiserModel) request.getSession().getAttribute("raiser");
		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
		cm.setEndDate(campaignForm.getEndDate());
		cm.setImage(campaignForm.getImage());
		cm.setLocation(campaignForm.getLocation());
		cm.setName(campaignForm.getName());
		cm.setRaiserId(rm.getId());
		cm.setStartDate(campaignForm.getStartDate());
		cm.setType(campaignForm.getType());
		cm.setVedioUrl(campaignForm.getVedioUrl());
		System.out.println(cm);
		campaignService.insert(cm);
		return "insert";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
