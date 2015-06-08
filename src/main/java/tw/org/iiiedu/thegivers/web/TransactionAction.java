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
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
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
	private GiverHistoryAllConditionModel allCondition;
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
	public GiverHistoryAllConditionModel getAllCondition() {
		return allCondition;
	}

	public void setAllCondition(GiverHistoryAllConditionModel allCondition) {
		this.allCondition = allCondition;
	}
	
	//驗證金額
	String regex_Amount = "^[\\d]+$";
	//卡號驗證
	String regex_CardNo = "^[\\d]{16}$";
	//驗證碼驗證
	String regex_checkCard = "^[\\d]{4}$";
	
	//insert
	public String donate(){
		context = ServletActionContext.getServletContext();
		Integer transactionCount = (Integer) context.getAttribute("transactionCount");
				
		log.debug("++++++++++++++++++++++++++++++donateAction++++++++++++form:{} transactionCount:{}",form,transactionCount);
		model = new TransactionDetailModel();
		try{
			model.setGiverId(form.getGiverId());
			if(form.getAmount() > 0){
				model.setAmount(form.getAmount());
			}else{
				return "fail";
			}
			model.setCardType(form.getCardType().trim());
			if(form.getCardNo().matches(regex_CardNo)){
				model.setCardNo(form.getCardNo().trim());
			}else{
				return "fail";
			}
			model.setCardHolder(form.getCardHolder().trim());
			model.setCardHolderEmail(form.getCardHolderEmail().trim());
			model.setIp(ServletActionContext.getRequest().getRemoteAddr());
		
			service.insert(model, form.getCampaignId()); //Service insert接收兩參數
			service.creditCheck(model.getId()); //Service 收到帳款
			transactionCount++;
			context.setAttribute("transactionCount", transactionCount);
			log.debug("++++++++++++++transactionAction+++++++++++++ transactionCount:{}",transactionCount);
		}catch(HibernateException e){
			e.printStackTrace();
			return "fail";
		}catch(Exception e){
			e.printStackTrace();
			return "fail";
		}
		
		return SUCCESS;
	}
	
	//條件收尋筆數
	public String conditionCount(){
		int conditionCount;
		conditionCount = service.getByConditionCount(condition);
		
		
		Map<String, Integer> map = new HashMap<>();
		map.put("conditionCount", conditionCount);
		String jsonStr = JSONObject.toJSONString(map);
		
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "transactionConditionCount";
	}
	
	//交易明細
	public String transactionDetail() {
		
		List<TransactionDetailModel> list;
		if (condition == null || condition.isEmpty()) {
			list = service.getPerPage(thisPage, pageAmount);
		} else {
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
		List<TransactionDetailModel> tdm = service.getByGiverId(thisId);
		if(tdm.size() != 0){
			Gson gson = new Gson();
			String jsonStr = gson.toJson(tdm);
			inputStream = new ByteArrayInputStream(
					jsonStr.getBytes(StandardCharsets.UTF_8));
		}
		return "allHistory";	
	}
	
	//giver條件歷史資料
	public String giverDetailByCondition(){
		List<TransactionDetailModel> tdm = service.getByIdAndCondition(allCondition);
//		System.out.println(tdm);
		if(tdm.size() != 0){
			Gson gson = new Gson();
			String jsonStr = gson.toJson(tdm);
			inputStream = new ByteArrayInputStream(
					jsonStr.getBytes(StandardCharsets.UTF_8));
		}
		return "allHistoryByCondition";
	}
	
	
}
