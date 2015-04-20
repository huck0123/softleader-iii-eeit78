package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;
import java.util.Arrays;

public class GiverModel {

	private int id;
	
	private String account;
	
	private String passwd;
	
	private String name;
	
	private String familyName;
	
	private boolean gender;
	
	private String idNumber;
	
	private String tel;
	
	private String address;
	
	private String email;
	
	private boolean getInfo;
	
	private byte[] headshot;
	
	private Timestamp birth;
	
	private boolean valid;

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

	public String getFamilyName() {
		return familyName;
	}

	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}

	public boolean isGender() {
		return gender;
	}

	public void setGender(boolean gender) {
		this.gender = gender;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
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

	public boolean isGetInfo() {
		return getInfo;
	}

	public void setGetInfo(boolean getInfo) {
		this.getInfo = getInfo;
	}

	public byte[] getHeadshot() {
		return headshot;
	}

	public void setHeadshot(byte[] headshot) {
		this.headshot = headshot;
	}

	public Timestamp getBirth() {
		return birth;
	}

	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	@Override
	public String toString() {
		return "GiverModel [id=" + id + ", account=" + account + ", passwd="
				+ passwd + ", name=" + name + ", familyName=" + familyName
				+ ", gender=" + gender + ", idNumber=" + idNumber + ", tel="
				+ tel + ", address=" + address + ", email=" + email
				+ ", getInfo=" + getInfo + ", birth=" + birth + ", valid="
				+ valid + "]";
	}

	
	
}
