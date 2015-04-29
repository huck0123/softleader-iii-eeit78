package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.RaiserForm;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.RaiserService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class RaiserAction extends ActionSupport implements ServletRequestAware {
	@Autowired
	RaiserService raiserService;

	private RaiserForm raiserForm;
	private RaiserModel rm;
	private InputStream inputStream;
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public RaiserForm getRaiserForm() {
		return raiserForm;
	}

	public void setRaiserForm(RaiserForm raiserForm) {
		this.raiserForm = raiserForm;
	}

	public InputStream getInputStream() {
		return inputStream;
	}

	public String insert() throws Exception {
		RaiserModel rm = new RaiserModel();

		rm.setAccount(raiserForm.getAccount());
		rm.setPasswd(raiserForm.getPasswd());
		rm.setName(raiserForm.getName());
		rm.setTel(raiserForm.getTel());
		rm.setContactPerson(raiserForm.getContactPerson());
		rm.setContactTel(raiserForm.getContactTel());
		rm.setEmail(raiserForm.getEmail());

		try {
			if(raiserForm.getLogo()!=null)
			rm.setLogo(FileUtils.readFileToByteArray(raiserForm.getLogo()));
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		rm.setAddress(raiserForm.getAddress());
		rm.setDetail(raiserForm.getDetail());
		rm.setVideoUrl(raiserForm.getVideoUrl());

		rm = raiserService.register(rm);
		if (rm != null) {
			return "insert";
		} else {
			return "error";
		}
	}

	public String select() {
		rm = raiserService.getByAccount(raiserForm.getAccount());

		Map<String, String> map = new HashMap<>();

		if (rm != null) {
			return "select";
		} else {
			return "error";
		}
	}

	public String selectAll() {
		List<RaiserModel> list = raiserService.getAll();
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String update() {
		RaiserModel rm = new RaiserModel();
		HttpSession session = ServletActionContext.getRequest().getSession();
		rm.setId(raiserForm.getId());
		rm.setAccount(raiserForm.getAccount());
		if (raiserForm.getPasswd() != null) {
			rm.setPasswd(raiserForm.getPasswd());
		}
		if (raiserForm.getName() != null) {
			rm.setName(raiserForm.getName());
		}
		if (raiserForm.getTel() != null) {
			rm.setTel(raiserForm.getTel());
		}
		if (raiserForm.getContactPerson() != null) {
			rm.setContactPerson(raiserForm.getContactPerson());
		}
		if (raiserForm.getContactTel() != null) {
			rm.setContactTel(raiserForm.getContactTel());
		}
		if (raiserForm.getEmail() != null) {
			rm.setEmail(raiserForm.getEmail());
		}
		if (raiserForm.getAddress() != null) {
			rm.setAddress(raiserForm.getAddress());
		}
		if (raiserForm.getDetail() != null) {
			rm.setDetail(raiserForm.getDetail());
		}
		if (raiserForm.getVideoUrl() != null) {
			rm.setVideoUrl(raiserForm.getVideoUrl());
		}
		rm = raiserService.dataUpdate(rm);
		if (rm != null) {
			session.setAttribute("raiser", rm);
			return "update";
		} else {
			return "error";
		}
	}

	public String getPerPage() {
		List<RaiserModel> models = raiserService.getPerPage(page);

		Gson gson = new Gson();
		String jsonStr = gson.toJson(models);

		inputStream = new ByteArrayInputStream(
				jsonStr.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String checkInformation(){
		return null;
		
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub

	}

}
