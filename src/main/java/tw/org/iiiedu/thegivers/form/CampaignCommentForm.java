package tw.org.iiiedu.thegivers.form;

import java.sql.Timestamp;

public class CampaignCommentForm {
	
	private Integer id;
	private Integer campaignId;
	private Integer giverId;
	private Integer replyId;
	private String commentary;
	private Timestamp commentTime;
	
	
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
	public Timestamp getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(Timestamp commentTime) {
		this.commentTime = commentTime;
	}
	
}
