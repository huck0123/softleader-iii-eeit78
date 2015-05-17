package tw.org.iiiedu.thegivers.service;

import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.dao.CampaignCommentDao;
import tw.org.iiiedu.thegivers.form.CampaignCommentForm;
import tw.org.iiiedu.thegivers.model.CampaignCommentModel;

public class CampaignCommentService {
	
	@Autowired
	CampaignCommentDao campaignCommentDao;
	
	public CampaignCommentModel writeComment(CampaignCommentForm form){
		Integer id = campaignCommentDao.insert(form);
		if(id != -1){
			return campaignCommentDao.getById(id);
		}else{
			return null;
		}
	}
	
	public CampaignCommentModel alterComment(CampaignCommentForm form){
		boolean b = campaignCommentDao.update(form);
		if(b == true){
			return campaignCommentDao.getById(form.getId());
		}else{
			return null;
		}
	}
	
	public boolean deleteComment(Integer id){
		return campaignCommentDao.delete(id);
	}
}
