package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;


public class TransactionDetailModel {
	private Integer id;
	private Integer giverId;
//	private Integer campaignId;
	private CampaignModel campaignModel;
	private Integer amount;
	private Timestamp date;
	private String cardType;
	private String cardNo;
	private String cardHolder;
	private String cardHolderEmail;
	private boolean credit;
	private String ip;
	
//	@Override
//	public String toString() {
//		return "TransactionDetailModel [id=" + id + ", giverId=" + giverId
//				+ ", campaignId=" + campaignId + ", amount=" + amount
//				+ ", date=" + date + ", cardType=" + cardType + ", cardNo="
//				+ cardNo + ", cardHolder=" + cardHolder + ", cardHolderEmail="
//				+ cardHolderEmail + ", credit=" + credit + ", ip=" + ip + "]";
//	}


	@Override
	public String toString() {
		return "TransactionDetailModel [id=" + id + ", giverId=" + giverId
				+ ", campaignModel=" + campaignModel + ", amount=" + amount
				+ ", date=" + date + ", cardType=" + cardType + ", cardNo="
				+ cardNo + ", cardHolder=" + cardHolder + ", cardHolderEmail="
				+ cardHolderEmail + ", credit=" + credit + ", ip=" + ip + "]";
	}
	
	
	
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

//	public Integer getCampaignId() {
//		return campaignId;
//	}
//
//	public void setCampaignId(Integer campaignId) {
//		this.campaignId = campaignId;
//	}

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

	public String getCardType() {
		return cardType;
	}

	public void setCardType(String cardType) {
		this.cardType = cardType;
	}

	public String getCardNo() {
		return cardNo;
	}

	public void setCardNo(String cardNo) {
		this.cardNo = cardNo;
	}

	public String getCardHolder() {
		return cardHolder;
	}

	public void setCardHolder(String cardHolder) {
		this.cardHolder = cardHolder;
	}

	public String getCardHolderEmail() {
		return cardHolderEmail;
	}

	public void setCardHolderEmail(String cardHolderEmail) {
		this.cardHolderEmail = cardHolderEmail;
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

	public CampaignModel getCampaignModel() {
		return campaignModel;
	}

	public void setCampaignModel(CampaignModel campaignModel) {
		this.campaignModel = campaignModel;
	}


	
	
	
	
}
