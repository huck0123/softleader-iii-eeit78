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
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.form.RaiserForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.CampaignService;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.service.RaiserService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionSupport;

public class RaiserAction extends ActionSupport implements ServletRequestAware {
	@Autowired
	private RaiserService raiserService;
	@Autowired
	private CampaignService campaignService;
	@Autowired
	private GiverService giverService;

	private RaiserForm raiserForm;
	private RaiserModel rm;
	private InputStream inputStream;
	private int page;
	private boolean lock;
	private String account;
	private String name;
	private String contactPerson;
	private CampaignForm campaignForm;

	public CampaignForm getCampaignForm() {
		return campaignForm;
	}

	public void setCampaignForm(CampaignForm campaignForm) {
		this.campaignForm = campaignForm;
	}

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
		session.removeAttribute("insertErrorTEL1");
		session.removeAttribute("insertErrorTEL2");
		try {
			rm.setAccount(raiserForm.getAccount().trim());
			MessageDigest md = MessageDigest.getInstance("MD5");
			rm.setPasswd(md.digest(raiserForm.getPasswd().trim().getBytes()));
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
			String passAcc = "^[a-zA-Z][a-zA-Z0-9]*$";
			Pattern p = Pattern.compile(passAcc);
			Matcher Macc = p.matcher(raiserForm.getAccount());
			if (raiserService.getByAccount(raiserForm.getAccount()) != null
					|| raiserForm.getAccount().equalsIgnoreCase("admin")
					|| giverService.getByAccount(raiserForm.getAccount()) != null
					&& Macc.matches()) {
				session.setAttribute("insertErrorACC", "帳號不符合規定");
				throw new Exception();
			}
			String passwdCK = "^(?=.*[a-zA-Z])(?=.*\\d).{6,30}$";
			Pattern p1 = Pattern.compile(passwdCK);
			Matcher Mpsd = p1.matcher(raiserForm.getPasswd());
			if (raiserForm.getPasswd().trim().length() == 0 && !Mpsd.matches()) {
				session.setAttribute("insertErrorPSW", "密碼不符合規定");
				throw new Exception();
			}
			if (raiserService.getByName(raiserForm.getName()) != null) {
				session.setAttribute("insertErrorNAME", "此團體已註冊");
				throw new Exception();
			}
			String phone = "(\\([0-9]*\\)[0-9]{4}-[0-9]{4})|([0-9]{10})";
			Pattern p2 = Pattern.compile(phone);
			Matcher m1 = p2.matcher(raiserForm.getTel());
			if (!m1.matches()) {
				session.setAttribute("insertErrorTEL1", "電話號碼不符格式");
				throw new Exception();
			}
			Matcher m2 = p2.matcher(raiserForm.getContactTel());
			if (!m2.matches()) {
				session.setAttribute("insertErrorTEL2", "連絡人電話號碼不符格式");
				throw new Exception();
			}
			if (raiserForm.getContactPerson() == null
					|| raiserForm.getEmail() == null
					|| raiserForm.getLogo() == null
					|| raiserForm.getAddress() == null) {
				throw new Exception();
			}
			rm = raiserService.register(rm);
			session.removeAttribute("form");
			return "insert";
		} catch (Exception e1) {
			session.setAttribute("insertErrorMSG", "註冊帳號失敗,請填寫必填欄位,並確認您資料格式均無誤");
			return "error";
		}
	}

	public String checkName() {
		String name1 = null, name2 = null;
		Gson gson = new Gson();
		System.out.println(account);
		if (account != null) {
			rm = raiserService.getByAccount(account);
			name1 = rm.getName();
		}
		rm = raiserService.getByName(name);
		if (rm == null) {
			String jsonString = gson.toJson(1);
			inputStream = new ByteArrayInputStream(
					jsonString.getBytes(StandardCharsets.UTF_8));
		} else {
			name2 = rm.getName();
			System.out.println(name1 + ":::" + name2);
			if (name2.equals(name1)) {
				String jsonString = gson.toJson(1);
				inputStream = new ByteArrayInputStream(
						jsonString.getBytes(StandardCharsets.UTF_8));
			} else {
				String jsonString = gson.toJson(2);
				inputStream = new ByteArrayInputStream(
						jsonString.getBytes(StandardCharsets.UTF_8));
			}
		}
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
		session.removeAttribute("updateErrorPSW");
		session.removeAttribute("updateErrorNAME");
		session.removeAttribute("updateErrorTEL1");
		session.removeAttribute("updateErrorTEL2");
		try {
			rm.setId(raiserForm.getId());
			rm.setAccount(raiserForm.getAccount().trim());
			if (raiserForm.getPasswd() != null) {
				MessageDigest md = MessageDigest.getInstance("MD5");
				rm.setPasswd(md
						.digest(raiserForm.getPasswd().trim().getBytes()));
			}
			if (raiserForm.getName() != null
					&& raiserService.getByName(rm.getName()) == null) {
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

			if (raiserForm.getPasswd().trim().length() == 0) {
				session.setAttribute("updateErrorPSW", "密碼不符合規定");
				throw new Exception();
			}
			if (raiserService.getByName(raiserForm.getName()) != null
					&& !rm.getName().equalsIgnoreCase(raiserForm.getName())) {
				session.setAttribute("updateErrorNAME", "此團體已註冊");
				throw new Exception();
			}
			String phone = "(\\([0-9]*\\)[0-9]{4}-[0-9]{4})|([0-9]{10})";
			Pattern p = Pattern.compile(phone);
			Matcher m1 = p.matcher(raiserForm.getTel());
			if (!m1.matches()) {
				session.setAttribute("updateErrorTEL1", "電話號碼不符格式");
				throw new Exception();
			}
			Matcher m2 = p.matcher(raiserForm.getContactTel());
			if (!m2.matches()) {
				session.setAttribute("updateErrorTEL2", "連絡人電話號碼不符格式");
				throw new Exception();
			}

			rm = raiserService.dataUpdate(rm);
			session.setAttribute("raiser", rm);
			session.setAttribute("updateRaiserMSG", "帳號更新成功");
			return "update";
		} catch (Exception e1) {
			session.setAttribute("updateRaiserMSG", "帳號更新失敗,請更正您的資料");
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

	public String getRaiserHistory() {
		campaignForm.setPageNum(0);
		campaignForm.setPageSize(6);
		List<CampaignModel> cm = campaignService
				.getByAllCondition(campaignForm);
		Gson gson = new Gson();
		String jsonString = gson.toJson(cm);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String getRaiserHistoryByCondition() {
		if (campaignForm.getName().length() == 0
				|| campaignForm.getName() == null) {
			campaignForm.setName(null);
		}
		if (campaignForm.getType().length() == 0
				|| campaignForm.getType() == null) {
			campaignForm.setType(null);
		}
		if (campaignForm.getLocation().length() == 0
				|| campaignForm.getLocation() == null) {
			campaignForm.setLocation(null);
		}
		campaignForm.setPageNum(0);
		campaignForm.setPageSize(6);
		List<CampaignModel> cm = campaignService
				.getByAllCondition(campaignForm);
		Gson gson = new Gson();
		String jsonString = gson.toJson(cm);
		inputStream = new ByteArrayInputStream(
				jsonString.getBytes(StandardCharsets.UTF_8));
		return "select";
	}

	public String forCheckPSW() throws NoSuchAlgorithmException {
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("checkForRaiserPSW");
		rm = raiserService.login(account, raiserForm.getPasswd());
		if (rm != null) {
			Gson gson = new Gson();
			String jsonString = gson.toJson(1);
			inputStream = new ByteArrayInputStream(
					jsonString.getBytes(StandardCharsets.UTF_8));
			return "select";
		} else {
			Gson gson = new Gson();
			String jsonString = gson.toJson(2);
			inputStream = new ByteArrayInputStream(
					jsonString.getBytes(StandardCharsets.UTF_8));
			return "select";
		}
	}

	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub

	}

}
