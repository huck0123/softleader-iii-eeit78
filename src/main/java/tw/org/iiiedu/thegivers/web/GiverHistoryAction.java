package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;
import tw.org.iiiedu.thegivers.service.GiverHistoryService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GiverHistoryAction extends ActionSupport implements ServletRequestAware{

	@Autowired
	private GiverHistoryService giverHistoryService;
	
	private GiverHistoryAllConditionModel allCondition;
	private HttpServletRequest request;
	private InputStream inputStream;
	
	
	public GiverHistoryService getGiverHistoryService() {
		return giverHistoryService;
	}
	public void setGiverHistoryService(GiverHistoryService giverHistoryService) {
		this.giverHistoryService = giverHistoryService;
	}
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public InputStream getInputStream() {
		return inputStream;
	}
	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}
	public GiverHistoryAllConditionModel getAllCondition() {
		return allCondition;
	}
	public void setAllCondition(GiverHistoryAllConditionModel allCondition) {
		this.allCondition = allCondition;
	}
	

	public String selectAll(){
		if(allCondition.getGiver_id() == null){
			return "login";
		}
		
		List<GiverHistoryModel> giverHistoryModel = giverHistoryService.loadAll(allCondition);
		String json = new Gson().toJson(giverHistoryModel);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "selectAll";
	}
	
	public String selectByAllCondition(){
		if(allCondition.getGiver_id() == null){
			return "login";
		}
		
		Set<GiverHistoryModel> giverHistoryModel = giverHistoryService.loadByAllCondition(allCondition);
		String json = new Gson().toJson(giverHistoryModel);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "selectByAllCondition";
	}
	
	public String selectByAllConditionCount(){
		return "selectByAllConditionCount";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}

}
