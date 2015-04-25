package tw.org.iiiedu.thegivers.form;

import java.sql.Timestamp;

public class RaiserHistoryForm {
	
	private Integer id;
	private Integer raiser_id;
	private Integer campaign_id;
	private Timestamp date;
	private String ip;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
		return "RaiserHistoryModel [id=" + id + ", raiser_id=" + raiser_id
				+ ", campaign_id=" + campaign_id + ", date=" + date + ", ip="
				+ ip + ", toString()=" + super.toString() + "]";
	}
	
	
}