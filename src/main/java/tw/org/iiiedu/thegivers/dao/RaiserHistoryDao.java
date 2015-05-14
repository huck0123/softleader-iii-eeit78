package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;
import tw.org.iiiedu.thegivers.model.RaiserHistoryModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;

@Repository
public class RaiserHistoryDao {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	private GiverHistoryAllConditionModel giverHistoryAllConditionModel;


	@SuppressWarnings("unchecked")
	public List<GiverHistoryModel> getAll(Integer giver_id, Integer number, Integer size) {
		Session session = sessionFactory.getCurrentSession();

		return session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id))
				.setFirstResult(number * size).setMaxResults(size).list();
	}
	
	@SuppressWarnings("unchecked")	
	public List<GiverHistoryModel> getByCampaign_id(Integer giver_id, Integer campaign_id){
		Session session = sessionFactory.getCurrentSession();
		
		return session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id))
				.add(Restrictions.eq("campaign_id", campaign_id)).list();
	}
	
	@SuppressWarnings("unchecked")	
	public List<CampaignModel> getByCampaign_name(Integer giver_id, String campaign_name){
		Session session = sessionFactory.getCurrentSession();
		
		return session.createCriteria(CampaignModel.class)
				.add(Restrictions.eq("giver_id", giver_id))
				.add(Restrictions.like("name", "%" + campaign_name + "%")).list();
	}
	
	@SuppressWarnings("unchecked")	
	public List<GiverHistoryModel> getByAmount(Integer giver_id, Integer min, Integer max){
		Session session = sessionFactory.getCurrentSession();
		
		return session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id))
				.add(Restrictions.lt("amount", max))
				.add(Restrictions.gt("amount", min)).list();
	}
	
	@SuppressWarnings("unchecked")	
	public List<GiverHistoryModel> getByDate(Integer giver_id, Timestamp before, Timestamp after){
		Session session = sessionFactory.getCurrentSession();
		
		return session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id))
				.add(Restrictions.between("date", after, before)).list();
	}
	
	public Integer getCount(GiverHistoryAllConditionModel allCondition){
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", allCondition.getGiver_id()));
		
//		if(allCondition.getCampaign_name() != null){
//			criteria = session.createCriteria(CampaignModel.class)
//					.add(Restrictions.like("name", "%" + allCondition.getCampaign_name() + "%"));
//		}
//		
//		if(allCondition.getCampaign_id() != null){
//			criteria.add(Restrictions.eq("campaign_id", allCondition.getCampaign_id()));
//		}
//		if(allCondition.getCampaign_name() != null){
//			criteria.createCriteria("CampaignModel.class")
//					.add(Restrictions.like("name", "%" + allCondition.getCampaign_name() + "%"));
//		}
//		if(allCondition.getMinAmount() != null || allCondition.getMaxAmount() != null){
//			giverHistoryAllConditionModel.makeDefaultAmount(allCondition);
//			criteria.add(Restrictions.lt("amount", allCondition.getMaxAmount()))
//					.add(Restrictions.gt("amount", allCondition.getMinAmount()));
//		}
//		if(allCondition.getBeforeDate() != null || allCondition.getAfterDate() != null){
//			giverHistoryAllConditionModel.makeDefaultDate(allCondition);
//			criteria.add(Restrictions.between("date", allCondition.getAfterDate(), allCondition.getBeforeDate()));
//		}
//		
		return (Integer)criteria.setProjection(Projections.rowCount()).uniqueResult();
	}
}
