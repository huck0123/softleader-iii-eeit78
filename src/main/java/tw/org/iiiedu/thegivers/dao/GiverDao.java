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

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 查詢帳號
		public GiverModel getByAccount(String account) {

			GiverModel result = null;

			Criteria criteria = getSession().createCriteria(GiverModel.class);
			result = (GiverModel) criteria
					.add(Restrictions.eq("account", account).ignoreCase()).list()
					.get(0);

			return result;
		}

		// 註冊帳號
		public GiverModel insert(GiverModel bean) {

			getSession().save(bean);
			
			return bean;
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
//	public boolean hide(String account){
//		
//		Criteria criteria = getSession().createCriteria(GiverModel.class);
//		Iterator iterator = criteria
//				.add(Restrictions.eq("account", account).ignoreCase()).list().iterator();
//		try {
//			if (iterator.hasNext()) {
//				GiverModel bean = (GiverModel) iterator.next();
//				bean.setValid(false);
//				return true;
//			}
//		} catch (HibernateException e) {
//			e.printStackTrace();
//		}
//		return false;
//	}
	
	//getAll
	public List<GiverModel> getAll(){
		
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> result = criteria.list();
		
		return result;
	}
	
	//總筆數
	public int getCount(){
		
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> result = criteria.list();
		int count = result.size();
		
		return count;
	}
	
	//頁次   pageNum為第幾頁,一頁5筆
	public List<GiverModel> getPerPage(int pageNum){
		Criteria criteria = getSession().createCriteria(GiverModel.class)
				.setFirstResult((pageNum-1)*5).setMaxResults(5);
		List<GiverModel> result = criteria.list();
		return result;
	}
	
	//名字收尋 unfinish
//	public GiverModel getByName(String name){
//		Criteria criteria = getSession().createCriteria(GiverModel.class);
//		criteria.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
//		GiverModel model = (GiverModel) criteria.list().iterator().next();
//
//	}
	

	// 更新資料
	public void update(GiverModel bean) {
		getSession().update(bean);

	}

	// 刪除資料
	public void delete(String accouont) {
		getSession().delete(accouont);
	}

	// 條件收尋
	public List<GiverModel> getByAllCondition(String account, String name,
			String familyName, String tel, String email, Integer pageNum,
			Integer pageSize) {

		Criteria criteria = getSession().createCriteria(GiverModel.class);
		if (account != null) {
			criteria.add(Restrictions.like("account", "%" + account + "%")
					.ignoreCase());
		}
		if (name != null) {
			criteria.add(Restrictions.eq("name", name));
		}
		if (familyName != null) {
			criteria.add(Restrictions.eq("familyName", familyName));
		}
		if (tel != null) {
			criteria.add(Restrictions.eq("tel", tel));
		}
		if (email != null) {
			criteria.add(Restrictions.eq("email", email));
		}

		// criteria.add(Restrictions.eq("show", true));

		List<GiverModel> models = criteria.setFirstResult(pageNum * pageSize)
				.setMaxResults(pageSize).list();

		return models;
	}

	// 條件收尋筆數
	
	
}
