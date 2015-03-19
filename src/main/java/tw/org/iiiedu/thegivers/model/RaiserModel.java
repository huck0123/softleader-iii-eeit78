package tw.org.iiiedu.thegivers.model;

public class RaiserModel {

	private long id;	
	private long raiser_id;	
	private long campaign_id;
	private String ipv4;
	private String ipv6;
	
	@Override
	public String toString() {
		return "RaiserModel [id=" + id + ", raiser_id=" + raiser_id
				+ ", campaign_id=" + campaign_id + ", ipv4=" + ipv4 + ", ipv6="
				+ ipv6 + "]";
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getRaiser_id() {
		return raiser_id;
	}

	public void setRaiser_id(long raiser_id) {
		this.raiser_id = raiser_id;
	}

	public long getCampaign_id() {
		return campaign_id;
	}

	public void setCampaign_id(long campaign_id) {
		this.campaign_id = campaign_id;
	}

	public String getIpv4() {
		return ipv4;
	}

	public void setIpv4(String ipv4) {
		this.ipv4 = ipv4;
	}

	public String getIpv6() {
		return ipv6;
	}

	public void setIpv6(String ipv6) {
		this.ipv6 = ipv6;
	}
}
