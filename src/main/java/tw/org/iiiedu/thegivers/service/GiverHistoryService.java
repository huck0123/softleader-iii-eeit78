package tw.org.iiiedu.thegivers.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.GiverHistoryDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;

@Service
public class GiverHistoryService {

	@Autowired
	private GiverHistoryDao giverHistoryDao;
	
	Integer number = null, size = null;


	public List<GiverHistoryModel> loadAll(GiverHistoryAllConditionModel allCondition){
		if((number = allCondition.getPageNumber()) == null){
			number = 0;
		}
		if((size = allCondition.getPageSize()) == null){
			size = 5;
		}
		
		List<GiverHistoryModel> giverHistoryModel = giverHistoryDao.getAll(allCondition.getGiver_id(), number, size);
		if(giverHistoryModel.size()>0){
			return giverHistoryModel;
		}else{
			return null;
		}
	}
	
	public Set<GiverHistoryModel> loadByAllCondition(GiverHistoryAllConditionModel allCondition){
		Set<GiverHistoryModel> result = new TreeSet<GiverHistoryModel>();
		Integer min = null, max = null;
		Timestamp before = null, after = null;
		
		if((number = allCondition.getPageNumber()) == null){
			number = 0;
		}
		if((size = allCondition.getPageSize()) == null){
			size = 5;
		}
		
		if(allCondition.getCampaign_id() != null){
			List<GiverHistoryModel> giverHistoryModel = giverHistoryDao.getByCampaign_id(allCondition.getGiver_id(), allCondition.getCampaign_id());
			if(giverHistoryModel.size()>0){
				for(GiverHistoryModel g:giverHistoryModel){
					result.add(g);
				}
			}
		}
		
		if(allCondition.getCampaign_name() != null){
			List<CampaignModel> campaignModel = giverHistoryDao.getByCampaign_name(allCondition.getGiver_id(), allCondition.getCampaign_name());
			if(campaignModel.size()>0){
				for(CampaignModel c:campaignModel){
					List<GiverHistoryModel> giverHistoryModel = giverHistoryDao.getByCampaign_id(allCondition.getGiver_id(), c.getId());
						if(giverHistoryModel.size()>0){
							for(GiverHistoryModel g:giverHistoryModel){
								result.add(g);
							}
						}
				}
			}
		}
		
		if((min = allCondition.getMinAmount()) != null || (max = allCondition.getMaxAmount()) != null){
			if(min == null){
				min = 0;
			}
			if(max == null){
				max = Integer.MAX_VALUE;
			}
			
			List<GiverHistoryModel> giverHistoryModel = giverHistoryDao.getByAmount(allCondition.getGiver_id(), min, max);
			if(giverHistoryModel.size()>0){
				for(GiverHistoryModel g:giverHistoryModel){
					result.add(g);
				}
			}
		}
		
		if((before = allCondition.getBeforeDate()) != null || (after = allCondition.getAfterDate()) != null){
			if(before == null){
				before = new Timestamp(new Date().getTime());
			}
			if(after == null){
				after = new Timestamp(0);
			}
			
			List<GiverHistoryModel> giverHistoryModel= giverHistoryDao.getByDate(allCondition.getGiver_id(), before, after);
			if(giverHistoryModel.size()>0){
				for(GiverHistoryModel g:giverHistoryModel){
					result.add(g);
				}
			}
		}
		
		if(result.size()>0){
			Set<GiverHistoryModel> pageResult = new TreeSet<GiverHistoryModel>();
			List<GiverHistoryModel> l = new ArrayList<GiverHistoryModel>(result);
			for(int i = size*number; i < size*(number+1) && i < result.size(); i++){
				pageResult.add(l.get(i));
			}
			return pageResult;
		}else{
			return null;
		}	
	}
}
