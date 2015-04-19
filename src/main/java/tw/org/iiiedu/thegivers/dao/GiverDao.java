package tw.org.iiiedu.thegivers.dao;

import java.util.Iterator;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.GiverModel;

@Repository
public class GiverDao {

	@Autowired
	SessionFactory sessionFactory;

	private Session session;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 查詢帳號
	public GiverModel getByAccount(String account) {

		GiverModel result = null;

		try {
			Criteria criteria = getSession().createCriteria(GiverModel.class);
			criteria.add(Restrictions.eq("account", account).ignoreCase());
			Iterator i = criteria.list().iterator();

			if (i.hasNext()) {
				result = (GiverModel) i.next();
			}

		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 註冊帳號
	public GiverModel insert(GiverModel bean) {

		Criteria criteria = getSession().createCriteria(GiverModel.class);
		criteria.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
		List<GiverModel> result = criteria.list();

//		try {
			getSession().save(bean);
			return bean;
//		} 
//		catch (HibernateException e) {
//			e.printStackTrace();
//			System.out.println("insert fail");
//		}
//
//		return bean;
	}

	// 取得ID
	public GiverModel getById(int id) {

		try {
			GiverModel bean = (GiverModel) getSession().get(GiverModel.class,
					id);
			return bean;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("can not find this id");
		}

		return null;
	}
	
	//關閉帳號 (用戶端)
	public boolean hide(String account){
		
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		Iterator iterator = criteria
				.add(Restrictions.eq("account", account).ignoreCase()).list().iterator();
		try {
			if (iterator.hasNext()) {
				GiverModel bean = (GiverModel) iterator.next();
				bean.setValid(false);
				return true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//getAll
	public List<GiverModel> getAll(){
		
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> result = criteria.list();
		
//		System.out.println(result.size());
		return result;
	}
	
	//總筆數
	public int getCount(){
		
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> result = criteria.list();
		int count = result.size();
		
		return count;
	}
	
	//名字收尋 unfinish
//	public GiverModel getByName(String name){
//		Criteria criteria = getSession().createCriteria(GiverModel.class);
//		criteria.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
//		GiverModel model = (GiverModel) criteria.list().iterator().next();
//
//	}
	

	// 更新資料
	public GiverModel update(GiverModel bean) {
		Session session = sessionFactory.openSession();
		
		Criteria criteria = session.createCriteria(GiverModel.class)
				.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
		GiverModel model = (GiverModel) criteria.list().iterator().next();

		bean.setId(model.getId());
		session.close();
		try {
			getSession().update(bean);
			return bean;
		} catch (HibernateException e) {
			e.printStackTrace();
			System.out.println("update fail");
		}
		return null;

	}

	
	
}
