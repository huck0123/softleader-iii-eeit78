package tw.org.iiiedu.thegivers.model;

public class RHistoryModel {
	private Long id;
	private Long raiser_id;
	private Long campaign_id;
	private String ip;
	
	
	@Override
	public String toString() {
		return "RHistoryModel [id=" + id + ", raiser_id=" + raiser_id
				+ ", campaign_id=" + campaign_id + ", ip=" + ip + "]";
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRaiser_id() {
		return raiser_id;
	}
	public void setRaiser_id(Long raiser_id) {
		this.raiser_id = raiser_id;
	}
	public Long getCampaign_id() {
		return campaign_id;
	}
	public void setCampaign_id(Long campaign_id) {
		this.campaign_id = campaign_id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}


}