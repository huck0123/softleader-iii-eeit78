package tw.org.iiiedu.thegivers.dao;

import java.sql.Timestamp;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;

@Repository
public class GiverHistoryDao {

	@Autowired
	SessionFactory sessionFactory;


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

}
