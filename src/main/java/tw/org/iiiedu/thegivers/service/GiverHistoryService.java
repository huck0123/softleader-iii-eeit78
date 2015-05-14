package tw.org.iiiedu.thegivers.service;

import java.util.ArrayList;
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
	@Autowired
	private GiverHistoryAllConditionModel giverHistoryAllConditionModel;
	
	
	public List<GiverHistoryModel> loadAll(GiverHistoryAllConditionModel allCondition){
		giverHistoryAllConditionModel.makeDefaultPage(allCondition);
		List<GiverHistoryModel> searchAll = giverHistoryDao
				.getAll(allCondition.getGiver_id(), allCondition.getPageNumber(), allCondition.getPageSize());
		System.out.println(searchAll);
		if(searchAll.size()>0){
			return searchAll;
		}else{
			return null;
		}
	}
	
	public Set<GiverHistoryModel> loadByAllCondition(GiverHistoryAllConditionModel allCondition){
		Set<GiverHistoryModel> result = new TreeSet<GiverHistoryModel>();
		
//		if(allCondition.getCampaign_id() != null){
//			List<GiverHistoryModel> searchById = giverHistoryDao
//					.getByCampaign_id(allCondition.getGiver_id(), allCondition.getCampaign_id());
//			if(searchById.size()>0){
//				for(GiverHistoryModel g:searchById){
//					result.add(g);
//				}
//			}
//		}
//		if(allCondition.getCampaign_name() != null){
//			List<CampaignModel> searchByName = giverHistoryDao
//					.getByCampaign_name(allCondition.getGiver_id(), allCondition.getCampaign_name());
//			if(searchByName.size()>0){
//				for(CampaignModel c:searchByName){
//					List<GiverHistoryModel> searchById = giverHistoryDao.getByCampaign_id(allCondition.getGiver_id(), c.getId());
//						if(searchById.size()>0){
//							for(GiverHistoryModel g:searchById){
//								result.add(g);
//							}
//						}
//				}
//			}
//		}
		if(allCondition.getMinAmount() != null || allCondition.getMaxAmount() != null){
			giverHistoryAllConditionModel.makeDefaultAmount(allCondition);
			List<GiverHistoryModel> searchByAmount = giverHistoryDao
					.getByAmount(allCondition.getGiver_id(), allCondition.getMinAmount(), allCondition.getMaxAmount());
			if(searchByAmount.size()>0){
				for(GiverHistoryModel g:searchByAmount){
					result.add(g);
				}
			}
		}
		if(allCondition.getBeforeDate() != null || allCondition.getAfterDate() != null){
			giverHistoryAllConditionModel.makeDefaultDate(allCondition);
			List<GiverHistoryModel> searchByDate = giverHistoryDao
					.getByDate(allCondition.getGiver_id(), allCondition.getBeforeDate(), allCondition.getAfterDate());
			if(searchByDate.size()>0){
				for(GiverHistoryModel g:searchByDate){
					result.add(g);
				}
			}
		}
		if(result.size()>0){
			Set<GiverHistoryModel> pageResult = new TreeSet<GiverHistoryModel>();
			List<GiverHistoryModel> l = new ArrayList<GiverHistoryModel>(result);
			giverHistoryAllConditionModel.makeDefaultPage(allCondition);
			for(int i = allCondition.getPageSize()*allCondition.getPageNumber(); i < allCondition.getPageSize()*(allCondition.getPageNumber()+1) && i < result.size(); i++){
				pageResult.add(l.get(i));
			}
			return pageResult;
		}else{
			return null;
		}
	}
	
	public Integer loadCount(GiverHistoryAllConditionModel allCondition){
		return giverHistoryDao.getCount(allCondition);
	}
}
