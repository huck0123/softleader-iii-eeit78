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
import tw.org.iiiedu.thegivers.service.TransactionService;

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
	@Autowired
	private TransactionService transactionService;

	public InputStream getInputStream() {
		return inputStream;
	}

	public CampaignForm getCampaignForm() {
		return campaignForm;
	}

	public void setCampaignForm(CampaignForm campaignForm) {
		this.campaignForm = campaignForm;
	}

	public String selectByAllCondition() throws Exception {

		System.out.println(campaignForm.getId());
		if (campaignForm.getPageNum() == null) {
			campaignForm.setPageNum(0);
		}
		if (campaignForm.getPageSize() == null) {
			campaignForm.setPageSize(6);
		}
		List campaigns = campaignService.getByAllCondition(campaignForm);

		Gson gson = new Gson();
		String json = gson.toJson(campaigns);

		inputStream = new ByteArrayInputStream(
				json.getBytes(StandardCharsets.UTF_8));

		return "selectByAllCondition";
	}

	public String selectByAllConditionCount() throws Exception {

		Long count = campaignService.getByAllConditionCount(campaignForm);

		inputStream = new ByteArrayInputStream(count.toString().getBytes(
				StandardCharsets.UTF_8));

		return "selectByAllConditionCount";
	}

	public String insert() throws Exception {

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
		cm.setCurrentFund(0);
		cm.setRaiserModel(rm);
		cm.setStartDate(campaignForm.getStartDate());
		cm.setType(campaignForm.getType());
		cm.setVedioUrl(campaignForm.getVedioUrl());

		campaignService.insert(cm);
		return "insert";
	}

	public String selectGiverCountByCampaignId() {

		Integer count = transactionService.getCountByCampaignId(campaignForm
				.getId());

		inputStream = new ByteArrayInputStream(count.toString().getBytes(
				StandardCharsets.UTF_8));

		return "selectCampaignGiverCount";
	}

	public String ban() {
		if (campaignForm == null) {
			return "ban";
		}
		List<String> list = campaignForm.getCheckbox();
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(list.get(i)));
				cm.setValid(false);
				campaignService.update(cm);
			}
		}
		return "ban";
	}

	public String unban() {
		if (campaignForm == null) {
			return "unban";
		}
		List<String> list = campaignForm.getCheckbox();
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(list.get(i)));
				System.out.println("yyy: " + cm.getValid());
				cm.setValid(true);
				System.out.println("yyy: " + cm.getValid());
				campaignService.update(cm);
			}
		}
		return "unban";
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
