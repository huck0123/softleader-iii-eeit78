package tw.org.iiiedu.thegivers.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;

@Repository
public class GiverHistoryDao {

	@Autowired
	SessionFactory sessionFactory;


	@SuppressWarnings("unchecked")
	public List<GiverHistoryModel> getByGiver_id(Integer giver_id) {
		Session session = sessionFactory.getCurrentSession();

		return session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id)).list();
	}


	@SuppressWarnings("unchecked")	
	public Set<GiverHistoryModel> getByAllCondition(GiverHistoryAllConditionModel allCondition){
		Session session = sessionFactory.getCurrentSession();
		Set<GiverHistoryModel> result = new HashSet<GiverHistoryModel>();
		Integer min, max = null;
		Timestamp before, after = null;
		
		
		if(allCondition.getCampaign_id() != null){
			List<GiverHistoryModel> ghm = 
					session.createCriteria(GiverHistoryModel.class)
					.add(Restrictions.eq("campaign_id", allCondition.getCampaign_id())).list();
			for(GiverHistoryModel g:ghm){
				result.add(g);
			}
		}
		
		if(allCondition.getCampaign_name() != null){
			List<CampaignModel> cm = 
					session.createCriteria(CampaignModel.class)
					.add(Restrictions.like("name", "%" + allCondition.getCampaign_name() + "%")).list();
			
			for(CampaignModel c:cm){
				List<GiverHistoryModel> ghm = 
					session.createCriteria(GiverHistoryModel.class)
					.add(Restrictions.eq("campaign_id", c.getId())).list();
				for(GiverHistoryModel g:ghm){
					result.add(g);
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
			
			List<GiverHistoryModel> ghm = 
					session.createCriteria(GiverHistoryModel.class)
					.add(Restrictions.lt("amount", min))
					.add(Restrictions.gt("amount", max)).list();
			
			for(GiverHistoryModel g:ghm){
				result.add(g);
			}
		}
		
		if((before = allCondition.getBeforeDate()) != null || (after = allCondition.getAfterDate()) != null){
			if(before == null){
				before = new Timestamp(new Date().getTime());
			}
			if(after == null){
				after = new Timestamp(0);
			}
			
			List<GiverHistoryModel> ghm = 
					session.createCriteria(GiverHistoryModel.class)
					.add(Restrictions.between("date", before, after)).list();
			
			for(GiverHistoryModel g:ghm){
				result.add(g);
			}
		}
		
		return result;	
	}
}
