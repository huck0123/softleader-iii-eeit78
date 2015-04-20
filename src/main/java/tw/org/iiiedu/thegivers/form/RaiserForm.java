package tw.org.iiiedu.thegivers.form;

import java.io.File;
import java.util.Arrays;

public class RaiserForm {
	
	private Integer id;
	private String account;
	private String passwd;
	private String name;
	private String tel;
	private String contactPerson;
	private String contactTel;
	private String email;
	private String address;
	private File logo;
	private String detail;
	private String videoUrl;
	@Override
	public String toString() {
		return "RaiserForm [id=" + id + ", account=" + account + ", passwd="
				+ passwd + ", name=" + name + ", tel=" + tel
				+ ", contactPerson=" + contactPerson + ", contactTel="
				+ contactTel + ", email=" + email + ", address=" + address
				+ ", logo=" + logo + ", detail=" + detail + ", videoUrl="
				+ videoUrl + "]";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getContactTel() {
		return contactTel;
	}
	public void setContactTel(String contactTel) {
		this.contactTel = contactTel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public File getLogo() {
		return logo;
	}
	public void setLogo(File logo) {
		this.logo = logo;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	
	

	
	

}
