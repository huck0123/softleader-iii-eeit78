package tw.org.iiiedu.thegivers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.CampaignCommentDao;
import tw.org.iiiedu.thegivers.form.CampaignCommentForm;
import tw.org.iiiedu.thegivers.model.CampaignCommentModel;

@Service
public class CampaignCommentService {
	
	@Autowired
	CampaignCommentDao campaignCommentDao;
	
	public CampaignCommentModel writeComment(CampaignCommentModel model){
		Integer id = campaignCommentDao.insert(model);
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
	
	public CampaignCommentModel getLostColumn(Integer id){
		return campaignCommentDao.getById(id);
	}
	
	public List<CampaignCommentModel> grabAllComment(Integer campaignId){
		return campaignCommentDao.getAll(campaignId);
	}
}
