package tw.org.iiiedu.thegivers.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.GiverModel;

@Repository
public class GiverDao {

	@Autowired
	SessionFactory sessionFactory;

	//查詢帳號
	public GiverModel getByAccount(String account) {

		GiverModel result = null;

		Session session = sessionFactory.getCurrentSession();

		try {
			Transaction tx = session.beginTransaction();
			Criteria criteria = session.createCriteria(GiverModel.class);
			criteria.add(Restrictions.eq("account", account).ignoreCase());
			Iterator i = criteria.list().iterator();
			
//			Iterator giverModels = session.createCriteria(GiverModel.class)
//					.add(Restrictions.eq("account", account).ignoreCase())
//					.list().iterator();

			if (i.hasNext()) {
				result = (GiverModel) i.next();
			}
			tx.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//註冊帳號
	public GiverModel insert(GiverModel bean){
		 Session session = sessionFactory.getCurrentSession();

		 Transaction tx = session.beginTransaction();
		 Criteria criteria = session.createCriteria(GiverModel.class);
		 criteria.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
		 List<GiverModel> result = criteria.list(); 
		 
		 if(result == null){
			 session.save(bean);
			 tx.commit();
			 return bean;
		 }
		 
		 
		 
		 return null;
		
	}

}
