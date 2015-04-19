package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.GiverForm;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.service.GiverService;

import com.opensymphony.xwork2.ActionSupport;

public class GiverAction extends ActionSupport implements ServletRequestAware{
	private static final long serialVersionUID = 1L;
	
	@Autowired
	private GiverService service;

	private HttpServletRequest request;
	private ServletContext context;
	private String FAIL = "fail";
	private InputStream inputStream;
	private GiverForm form;
	private GiverModel model;

	public InputStream getInputStream() {
		return inputStream;
	}
	
	public GiverForm getForm() {
		return form;
	}

	public void setForm(GiverForm form) {
		this.form = form;
	}


	
	
	
	
	public String insert() {
//		System.out.println(form);
		context = request.getSession().getServletContext();
		Integer giverCount = (Integer) context.getAttribute("giverCount");
		System.out.println(giverCount);
		GiverModel model = new GiverModel();
		model.setAccount(form.getAccount());
		model.setAddress(form.getAddress());
//		System.out.println(form.getBirth());
		model.setBirth(new Timestamp(form.getBirth().getTime()));
		model.setEmail(form.getEmail());
		
		model.setFamilyName(form.getFamilyName());
		model.setName(form.getName());
		model.setGender(form.isGender());
		model.setGetInfo(form.isGet_info());
		model.setHeadshot(null);   //unfinish
		model.setIdNumber(form.getId_number());
		model.setPasswd(form.getPasswd());
		model.setTel(form.getTel());
		model.setValid(true);
		
		try {
			model = service.register(model);
			if (model != null) {
				giverCount++;				//資料筆數+1
				context.setAttribute("giverCount", giverCount.toString());
				System.out.println("註冊成功");
				System.out.println(model);
				return "insert";
			} else {
				return FAIL;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("action fail");
			return FAIL;
		}
		
		
	}
	
	//select by account
	public String select() throws UnsupportedEncodingException{
		
		model = service.getByAccount("goodman9527");
//		System.out.println(model);
		
		Map<String, String> map = new HashMap<>();
		map.put("account", model.getAccount());
		map.put("passwd", model.getPasswd());
		map.put("name", model.getName());
		map.put("familyName", model.getFamilyName());
		if(model.isGender() == true){
			map.put("gender", "男");
		}else{
			map.put("gender", "女");
		}
		map.put("id_number", model.getIdNumber());
		map.put("tel", model.getTel());
		map.put("address", model.getAddress());
		map.put("email", model.getEmail());
		map.put("get_info", "model.isGetInfo()");
		map.put("headshot", "model.getHeadshot()");
		map.put("birth", model.getBirth().toString());
		
		JSONObject json=new JSONObject();
		String jsonStr = json.toJSONString(map);
		
		
		inputStream = new ByteArrayInputStream(jsonStr.getBytes("UTF-8"));
		return "select";
	}

	@Override
	public String execute() {
		return "success";
	}


	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
		
	}

}
