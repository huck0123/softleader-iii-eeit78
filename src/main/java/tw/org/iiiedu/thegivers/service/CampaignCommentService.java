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
			if(model.getReplyId() == 0){
				model.setPendingId(0);
			}else{
				CampaignCommentModel ccm = campaignCommentDao.getById(model.getReplyId());
				if(ccm.getReplyId() == 0){
					model.setPendingId(ccm.getId());
				}else{
					model.setPendingId(ccm.getPendingId());
				}
			}
			return campaignCommentDao.getById(id);
		}else{
			return null;
		}
	}
	
	public CampaignCommentModel modifyComment(CampaignCommentModel model){
		boolean b = campaignCommentDao.update(model);
		if(b == true){
			return campaignCommentDao.getById(model.getId());
		}else{
			return null;
		}
	}
	
	public boolean deleteComment(Integer id){
		return campaignCommentDao.delete(id);
	}
	
	public CampaignCommentModel getByModelId(Integer id){
		return campaignCommentDao.getById(id);
	}
	
	public List<CampaignCommentModel> grabAllComment(Integer campaignId){
		return campaignCommentDao.getAll(campaignId);
	}
}
