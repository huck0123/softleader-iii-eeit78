package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.CampaignService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CampaignAction extends ActionSupport implements
		ServletRequestAware {

	private InputStream inputStream;

	private CampaignForm campaignForm;
	private HttpServletRequest request;
	@Autowired
	private CampaignService campaignService;
	private Integer pageNum;
	private Integer pageSize;



	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public CampaignForm getCampaignForm() {
		return campaignForm;
	}

	public void setCampaignForm(CampaignForm campaignForm) {
		this.campaignForm = campaignForm;
	}

	public String selectAll() throws Exception {

		System.out.println(pageNum+", "+pageSize);
		
		
		if(pageNum == null){pageNum=0;}
		if(pageSize == null){pageSize=5;}
		List campaigns = campaignService.getAll(pageNum,pageSize);

		Gson gson = new Gson();
		String json = gson.toJson(campaigns);

		
		inputStream = new ByteArrayInputStream(
				json.getBytes(StandardCharsets.UTF_8));
		
		return "selectAll";
	}

	public String insert() throws Exception {
		System.out.println(System.currentTimeMillis());
		System.out.println(campaignForm);
		CampaignModel cm = new CampaignModel();
		RaiserModel rm = (RaiserModel) request.getSession().getAttribute(
				"raiser");
		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
		cm.setEndDate(campaignForm.getEndDate());
		if (campaignForm.getImage() != null) {
			cm.setImage(IOUtils.toByteArray(new FileInputStream(campaignForm
					.getImage())));
		}
		cm.setLocation(campaignForm.getLocation());
		cm.setName(campaignForm.getName());
		cm.setRaiserId(rm.getId());
		cm.setStartDate(campaignForm.getStartDate());
		cm.setType(campaignForm.getType());
		cm.setVedioUrl(campaignForm.getVedioUrl());
		System.out.println(cm);
		System.out.println(System.currentTimeMillis());
		campaignService.insert(cm);
		return "insert";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}