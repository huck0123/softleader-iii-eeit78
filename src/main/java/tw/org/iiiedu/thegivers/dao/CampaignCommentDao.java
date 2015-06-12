package tw.org.iiiedu.thegivers.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.form.CampaignCommentForm;
import tw.org.iiiedu.thegivers.model.CampaignCommentModel;

@Repository
public class CampaignCommentDao {
	
	@Autowired
	SessionFactory sessionFactory;
	
	public Integer insert(CampaignCommentModel model){
		Session session = sessionFactory.getCurrentSession();
		try{
			return (Integer)session.save(model);
		}catch(Exception e){
			e.printStackTrace();
			return -1;
		}
	}
	
	public boolean update(CampaignCommentModel model){
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(model);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public boolean delete(Integer id){
		Session session = sessionFactory.getCurrentSession();
		try{
			CampaignCommentModel model = (CampaignCommentModel)session.createCriteria(CampaignCommentModel.class)
					.add(Restrictions.eq("id", id)).list().get(0);
			session.delete(model);
			
			Iterator<CampaignCommentModel> models = session.createCriteria(CampaignCommentModel.class)
					.add(Restrictions.eq("pendingId", id)).list().iterator();
			while(models.hasNext()){
				CampaignCommentModel temp = models.next();
				session.delete(temp);
			}
			
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	@SuppressWarnings("unchecked")
	public CampaignCommentModel getById(Integer id){
		Session session = sessionFactory.getCurrentSession();
		List<CampaignCommentModel> model = session.createCriteria(CampaignCommentModel.class)
				.add(Restrictions.eq("id", id)).list();
		return model.get(0);
	}
	
	@SuppressWarnings("unchecked")
	public List<CampaignCommentModel> getAll(Integer campaignId){

		Session session = sessionFactory.getCurrentSession();
		List<CampaignCommentModel> models = session.createCriteria(CampaignCommentModel.class)
				.add(Restrictions.eq("campaignId", campaignId))
				.add(Restrictions.eq("replyId", 0))
				.list();
		List<CampaignCommentModel> models2 = session.createCriteria(CampaignCommentModel.class)
				.add(Restrictions.eq("campaignId", campaignId))
				.add(Restrictions.ne("replyId", 0))
				.list();
		for(int i=0 ; i<models2.size() ; i++){
			models.add(models2.get(i));
		}
		return models;
	}
}
