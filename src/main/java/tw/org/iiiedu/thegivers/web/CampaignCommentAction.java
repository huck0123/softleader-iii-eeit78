package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.CampaignCommentForm;
import tw.org.iiiedu.thegivers.model.CampaignCommentModel;
import tw.org.iiiedu.thegivers.service.CampaignCommentService;

import com.google.gson.Gson;

public class CampaignCommentAction {
	
	@Autowired
	private CampaignCommentService campaignCommentService;
	
	private CampaignCommentModel model;
	private CampaignCommentForm form;
	private InputStream inputStream;
	
	
	public CampaignCommentService getCampaignCommentService() {
		return campaignCommentService;
	}
	public void setCampaignCommentService(CampaignCommentService campaignCommentService) {
		this.campaignCommentService = campaignCommentService;
	}
	public CampaignCommentForm getForm() {
		return form;
	}
	public void setForm(CampaignCommentForm form) {
		this.form = form;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	
	
	public CampaignCommentModel transferToModel(CampaignCommentForm form){
		model = new CampaignCommentModel();
		model.setCampaignId(form.getCampaignId());
		model.setGiverId(form.getGiverId());
		model.setReplyId(form.getReplyId());
		model.setCommentary(form.getCommentary());
		model.setAnonymous(form.getAnonymous());
		model.setIp(ServletActionContext.getRequest().getRemoteAddr());
		
		return model;
	}
	public String newComment(){
		CampaignCommentModel model = campaignCommentService.writeComment(transferToModel(form));
		model = campaignCommentService.getLostColumn(model.getId());
		String data = new Gson().toJson(model);
		inputStream = new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
		
		return "leaveNewComment";
	}
	public String allComment(){
		List<CampaignCommentModel> models = campaignCommentService.grabAllComment(form.getCampaignId());
		String datas = new Gson().toJson(models);
		inputStream = new ByteArrayInputStream(datas.getBytes(StandardCharsets.UTF_8));
		
		return "fetchAllComment";
	}
}
