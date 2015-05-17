package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;

import com.google.gson.Gson;

import tw.org.iiiedu.thegivers.form.CampaignCommentForm;
import tw.org.iiiedu.thegivers.model.CampaignCommentModel;
import tw.org.iiiedu.thegivers.service.CampaignCommentService;

public class CampaignCommentAction {
	
	@Autowired
	private CampaignCommentService campaignCommentService;
	
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
	
	public String newComment(){
		
		CampaignCommentModel model = campaignCommentService.writeComment(form);
		String data = new Gson().toJson(model);
		inputStream = new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
		
		return "leaveNewComment";
	}
}
