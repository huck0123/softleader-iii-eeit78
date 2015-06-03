package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
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
		ServletRequestAware{

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
		//驗證campaignForm資料
		Map<String,String> errorsMap = new HashMap<>();
		request.setAttribute("errors", errorsMap);
		if(campaignForm.getName().trim() == null || campaignForm.getName().trim().length()==0){
		errorsMap.put("name", "活動名稱請勿留白");
		} 

		if(campaignForm.getGoal() == null){
		errorsMap.put("goal", "目標金額請勿留白");
		} else if(campaignForm.getGoal() <0){
		errorsMap.put("goal", "請填入正確金額");
		}
		
		if(campaignForm.getImage() == null){
		errorsMap.put("image", "請上傳圖片");
		}
		
		if(campaignForm.getDuration() == null){
		errorsMap.put("duration", "活動天數請勿留白");
		}
		
		if(campaignForm.getType().trim() == null || campaignForm.getType().trim().length()==0 ){
		errorsMap.put("type", "類型請勿留白");
		}
		
		if(campaignForm.getLocation().trim() == null || campaignForm.getLocation().trim().length()==0 ){
		errorsMap.put("location", "地點請勿留白");
		}
		
		if(campaignForm.getVedioUrl().trim() == null || campaignForm.getVedioUrl().trim().length()==0 ){
		errorsMap.put("vedioUrl", "影片聯結請勿留白");
		}
		
		if(campaignForm.getDetail().trim() == null || campaignForm.getDetail().trim().length()==0 ){
		errorsMap.put("detail", "活動詳情請勿留白");
		}
		
		if(errorsMap.size()>0){
		return "input";
		}

		
		CampaignModel cm = new CampaignModel();
		RaiserModel rm = (RaiserModel) request.getSession().getAttribute(
				"raiser");
		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
		cm.setStartDate(new Timestamp(new java.util.Date().getTime()));
		cm.setEndDate(new Timestamp(cm.getStartDate().getTime()+campaignForm.getDuration()*24*3600*1000));
		if (campaignForm.getImage() != null) {
			cm.setImage(IOUtils.toByteArray(new FileInputStream(campaignForm
					.getImage())));
		}
		cm.setLocation(campaignForm.getLocation());
		cm.setName(campaignForm.getName());
		cm.setCurrentFund(0);
		cm.setRaiserModel(rm);
		cm.setType(campaignForm.getType());
		cm.setVedioUrl(campaignForm.getVedioUrl());

		campaignService.insert(cm);
		return "insert";
	}

	public String update() throws Exception {
		//驗證campaignForm資料
//		Map<String,String> errorsMap = new HashMap<>();
//		request.setAttribute("errors", errorsMap);
//		if(campaignForm.getName().trim() == null || campaignForm.getName().trim().length()==0){
//		errorsMap.put("name", "活動名稱請勿留白");
//		} 
//
//		if(campaignForm.getGoal() == null){
//		errorsMap.put("goal", "目標金額請勿留白");
//		} else if(campaignForm.getGoal() <0){
//		errorsMap.put("goal", "請填入正確金額");
//		}
//		
//		if(campaignForm.getImage() == null){
//		errorsMap.put("image", "請上傳圖片");
//		}
//		
//		if(campaignForm.getDuration() == null){
//		errorsMap.put("duration", "活動天數請勿留白");
//		}
//		
//		if(campaignForm.getType().trim() == null || campaignForm.getType().trim().length()==0 ){
//		errorsMap.put("type", "類型請勿留白");
//		}
//		
//		if(campaignForm.getLocation().trim() == null || campaignForm.getLocation().trim().length()==0 ){
//		errorsMap.put("location", "地點請勿留白");
//		}
//		
//		if(campaignForm.getVedioUrl().trim() == null || campaignForm.getVedioUrl().trim().length()==0 ){
//		errorsMap.put("vedioUrl", "影片聯結請勿留白");
//		}
//		
//		if(campaignForm.getDetail().trim() == null || campaignForm.getDetail().trim().length()==0 ){
//		errorsMap.put("detail", "活動詳情請勿留白");
//		}
//		
//		if(errorsMap.size()>0){
//		return "input";
//		}

		
		
		CampaignModel cm = campaignService.getById(campaignForm.getId());
//		RaiserModel rm = (RaiserModel) request.getSession().getAttribute(
//				"raiser");
//		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
//		cm.setStartDate(new Timestamp(new java.util.Date().getTime()));
//		cm.setEndDate(new Timestamp(cm.getStartDate().getTime()+campaignForm.getDuration()*24*3600*1000));
		if (campaignForm.getImage() != null) {
			cm.setImage(IOUtils.toByteArray(new FileInputStream(campaignForm
					.getImage())));
		}
//		cm.setLocation(campaignForm.getLocation());
//		cm.setName(campaignForm.getName());
//		cm.setCurrentFund(0);
//		cm.setRaiserModel(rm);
//		cm.setType(campaignForm.getType());
//		cm.setVedioUrl(campaignForm.getVedioUrl());

		campaignService.update(cm);
		return "update";
	}
	
	
	
	public String selectGiverCountByCampaignId() {

		Integer count = transactionService.getCountByCampaignId(campaignForm
				.getId());

		inputStream = new ByteArrayInputStream(count.toString().getBytes(
				StandardCharsets.UTF_8));

		return "selectCampaignGiverCount";
	}

	public String ban() {
		if (campaignForm.getBan() == null) {
			return "ban";
		}
		String[] strArr = campaignForm.getBan().split("&");
		if (strArr.length > 0) {
			for (int i = 0; i < strArr.length; i++) {
				String id = strArr[i].substring(strArr[i].lastIndexOf("=")+1);
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(id));
				cm.setValid(false);
				campaignService.update(cm);
			}
		}
		return "ban";
	}

	public String unban() {
		if (campaignForm.getBan() == null) {
			return "unban";
		}
		String[] strArr = campaignForm.getBan().split("&");
		if (strArr.length > 0) {
			for (int i = 0; i < strArr.length; i++) {
				String id = strArr[i].substring(strArr[i].lastIndexOf("=")+1);
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(id));
				cm.setValid(true);
				campaignService.update(cm);
			}
		}
		return "unban";
	}

	public String selectRaiserIdById(){
		CampaignModel cm = campaignService.getById(campaignForm.getId());
		Integer outputRaiserId = cm.getRaiserModel().getId();
		inputStream = new ByteArrayInputStream(outputRaiserId.toString().getBytes(
				StandardCharsets.UTF_8));
		return "selectRaiserIdById";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	





	
}
