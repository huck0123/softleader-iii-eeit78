package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;
import java.util.Date;

import org.springframework.stereotype.Repository;

@Repository
public class RaiserHistoryAllConditionModel {
	
	public final static Integer PAGE_NUMBER = 0;
	public final static Integer PAGE_SIZE = 5;
	public Timestamp BEFORE_DATE = new Timestamp(new Date().getTime());
	public Timestamp AFTER_DATE = new Timestamp(new Date(0).getTime());
	private Integer raiser_id = null;
	private Integer campaign_id = null;
	private String campaign_name = null;
	private Integer pageNumber = null;
	private Integer pageSize = null;
	private Timestamp beforeDate = null;
	private Timestamp afterDate = null;
	
	
	public Integer getRaiser_id() {
		return raiser_id;
	}
	public void setRaiser_id(Integer raiser_id) {
		this.raiser_id = raiser_id;
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
	
	
	public void makeDefaultPage(RaiserHistoryAllConditionModel allCondition){
		if(allCondition.getPageNumber() == null){
			allCondition.setPageNumber(PAGE_NUMBER);
		}
		if(allCondition.getPageSize() == null){
			allCondition.setPageSize(PAGE_SIZE);
		}
	}
	public void makeDefaultDate(RaiserHistoryAllConditionModel allCondition){
		if(allCondition.getBeforeDate() == null){
			allCondition.setBeforeDate(BEFORE_DATE);
		}
		if(allCondition.getAfterDate() == null){
			allCondition.setAfterDate(AFTER_DATE);
		}
	}
	
}
