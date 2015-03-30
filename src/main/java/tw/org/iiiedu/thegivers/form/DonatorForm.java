package tw.org.iiiedu.thegivers.form;

import java.sql.Blob;
import java.sql.Timestamp;

public class DonatorForm {

	private Long id;
	
	private String account;
	
	private String passwd;
	
	private String name;
	
	private boolean gender;
	
	private String id_number;
	
	private String tel;
	
	private String address;
	
	private String email;
	
	private boolean get_info;
	
	private Blob headshot;
	
	private Timestamp birth;
	
	private boolean proved;

	@Override
	public String toString() {
		return "DonatorModel [id=" + id + ", account=" + account + ", passwd="
				+ passwd + ", name=" + name + ", gender=" + gender
				+ ", id_number=" + id_number + ", tel=" + tel + ", address="
				+ address + ", email=" + email + ", get_info=" + get_info
				+ ", headshot=" + headshot + ", birth=" + birth + ", proved="
				+ proved + "]";
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
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

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getId_number() {
		return id_number;
	}

	public void setId_number(String id_number) {
		this.id_number = id_number;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isGet_info() {
		return get_info;
	}

	public void setGet_info(boolean get_info) {
		this.get_info = get_info;
	}

	public Blob getHeadshot() {
		return headshot;
	}

	public void setHeadshot(Blob headshot) {
		this.headshot = headshot;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	public boolean isProved() {
		return proved;
	}

	public void setProved(boolean proved) {
		this.proved = proved;
	}
	
	
	
}
