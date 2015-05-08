package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.TransactionDetailForm;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;
import tw.org.iiiedu.thegivers.service.TransactionService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.opensymphony.xwork2.ActionSupport;

public class TransactionAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	TransactionService service;
	
	private ServletContext context;
	private TransactionDetailForm form;
	private TransactionDetailModel model;
	private InputStream inputStream;
	private int thisPage;
	private int pageAmount;
	private String condition;
	private int thisId;
	private boolean credit;
	
	
	public TransactionDetailForm getForm() {
		return form;
	}

	public void setForm(TransactionDetailForm form) {
		this.form = form;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(InputStream inputStream) {
		this.inputStream = inputStream;
	}

	public int getThisPage() {
		return thisPage;
	}

	public void setThisPage(int thisPage) {
		this.thisPage = thisPage;
	}

	public int getPageAmount() {
		return pageAmount;
	}

	public void setPageAmount(int pageAmount) {
		this.pageAmount = pageAmount;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public int getThisId() {
		return thisId;
	}

	public void setThisId(int thisId) {
		this.thisId = thisId;
	}

	public boolean isCredit() {
		return credit;
	}

	public void setCredit(boolean credit) {
		this.credit = credit;
	}

	
	
	//insert
	public String donate(){
		context = ServletActionContext.getServletContext();
		Integer transactionCount = (Integer) context.getAttribute("transactionCount");
				
		log.debug("++++++++++++++++++++++++++++++donateAction++++++++++++form:{} transactionCount:{}",form,transactionCount);
		model = new TransactionDetailModel();

		model.setGiverId(form.getGiverId());
		model.setAmount(form.getAmount());
		model.setCardType(form.getCardType());
		model.setCardNo(form.getCardNo());
		model.setCardHolder(form.getCardHolder());
		model.setCardHolderEmail(form.getCardHolderEmail());
		model.setIp(ServletActionContext.getRequest().getRemoteAddr());

		try{
			service.insert(model, form.getCampaignId()); //Service insert接收兩參數
			transactionCount++;
			context.setAttribute("transactionCount", transactionCount);
			log.debug("++++++++++++++transactionAction+++++++++++++ transactionCount:{}",transactionCount);
		}catch(HibernateException e){
			e.printStackTrace();
			return "fail";
		}
		return SUCCESS;
	}
	
	//條件收尋筆數
	public String conditionCount(){
		int conditionCount;
		conditionCount = service.getByConditionCount(condition);
		
		System.out.println(conditionCount);
		
		Map<String, Integer> map = new HashMap<>();
		map.put("conditionCount", conditionCount);
		String jsonStr = JSONObject.toJSONString(map);
//		Gson gson = new Gson();
//		String jsonStr = gson.toJson(conditionCount);
		
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "transactionConditionCount";
	}
	
	//交易明細
	public String transactionDetail() {
		
		List<TransactionDetailModel> list;
		if (condition == null) {
			list = service.getPerPage(thisPage, pageAmount);
			System.out.println("HAHAHA");
		} else {
			System.out.println("condition=" + condition);
			list = service.getByCondition(condition, thisPage, pageAmount);
			
		}

		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);

		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "transactionDetail";
	}
	
	//credit
	public String credit(){
		log.debug("*******************TransactionAction*******credit*****{}{}",thisId,credit);
		
		if(credit == true){
			service.creditCheck(thisId);
		}else{
			service.creditUncheck(thisId);
		}
		
		return null;
	}
	
	//giver歷史資料
	public String giverDetail(){
		return null;
	}
	
	
	
}
