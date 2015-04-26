package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;

public class GiverHistoryAllConditionModel {
	
	private Integer giver_id = null;
	private Integer campaign_id = null;
	private String campaign_name = null;
	private Integer minAmount = null;
	private Integer maxAmount = null;
	private Timestamp beforeDate = null;
	private Timestamp afterDate = null;
	private Integer pageNumber = null;
	private Integer pageSize = null;
	
	
	public Integer getGiver_id() {
		return giver_id;
	}
	public void setGiver_id(Integer giver_id) {
		this.giver_id = giver_id;
	}
	public Integer getCampaign_id() {
		return campaign_id;
	}
	public void setCampaign_id(Integer campaign_id) {
		this.campaign_id = campaign_id;
	}
	public String getCampaign_name() {
		return campaign_name;
	}
	public void setCampaign_name(String campaign_name) {
		this.campaign_name = campaign_name;
	}
	public Integer getMinAmount() {
		return minAmount;
	}
	public void setMinAmount(Integer minAmount) {
		this.minAmount = minAmount;
	}
	public Integer getMaxAmount() {
		return maxAmount;
	}
	public void setMaxAmount(Integer maxAmount) {
		this.maxAmount = maxAmount;
	}
	public Timestamp getBeforeDate() {
		return beforeDate;
	}
	public void setBeforeDate(Timestamp beforeDate) {
		this.beforeDate = beforeDate;
	}
	public Timestamp getAfterDate() {
		return afterDate;
	}
	public void setAfterDate(Timestamp afterDate) {
		this.afterDate = afterDate;
	}
	public Integer getPageNumber() {
		return pageNumber;
	}
	public void setPageNumber(Integer pageNumber) {
		this.pageNumber = pageNumber;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	
	@Override
	public String toString() {
		return "GiverHistoryAllCondition [campaign_id=" + campaign_id
				+ ", campaign_name=" + campaign_name + ", minAmount="
				+ minAmount + ", maxAmount=" + maxAmount + ", beforeDate="
				+ beforeDate + ", afterDate=" + afterDate + ", toString()="
				+ super.toString() + "]";
	}
}
