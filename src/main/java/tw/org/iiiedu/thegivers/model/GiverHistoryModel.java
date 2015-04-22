package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;

public class GiverHistoryModel {

	private Long id;
	private Integer giver_id;
	private Integer campaign_id;
	private Integer amount;
	private Timestamp date;
	private String ip;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
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
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "GiverHistoryModel [id=" + id + ", giver_id=" + giver_id
				+ ", campaign_id=" + campaign_id + ", amount=" + amount
				+ ", date=" + date + ", ip=" + ip + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
