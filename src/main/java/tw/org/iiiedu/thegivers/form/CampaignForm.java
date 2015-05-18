package tw.org.iiiedu.thegivers.form;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class CampaignForm {
	
	private Integer id;

	private String name;

	private Integer raiserId;

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

	private File image;
	
	private Integer pageNum;
	
	private Integer pageSize;
	
	private List<String> checkbox;
	
	private Integer duration;
	
	

	public List<String> getCheckbox() {
		return checkbox;
	}

	public void setCheckbox(List<String> checkbox) {
		this.checkbox = checkbox;
	}

	public Integer getPageNum() {
		return pageNum;
	}

	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
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

	public Integer getRaiserId() {
		return raiserId;
	}

	public void setRaiserId(Integer raiserId) {
		this.raiserId = raiserId;
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

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	@Override
	public String toString() {
		return "CampaignForm [id=" + id + ", name=" + name + ", raiserId="
				+ raiserId + ", goal=" + goal + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", currentFund=" + currentFund
				+ ", type=" + type + ", vedioUrl=" + vedioUrl + ", detail="
				+ detail + ", show=" + show + ", valid=" + valid
				+ ", location=" + location + ", image=" + image + ", pageNum="
				+ pageNum + ", pageSize=" + pageSize + ", checkbox=" + checkbox
				+ ", duration=" + duration + "]";
	}

	



	
	
}