package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
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
		model.setId(form.getId());
		model.setCampaignId(form.getCampaignId());
		model.setGiverId(form.getGiverId());
		model.setReplyId(form.getReplyId());
		model.setCommentary(form.getCommentary());
		model.setCommentTime(new Timestamp(new java.util.Date().getTime()));
		model.setIp(ServletActionContext.getRequest().getRemoteAddr());
		return model;
	}
	public String newComment(){
		CampaignCommentModel model = campaignCommentService.writeComment(transferToModel(form));
		model = campaignCommentService.getByModelId(model.getId());
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
	public String replyComment(){
		CampaignCommentModel model = campaignCommentService.getByModelId(transferToModel(form).getId());
		String data = new Gson().toJson(model);
		inputStream = new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
		
		return "findReplyComment";
	}
	public String renewComment(){
		CampaignCommentModel model = campaignCommentService.modifyComment(transferToModel(form));
		model = campaignCommentService.getByModelId(model.getId());
		String data = new Gson().toJson(model);
		inputStream = new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
		
		return "leaveRenewComment";
	}
	public String invalidComment(){
		Boolean b = campaignCommentService.deleteComment(transferToModel(form).getId());
		String status;
		if(b){
			status = "刪除成功";
		}else{
			status = "刪除失敗，請再重試一次";
		}
		String data = new Gson().toJson(status);
		inputStream = new ByteArrayInputStream(data.getBytes(StandardCharsets.UTF_8));
		
		return "deleteComment";
	}
}
