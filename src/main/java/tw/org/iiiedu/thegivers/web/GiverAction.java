package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.hibernate.HibernateException;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.GiverForm;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.util.IdCheck;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class GiverAction extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GiverService service;

	private HttpServletRequest request;
	private ServletContext context;
	private String FAIL = "fail";
	private InputStream inputStream;
	private GiverForm form;
	private GiverModel model;
	private int thisPage;
	private int pageAmount;
	private String condition; 
	private String thisAccount;
	private boolean valid;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public GiverForm getForm() {
		return form;
	}

	public void setForm(GiverForm form) {
		this.form = form;
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

	public String getThisAccount() {
		return thisAccount;
	}

	public void setThisAccount(String thisAccount) {
		this.thisAccount = thisAccount;
	}
	
	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}
	
	//電話regex
	String telRegex = "^09[\\d]{8}$";

	//密碼regex
	String passRegex = "^[\\dA-Za-z\\S]{6,30}$";
//	String passRegex1 = "[\\d]{1,}";
//	String passRegex2 = "[A-Za-z]{1,}";
//	String passRegex3 = "[\\S]{1,}";
	
	//註冊帳號
	public String insert() {

		context = request.getSession().getServletContext();
		Integer giverCount = (Integer) context.getAttribute("giverCount");

		model = new GiverModel();
		log.debug("++++++++++++++++++++++++++++++++++++++++++++giverAction insert++++++++++++++++++++++++++++++++++++++ {}", giverCount);
		try{
			model.setAccount(form.getAccount().trim());
			model.setAddress(form.getAddress().trim());
			model.setBirth(new Timestamp(form.getBirth().getTime()));
			model.setEmail(form.getEmail().trim());
			model.setFamilyName(form.getFamilyName().trim());
			model.setName(form.getName().trim());
			model.setGender(form.isGender());
			model.setGetInfo(form.isGet_info());
			model.setIdNumber(form.getId_number());

			//驗證身分證
			IdCheck check = new IdCheck(form.getId_number().trim() ,form.isGender());
			if(check.IdVerify() == false){
				return FAIL;				
			}
			//驗證密碼
			if(form.getPasswd().matches(passRegex)){
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] b = md.digest(form.getPasswd().getBytes());
				model.setPasswd(b);
			}else{
				return FAIL;
			}
			//驗證電話
			if(form.getTel().matches(telRegex)){
				model.setTel(form.getTel());
			}else{
				return FAIL;
			}
			model.setValid(true);

		}catch (Exception e) {
			e.printStackTrace();
			return FAIL;
		}
		
		if(form.getHeadshot() != null){
			try {
				model.setHeadshot(IOUtils.toByteArray(new FileInputStream(form.getHeadshot())));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return FAIL;
			} catch (IOException e) {
				e.printStackTrace();
				return FAIL;
			}
		}
		
		try {
			model = service.register(model);
			if (model != null) {
				giverCount++;				//資料筆數+1
				context.setAttribute("giverCount", giverCount);
				request.getSession().setAttribute("giver", model);    //註冊成功時，將資料丟進model
				request.getSession().setAttribute("success", "註冊會員資料");
				log.debug("++++++++++++++++++++++++++++++++++++++giverInsert+++++++++++++++++++++++++++++++++++ {}+++{}", model,form);
				return "insert";
			} else {
				return FAIL;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return FAIL;
		} 
		
	}
	
	//select by account
	public String select() throws UnsupportedEncodingException{
		
		model = service.getByAccount(thisAccount);
		
//		Map<String, String> map = new HashMap<>();
//		map.put("account", model.getAccount());
//		map.put("passwd", model.getPasswd());
//		map.put("name", model.getName());
//		map.put("familyName", model.getFamilyName());
//		if(model.isGender() == true){
//			map.put("gender", "男");
//		}else{
//			map.put("gender", "女");
//		}
//		map.put("id_number", model.getIdNumber());
//		map.put("tel", model.getTel());
//		map.put("address", model.getAddress());
//		map.put("email", model.getEmail());
//		if(model.isGetInfo() == true){
//			map.put("get_info", "是");
//		}else{
//			map.put("get_info", "否");
//		}
//		map.put("headshot", model.getHeadshot().toString());
//		map.put("birth", model.getBirth().toString());
//		
//		String jsonStr = JSONObject.toJSONString(map);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(model);
		
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	//捐款人條件收尋筆數
	public String conditionCount(){
		int count = service.getByConditionCount(condition);
		
		Map<String,Integer> map = new HashMap<>();
		map.put("condition", count);
		
		String jsonStr = JSONObject.toJSONString(map);
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "giverDetailCount";
	}
	
	//捐款人資料
	public String giverDetail(){
		List<GiverModel> list = service.getByCondition(condition, thisPage, pageAmount);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "giverDetail";
	}
	
	//Select All  ----deprecated----
	public String selectAll() throws UnsupportedEncodingException{
		List<GiverModel> list = service.getAll();
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);

		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "selectAll";
		
	}

	//抓某頁的資料     -----deprecated-----
	public String getPerPage(){
		List<GiverModel> models = service.getPerPage(thisPage);
		log.debug("XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX{}",models);
		Gson gson = new Gson();
		String jsonStr = gson.toJson(models);
		
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "getPerPage";
	}
	
	//更新資料
	public String update() throws NoSuchAlgorithmException{
		GiverModel temp = (GiverModel) request.getSession().getAttribute("giver");
//		GiverModel temp = service.getByAccount(temp1.getAccount());
		log.debug("++++++++++++++++++++++++++++++++++++++ giver update ++++++++++++++++++++++++++++++++++++ {}",temp);

			
		model = new GiverModel();
		
		model.setId(temp.getId());
		model.setAccount(temp.getAccount().trim());
		model.setAddress(form.getAddress().trim());
		model.setBirth(temp.getBirth());
		model.setEmail(form.getEmail().trim());
		model.setFamilyName(form.getFamilyName().trim());
		model.setName(form.getName().trim());
		model.setGender(temp.isGender());
		model.setGetInfo(form.isGet_info());

		if(form.getHeadshot() != null){
			try {
				model.setHeadshot(IOUtils.toByteArray(new FileInputStream(form.getHeadshot())));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return FAIL;
			} catch (IOException e) {
				e.printStackTrace();
				return FAIL;
			}
		}else{
			model.setHeadshot(temp.getHeadshot());
		}
		model.setIdNumber(temp.getIdNumber().trim());
		
		if(form.getPasswd().trim().length() == 0){
			model.setPasswd(temp.getPasswd());
		}else{
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] b = md.digest(form.getPasswd().getBytes());
			model.setPasswd(b);
		}
		
		model.setTel(form.getTel().trim());
		model.setValid(true);
		
		try{
			service.update(model);
			request.getSession().setAttribute("success", "更新會員資料");
			request.getSession().setAttribute("giver", model);
		}catch(Exception e){
			return "updateFail";
		}
		
		return "update";
	}
	
	//validate
	public String valid(){
		log.debug("=================GiverAction valid======================={},{}",thisAccount,valid);
		if(valid == true){
			service.open(thisAccount);
		}else{
			service.hide(thisAccount);
		}
		return null;
	}
	
	//ID收尋      -----deprecated-----
	public String selectByIdNumber(){
		boolean b = service.getByIdNumber(form.getId_number().trim());
		Map<String, Boolean> map = new HashMap<>();
		if(b == true){
			map.put("IdNumber", true);
		}else{
			map.put("IdNumber", false);
		}
	
		String jsonStr = JSONObject.toJSONString(map);
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "selectByIdNumber";
	}
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

}
