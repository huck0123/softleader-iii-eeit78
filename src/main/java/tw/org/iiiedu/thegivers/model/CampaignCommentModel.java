package tw.org.iiiedu.thegivers.model;

import java.sql.Timestamp;

public class CampaignCommentModel {
	
	private Integer id;
	private Integer campaignId;
	private Integer giverId;
	private Integer replyId;
	private String commentary;
	private Integer likeNumber;
	private Boolean anonymous;
	private Boolean integrity;
	private Timestamp commentTime;
	private String ip;
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getCampaignId() {
		return campaignId;
	}
	public void setCampaignId(Integer campaignId) {
		this.campaignId = campaignId;
	}
	public Integer getGiverId() {
		return giverId;
	}
	public void setGiverId(Integer giverId) {
		this.giverId = giverId;
	}
	public Integer getReplyId() {
		return replyId;
	}
	public void setReplyId(Integer replyId) {
		this.replyId = replyId;
	}
	public String getCommentary() {
		return commentary;
	}
	public void setCommentary(String commentary) {
		this.commentary = commentary;
	}
	public Integer getLikeNumber() {
		return likeNumber;
	}
	public void setLikeNumber(Integer likeNumber) {
		this.likeNumber = likeNumber;
	}
	public Boolean getAnonymous() {
		return anonymous;
	}
	public void setAnonymous(Boolean anonymous) {
		this.anonymous = anonymous;
	}
	public Boolean getIntegrity() {
		return integrity;
	}
	public void setIntegrity(Boolean integrity) {
		this.integrity = integrity;
	}
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	
}
