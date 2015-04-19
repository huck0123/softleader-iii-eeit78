package tw.org.iiiedu.thegivers.form;

import java.io.File;
import java.sql.Timestamp;
import java.util.Arrays;

public class CampaignForm {

	private String name;

	private Integer goal;

	private Timestamp startDate;

	private Timestamp endDate;

	private String type;

	private String vedioUrl;

	private String detail;

	private String location;

	private File image;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "CampaignForm [name=" + name + ", goal=" + goal + ", startDate="
				+ startDate + ", endDate=" + endDate + ", type=" + type
				+ ", vedioUrl=" + vedioUrl + ", detail=" + detail
				+ ", location=" + location + ", image=" + image + "]";
	}



	
	
}