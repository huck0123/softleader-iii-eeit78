package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;

public class TransactionDetailModel {
	private Integer id;
	private Integer giverId;
	private Integer campaignId;
	private Integer amount;
	private Timestamp date;
	private String cardNo;
	private boolean credit;
	private String ip;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getGiverId() {
		return giverId;
	}
	public void setGiverId(Integer giverId) {
		this.giverId = giverId;
	}
	public Integer getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(Integer campaignId) {
		this.campaignId = campaignId;
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
	public String getCardNo() {
		return cardNo;
	}
	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}
	public boolean isCredit() {
		return credit;
	}
	public void setCredit(boolean credit) {
		this.credit = credit;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	@Override
	public String toString() {
		return "TransactionDetail [id=" + id + ", giverId=" + giverId
				+ ", campaignId=" + campaignId + ", amount=" + amount
				+ ", date=" + date + ", cardNo=" + cardNo + ", credit="
				+ credit + ", ip=" + ip + "]";
	}
	
	
	
}
