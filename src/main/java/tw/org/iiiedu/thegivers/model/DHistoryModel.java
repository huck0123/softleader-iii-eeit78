package tw.org.iiiedu.thegivers.model;

public class DHistoryModel {

	private Long id;

	private Long campaignId;

	private Long donation;

	private Long donatorId;

	private int anonymous;

	private String ip;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCampaignId() {
		return campaignId;
	}

	public void setCampaignId(Long campaignId) {
		this.campaignId = campaignId;
	}

	public Long getDonation() {
		return donation;
	}

	public void setDonation(Long donation) {
		this.donation = donation;
	}

	public Long getDonatorId() {
		return donatorId;
	}

	public void setDonatorId(Long donatorId) {
		this.donatorId = donatorId;
	}

	public int getAnonymous() {
		return anonymous;
	}

	public void setAnonymous(int anonymous) {
		this.anonymous = anonymous;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	@Override
	public String toString() {
		return "DHistoryModel [id=" + id + "campaignId=" + campaignId
				+ "donation=" + donation + "donatorId=" + donatorId
				+ "anonymous=" + anonymous + "ip=" + ip + "]";
	}

	


}
