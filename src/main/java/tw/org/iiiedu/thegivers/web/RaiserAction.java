package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.RaiserForm;
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
	private boolean lock;
	private String account;
	private String name;
	private String contactPerson;

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

	public boolean isLock() {
		return lock;
	}

	public void setLock(boolean lock) {
		this.lock = lock;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String insert() {
		RaiserModel rm = new RaiserModel();
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("insertErrorACC");
		session.removeAttribute("insertErrorNAME");
		session.removeAttribute("insertErrorPSW");
		session.removeAttribute("insertErrorMSG");
		try {
			if (raiserService.getByAccount(raiserForm.getAccount()) != null) {
				session.setAttribute("insertErrorACC", "帳號已存在");
			}
			rm.setAccount(raiserForm.getAccount());
			MessageDigest md=MessageDigest.getInstance("MD5");
			rm.setPasswd(md.digest(raiserForm.getPasswd().getBytes()));
			if (raiserService.getByName(raiserForm.getName()) != null) {
				session.setAttribute("insertErrorNAME", "此團體已註冊");
			}
			rm.setName(raiserForm.getName());
			rm.setTel(raiserForm.getTel());
			rm.setContactPerson(raiserForm.getContactPerson());
			rm.setContactTel(raiserForm.getContactTel());
			rm.setEmail(raiserForm.getEmail());
			if (raiserForm.getLogo() != null)
				rm.setLogo(FileUtils.readFileToByteArray(raiserForm.getLogo()));
			rm.setAddress(raiserForm.getAddress());
			rm.setDetail(raiserForm.getDetail());
			rm.setVideoUrl(raiserForm.getVideoUrl());
			session.setAttribute("form", rm);
			if (raiserForm.getPasswd().trim().length() == 0) {
				session.setAttribute("insertErrorPSW", "密碼不符合規定");
				throw new Exception();
			}
			rm = raiserService.register(rm);
			session.removeAttribute("form");
			return "insert";
		} catch (Exception e1) {
			session.setAttribute("insertErrorMSG", "註冊帳號失敗,請更正您的資料");
			return "error";
		}
	}

	public String checkName() {
		rm = raiserService.getByName(name);
		HttpSession session = ServletActionContext.getRequest().getSession();
		Gson gson = new Gson();
		String jsonString = gson.toJson(rm);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String select() {
		rm = raiserService.getByAccount(account);
		HttpSession session = ServletActionContext.getRequest().getSession();
		Gson gson = new Gson();
		String jsonString = gson.toJson(rm);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		session.setAttribute("raiserSelf", rm);
		return "select";
	}

	public String selectAll() {
		List<RaiserModel> list = raiserService.getAll();
		List<RaiserModel> list1 = new ArrayList<RaiserModel>();
		for (RaiserModel rm : list) {
			if (rm.isValid() != false) {
				list1.add(rm);
			}
		}
		Gson gson = new Gson();
		String jsonString = gson.toJson(list1);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String update() {
		HttpSession session = ServletActionContext.getRequest().getSession();
		RaiserModel rm = (RaiserModel) session.getAttribute("raiser");
		try{
		rm.setId(raiserForm.getId());
		rm.setAccount(raiserForm.getAccount());
		if (raiserForm.getPasswd() != null) {
			MessageDigest md=MessageDigest.getInstance("MD5");
			rm.setPasswd(md.digest(raiserForm.getPasswd().getBytes()));
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
		if (raiserForm.getLogo() != null)
			rm.setLogo(FileUtils.readFileToByteArray(raiserForm.getLogo()));
		
		rm = raiserService.dataUpdate(rm);
		session.setAttribute("raiser", rm);
			return "update";
		} catch (Exception e1) {
			session.setAttribute("updateErrorMSG", "更新帳號失敗,請更正您的資料");
			return "error";
		}
	}

	public String getPerPage() {
		List<RaiserModel> list = raiserService.getPerPage(page);
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);

		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String checkInformation() {
		String[] str = account.split(" ");
		for (int n = 0; n < str.length; n++) {
			if (n % 4 == 0) {
				boolean result = raiserService.valid(str[n], lock);
			}
		}
		return null;
	}

	public String getByAllConditionCount() {
		Integer resultCount = raiserService.getByAllConditionCount(account,
				name, contactPerson, lock);
		Gson gson = new Gson();
		String jsonString = gson.toJson(resultCount);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String getRaiserCondition() {
		List<RaiserModel> list = raiserService.getByAllCondition(account, name,
				contactPerson, lock, page, 5);
		Gson gson = new Gson();
		String jsonString = gson.toJson(list);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub

	}

}
