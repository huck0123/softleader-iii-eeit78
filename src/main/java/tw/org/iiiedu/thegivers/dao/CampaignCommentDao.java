package tw.org.iiiedu.thegivers.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
	
	public boolean update(CampaignCommentForm form){
		Session session = sessionFactory.getCurrentSession();
		try{
			session.update(form);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean delete(Integer id){
		Session session = sessionFactory.getCurrentSession();
		try{
			CampaignCommentModel model = (CampaignCommentModel)session.createCriteria(CampaignCommentModel.class).add(Restrictions.eq("id", id));
			session.delete(model);
			return true;
		}catch(Exception e){
			e.printStackTrace();
			return false;
		}
	}
	
	public CampaignCommentModel getById(Integer id){
		Session session = sessionFactory.getCurrentSession();
		List<CampaignCommentModel> model = session.createCriteria(CampaignCommentModel.class).add(Restrictions.eq("id", id)).list();
		return model.get(0);
	}
}
