package tw.org.iiiedu.thegivers.model;

import java.util.Arrays;

public class RaiserModel {

	private int id;
	private String account;
	private String passwd;
	private String name;
	private String tel;
	private String contactPerson;
	private String contactTel;
	private String email;
	private String address;
	private byte[] logo;
	private String detail;
	private boolean valid;
	private String videoUrl;
	
	
	
	@Override
	public String toString() {
		return "RaiserModel [id=" + id + ", account=" + account + ", passwd="
				+ passwd + ", name=" + name + ", tel=" + tel
				+ ", contactPerson=" + contactPerson + ", contactTel="
				+ contactTel + ", email=" + email + ", address=" + address
				+ ", logo=" + Arrays.toString(logo) + ", detail=" + detail
				+ ", valid=" + valid + ", videoUrl=" + videoUrl + "]";
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
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
	public byte[] getLogo() {
		return logo;
	}
	public void setLogo(byte[] logo) {
		this.logo = logo;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public boolean isValid() {
		return valid;
	}
	public void setValid(boolean valid) {
		this.valid = valid;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}

	
}
