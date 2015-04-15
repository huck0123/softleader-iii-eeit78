package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;
import java.util.Arrays;

public class CampaignModel {
	
	private int id;

	private String name;

	private int raiserId;

	private int goal;

	private Timestamp startDate;

	private Timestamp endDate;

	private int currentFund;

	private String type;

	private String vedioUrl;

	private String detail;

	private boolean show;
	
	private boolean valid;

	private String location;
	
	private byte[] image;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getRaiserId() {
		return raiserId;
	}

	public void setRaiserId(int raiserId) {
		this.raiserId = raiserId;
	}

	public int getGoal() {
		return goal;
	}

	public void setGoal(int goal) {
		this.goal = goal;
	}

	

	public Timestamp getStartDate() {
		return startDate;
	}

	public void setStartDate(Timestamp startDate) {
		this.startDate = startDate;
	}

	public Timestamp getEndDate() {
		return endDate;
	}

	public void setEndDate(Timestamp endDate) {
		this.endDate = endDate;
	}

	public int getCurrentFund() {
		return currentFund;
	}

	public void setCurrentFund(int currentFund) {
		this.currentFund = currentFund;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getVedioUrl() {
		return vedioUrl;
	}

	public void setVedioUrl(String vedioUrl) {
		this.vedioUrl = vedioUrl;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public boolean isShow() {
		return show;
	}

	public void setShow(boolean show) {
		this.show = show;
	}

	public boolean isValid() {
		return valid;
	}

	public void setValid(boolean valid) {
		this.valid = valid;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CampaignModel [id=" + id + ", name=" + name + ", raiserId="
				+ raiserId + ", goal=" + goal + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", currentFund=" + currentFund
				+ ", type=" + type + ", vedioUrl=" + vedioUrl + ", detail="
				+ detail + ", show=" + show + ", valid=" + valid
				+ ", location=" + location + ", image="
				+ Arrays.toString(image) + "]";
	}



	

}