package tw.org.iiiedu.thegivers.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
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

		GiverModel model = null;

		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> list = criteria.add(
				Restrictions.eq("account", account).ignoreCase()).list();
		if (list.size() > 0) {
			model = list.get(0);
			return model;
		} else {
			return null;
		}

	}

	// 註冊帳號
	public GiverModel insert(GiverModel model) {

		getSession().save(model);

		return model;
	}

	// ID收尋
	public GiverModel getById(int id) {

		GiverModel model = (GiverModel) getSession().get(GiverModel.class, id);
		return model;

	}

	// getAll
	public List<GiverModel> getAll() {

		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> models = criteria.addOrder(Order.asc("id")).list();

		return models;
	}

	// 總筆數
	public int getCount() {

		Criteria criteria = getSession().createCriteria(GiverModel.class);
		int count = ((Long) criteria.setProjection(Projections.rowCount())
				.uniqueResult()).intValue();
		// List<GiverModel> models = criteria.list();
		// int count = models.size();

		return count;
	}

	// 頁次 pageNum為第幾頁,一頁5筆  -----deprecated-----
	public List<GiverModel> getPerPage(int pageNum) {
		Criteria criteria = getSession().createCriteria(GiverModel.class)
				.setFirstResult((pageNum - 1) * 5).setMaxResults(5);
		List<GiverModel> models = criteria.addOrder(Order.asc("id")).list();
		return models;
	}

	//條件收尋筆數
	public int getByConditionCount(String condition){
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		
		Boolean b = null;
		if(condition.equals("true")){
			b = true;
		}else if(condition.equals("false")){
			b = false;
		}
		
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.like("account", "%"+condition+"%"));
		or.add(Restrictions.like("name", "%"+condition+"%"));
		or.add(Restrictions.like("familyName", "%"+condition+"%"));
		or.add(Restrictions.like("address", "%"+condition+"%"));
		or.add(Restrictions.like("email", "%"+condition+"%"));
		or.add(Restrictions.like("tel", "%"+condition+"%"));
		or.add(Restrictions.eq("valid", b));
	
		criteria.add(or).setProjection(Projections.rowCount());
		int conditionCount = ((Long) criteria.uniqueResult()).intValue();
		return conditionCount;
		
	}
	
	//條件收尋
	public List<GiverModel> getByCondition(String condition, int pageNum, int pageAmount){
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		
		Boolean b = null;
		if(condition.equals("true")){
			b = true;
		}else if(condition.equals("false")){
			b = false;
		}
		
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.like("account", "%"+condition+"%"));
		or.add(Restrictions.like("name", "%"+condition+"%"));
		or.add(Restrictions.like("familyName", "%"+condition+"%"));
		or.add(Restrictions.like("address", "%"+condition+"%"));
		or.add(Restrictions.like("email", "%"+condition+"%"));
		or.add(Restrictions.like("tel", "%"+condition+"%"));
		or.add(Restrictions.eq("valid", b));
		
		List<GiverModel> models = criteria.add(or)
				.setFirstResult((pageNum-1) * pageAmount)
				.setMaxResults(pageAmount).addOrder(Order.asc("id")).list();
		
		return models;
	}
	
	//身分證收尋
	public GiverModel getByIdNumber(String idNumber){
		Criteria criteria = getSession().createCriteria(GiverModel.class);
		List<GiverModel> list =  criteria.add(
				Restrictions.eq("idNumber", idNumber)).list();
		GiverModel model;
		
		if(list.size() > 0){
			model = list.get(0);
			return model;
		}else{
			return null;
		}
		
	}
	
	
	// 更新資料
	public void update(GiverModel bean) {
		getSession().update(bean);

	}

	// 刪除資料
	public void delete(String accouont) {
		getSession().delete(accouont);
	}

//	// 條件收尋筆數   -----deprecated-----
//	public int getByAllConditionCount(String account, String name,
//			String familyName, String tel, String email) {
//		Criteria criteria = getSession().createCriteria(GiverModel.class);
//		if (account != null) {
//			criteria.add(Restrictions.like("account", "%" + account + "%")
//					.ignoreCase());
//		}
//		if (name != null) {
//			criteria.add(Restrictions.eq("name", name));
//		}
//		if (familyName != null) {
//			criteria.add(Restrictions.eq("familyName", familyName));
//		}
//		if (tel != null) {
//			criteria.add(Restrictions.eq("tel", tel));
//		}
//		if (email != null) {
//			criteria.add(Restrictions.eq("email", email));
//		}
//
//		int count = ((Long) criteria.setProjection(
//				Projections.rowCount()).uniqueResult()).intValue();
//
//		return count;
//	}
//
//	// 條件收尋    -----deprecated-----
//	public List<GiverModel> getByAllCondition(String account, String name,
//			String familyName, String tel, String email, Integer pageNum,
//			Integer pageSize) {
//
//		Criteria criteria = getSession().createCriteria(GiverModel.class);
//		if (account != null) {
//			criteria.add(Restrictions.like("account", "%" + account + "%")
//					.ignoreCase());
//		}
//		if (name != null) {
//			criteria.add(Restrictions.eq("name", name));
//		}
//		if (familyName != null) {
//			criteria.add(Restrictions.eq("familyName", familyName));
//		}
//		if (tel != null) {
//			criteria.add(Restrictions.eq("tel", tel));
//		}
//		if (email != null) {
//			criteria.add(Restrictions.eq("email", email));
//		}
//
//		// criteria.add(Restrictions.eq("show", true));
//
//		List<GiverModel> models = criteria.setFirstResult(pageNum * pageSize)
//				.setMaxResults(pageSize).list();
//
//		return models;
//	}

}
