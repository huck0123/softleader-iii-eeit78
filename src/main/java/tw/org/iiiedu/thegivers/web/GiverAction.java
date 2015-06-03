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
import tw.org.iiiedu.thegivers.util.NewPassword;
import tw.org.iiiedu.thegivers.util.SendEmail;

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

			if(form.getBirth().getTime() < (new java.util.Date()).getTime() ){
				model.setBirth(new Timestamp(form.getBirth().getTime()));
			}else{
				return FAIL;
			}
			
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
			if(form.getPasswd().trim().matches(passRegex)){
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
			if(form.getHeadshot() != null){
				model.setHeadshot(IOUtils.toByteArray(new FileInputStream(form.getHeadshot())));
			}
			
			model = service.register(model);
			if (model != null) {
				giverCount++; // 資料筆數+1
				context.setAttribute("giverCount", giverCount);
				request.getSession().setAttribute("giver", model); // 註冊成功時，將資料丟進model
				request.getSession().setAttribute("success", "註冊會員資料");
				log.debug(
						"++++++++++++++++++++++++++++++++++++++giverInsert+++++++++++++++++++++++++++++++++++ {}+++{}",
						model, form);
				return "insert";
			} else {
				return FAIL;
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return FAIL;
		} catch (IOException e) {
			e.printStackTrace();
			return FAIL;
		} catch (HibernateException e) {
			e.printStackTrace();
			return FAIL;
		} catch (Exception e) {
			e.printStackTrace();
			return FAIL;
		}
		
	}
	
	//更新資料
	public String update() {
		GiverModel temp = (GiverModel) request.getSession().getAttribute(
				"giver");
		System.out.println("yyy"+form);
		if(temp.getAccount().equals(form.getAccount())){
			model = new GiverModel();

			try {
				model.setId(temp.getId());
				model.setAccount(temp.getAccount().trim());
				model.setAddress(form.getAddress().trim());
				model.setBirth(temp.getBirth());
				model.setEmail(form.getEmail().trim());
				model.setFamilyName(form.getFamilyName().trim());
				model.setName(form.getName().trim());
				model.setGender(temp.isGender());
				model.setGetInfo(form.isGet_info());
				model.setTel(form.getTel().trim());
				model.setValid(true);
	
				model.setIdNumber(temp.getIdNumber().trim());
	
				if (form.getPasswd().trim().length() == 0) {
					model.setPasswd(temp.getPasswd());
				} else {
					// 驗證密碼
					if (form.getPasswd().trim().matches(passRegex)) {
						MessageDigest md = MessageDigest.getInstance("MD5");
						byte[] b = md.digest(form.getPasswd().getBytes());
						model.setPasswd(b);
					} else {
						return "updateFail";
					}
				}
				
				if (form.getHeadshot() != null) {
					model.setHeadshot(IOUtils.toByteArray(new FileInputStream(form
							.getHeadshot())));
				} else {
					model.setHeadshot(temp.getHeadshot());
				}
	
				service.update(model);
				request.getSession().setAttribute("success", "更新會員資料");
				request.getSession().setAttribute("giver", model);
	
			} catch (NoSuchAlgorithmException e) {
				e.printStackTrace();
				return "updateFail";
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				return "updateFail";
			} catch (Exception e) {
				e.printStackTrace();
				return "updateFail";
			}
	
			return "update";
		} else {
			return "login";
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

	//驗證帳號是否重複
	public String selectAccount(){
		model = service.getByAccount(form.getAccount());
		Map<String, Boolean> map = new HashMap<>();
		if(model == null){
			map.put("checkAccount", false);
		}else{
			map.put("checkAccount", true);
		}
		String jsonStr = JSONObject.toJSONString(map);
		inputStream = new ByteArrayInputStream(jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "checkAccount";
	}
	
	//用ID收尋帳號跟照片
	public String  selectHeadshot(){
		model = service.getById(form.getId());
		
		GiverModel tempGM = new GiverModel();
		tempGM.setId(model.getId());
		tempGM.setAccount(model.getAccount());
		tempGM.setHeadshot(model.getHeadshot());

		Gson gson = new Gson();
		String jsonStr = gson.toJson(tempGM);
		inputStream = new ByteArrayInputStream(jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "selectHeadshot";
	}
	
	//驗證密碼是否正確
	public String checkPassword(){
		model = service.login(form.getAccount(), form.getPasswd());
		Map<String,Boolean> map = new HashMap<>();
		if(model == null){
			map.put("checkPasswd", false);
		}else{
			map.put("checkPasswd", true);
		}
		
		String jsonStr = JSONObject.toJSONString(map);
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "checkPassword";
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
	
	//此帳號與身分證是否屬於同一人
	public String selectIdNumberByAccount(){
		model = service.getByAccount(form.getAccount().trim());
		System.out.println(form.getAccount()+"  "+form.getId_number());
		Map<String, Boolean> map = new HashMap<>();
		if(model.getIdNumber().equals(form.getId_number())){
			map.put("IdNumberByAccount", true);
		}else{
			map.put("IdNumberByAccount", false);
		}
		
		String jsonStr = JSONObject.toJSONString(map);
		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return "checkIdNumberByAccount";
	}
	
	//身分證ID收尋   (是否有此身分證)
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
	
	//忘記密碼
	public String newPassword() {
		model = service.getByAccount(form.getAccount());

		NewPassword newPasswd = new NewPassword();
		String password = newPasswd.createPassword();
		SendEmail send = new SendEmail(model.getEmail(), password);
		send.email();
		
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		byte[] b = md.digest(password.getBytes());
		model.setPasswd(b);
		service.update(model);

		return null;
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
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}
	
//	public String IdentityImage() throws IOException{
//		
//		Random random = new Random();
//		String randomString = IdentityImage.getRandomString();
//		
//		System.out.println(randomString);
//		int width = 200;
//		int height = 60;
//
//		Color color = IdentityImage.getRandomColor();
//		Color reverse = IdentityImage.getReverseColor(color);
//
//		BufferedImage bi = new BufferedImage(width, height,
//				BufferedImage.TYPE_INT_RGB);
//		Graphics2D g = bi.createGraphics();
//		g.setFont(new Font(Font.SANS_SERIF, Font.BOLD, 24));
//		g.setColor(color);
//		g.fillRect(0, 0, width, height);
//		g.setColor(reverse);
//		g.drawString(randomString, 50, 40);
//		for (int i = 0, n = random.nextInt(250); i < n; i++) {
//			g.drawRect(random.nextInt(width), random.nextInt(height), 1, 1);
//		}
//		
//		ByteArrayOutputStream baos = new ByteArrayOutputStream();
//		ImageIO.write(bi, "png", baos);
//		inputStream = new ByteArrayInputStream(baos.toByteArray());
//
//		return "IdentityImage";
//	}

}
