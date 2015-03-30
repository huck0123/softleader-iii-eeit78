package tw.org.iiiedu.thegivers.form;

import java.sql.Timestamp;

public class CampaignForm {

	private long id;

	private String name;

	private int raiserId;

	private int goal;

	private Timestamp date;

	private int duration;

	private int currentFund;

	private String type;

	private String vedioUrl;

	private String detail;

	private boolean show;

	private String location;

	@Override
	public String toString() {
		return "CampaignModel [id=" + id + ", name=" + name + ", raiserId="
				+ raiserId + ", goal=" + goal + ", date=" + date
				+ ", duration=" + duration + ", currentFund=" + currentFund
				+ ", type=" + type + ", vedioUrl=" + vedioUrl + ", detail="
				+ detail + ", show=" + show + ", location=" + location
				+ "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
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

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

}