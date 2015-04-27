package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class GiverHistoryAllConditionModel {
	
	public final static Integer MIN_AMOUNT = 0;
	public final static Integer MAX_AMOUNT = Integer.MAX_VALUE;
	public final static Integer PAGE_NUMBER = 0;
	public final static Integer PAGE_SIZE = 5;
	public Timestamp BEFORE_DATE = new Timestamp(new Date().getTime());
	public Timestamp AFTER_DATE = new Timestamp(new Date(0).getTime());
	private Integer giver_id = null;
	private Integer campaign_id = null;
	private String campaign_name = null;
	private Integer minAmount = null;
	private Integer maxAmount = null;
	private Integer pageNumber = null;
	private Integer pageSize = null;
	private Timestamp beforeDate = null;
	private Timestamp afterDate = null;
	
	
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
	
	
	public void makeDefaultPage(GiverHistoryAllConditionModel allCondition){
		if(allCondition.getPageNumber() == null){
			allCondition.setPageNumber(PAGE_NUMBER);
		}
		if(allCondition.getPageSize() == null){
			allCondition.setPageSize(PAGE_SIZE);
		}
	}
	public void makeDefaultAmount(GiverHistoryAllConditionModel allCondition){
		if(allCondition.getMinAmount() == null){
			allCondition.setMinAmount(MIN_AMOUNT);
		}
		if(allCondition.getMaxAmount() == null){
			allCondition.setMaxAmount(MAX_AMOUNT);
		}
	}
	public void makeDefaultDate(GiverHistoryAllConditionModel allCondition){
		if(allCondition.getBeforeDate() == null){
			allCondition.setBeforeDate(BEFORE_DATE);
		}
		if(allCondition.getAfterDate() == null){
			allCondition.setAfterDate(AFTER_DATE);
		}
	}
	
}
