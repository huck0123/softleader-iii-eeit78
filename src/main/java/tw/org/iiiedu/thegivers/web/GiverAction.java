package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
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
	private String thisAccount;

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
	
	public String getThisAccount() {
		return thisAccount;
	}

	public void setThisAccount(String thisAccount) {
		this.thisAccount = thisAccount;
	}

	
	
	//註冊帳號
	public String insert() {

		context = request.getSession().getServletContext();
		Integer giverCount = (Integer) context.getAttribute("giverCount");
		model = new GiverModel();
		log.debug("++++++++++++++++++++++++++++++++++++++++++++giverAction insert++++++++++++++++++++++++++++++++++++++ {}", giverCount);
		model.setAccount(form.getAccount());
		model.setAddress(form.getAddress());
		model.setBirth(new Timestamp(form.getBirth().getTime()));
		model.setEmail(form.getEmail());
		model.setFamilyName(form.getFamilyName());
		model.setName(form.getName());
		model.setGender(form.isGender());
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
		}
		model.setIdNumber(form.getId_number());
		model.setPasswd(form.getPasswd());
		model.setTel(form.getTel());
		model.setValid(true);
		
		try {
			model = service.register(model);
			if (model != null) {
				giverCount++;				//資料筆數+1
				context.setAttribute("giverCount", giverCount);
				request.getSession().setAttribute("giver", model);    //註冊成功時，將資料丟進model
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

	//Select All
	public String selectAll() throws UnsupportedEncodingException{
		List<GiverModel> list = service.getAll();
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);

		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "selectAll";
		
	}

	//抓某頁的資料
	public String getPerPage(){
		List<GiverModel> models = service.getPerPage(thisPage);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(models);
		
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "getPerPage";
	}
	
	//更新資料
	public String update(){
		GiverModel temp1;
		temp1 = (GiverModel) request.getSession().getAttribute("giver");
		GiverModel temp = service.getByAccount(temp1.getAccount());
		log.debug("++++++++++++++++++++++++++++++++++++++ giver update ++++++++++++++++++++++++++++++++++++ {}",temp);
		
		model = new GiverModel();
		
		model.setId(temp.getId());
		model.setAccount(temp.getAccount());
		model.setAddress(form.getAddress());
		model.setBirth(temp.getBirth());
		model.setEmail(form.getEmail());
		model.setFamilyName(form.getFamilyName());
		model.setName(form.getName());
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
		model.setIdNumber(temp.getIdNumber());
		model.setPasswd(form.getPasswd());
		model.setTel(form.getTel());
		model.setValid(true);
		
		try{
			service.update(model);
		}catch(Exception e){
			return "updateFail";
		}
		
		return "update";
	}
	
	
	
	
	
	
	
	
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

}
