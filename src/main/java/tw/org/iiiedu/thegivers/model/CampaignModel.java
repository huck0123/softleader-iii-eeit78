package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;
import java.util.Arrays;

public class CampaignModel {
	
	private Integer id;

	private String name;

//	private Integer raiserId;
	private RaiserModel raiserModel;
	
	private Integer goal;

	private Timestamp startDate;

	private Timestamp endDate;

	private Integer currentFund;

	private String type;

	private String vedioUrl;

	private String detail;

	private Boolean show;
	
	private Boolean valid;

	private String location;
	
	private byte[] image;

	
	
	@Override
	public String toString() {
		return "CampaignModel [id=" + id + ", name=" + name + ", raiserModel="
				+ raiserModel + ", goal=" + goal + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", currentFund=" + currentFund
				+ ", type=" + type + ", vedioUrl=" + vedioUrl + ", detail="
				+ detail + ", show=" + show + ", valid=" + valid
				+ ", location=" + location + "]";
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}


	public RaiserModel getRaiserModel() {
		return raiserModel;
	}

	public void setRaiserModel(RaiserModel raiserModel) {
		this.raiserModel = raiserModel;
	}

	public Integer getGoal() {
		return goal;
	}

	public void setGoal(Integer goal) {
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

	public Integer getCurrentFund() {
		return currentFund;
	}

	public void setCurrentFund(Integer currentFund) {
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

	public Boolean getShow() {
		return show;
	}

	public void setShow(Boolean show) {
		this.show = show;
	}

	public Boolean getValid() {
		return valid;
	}

	public void setValid(Boolean valid) {
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

	
	


	



	

}