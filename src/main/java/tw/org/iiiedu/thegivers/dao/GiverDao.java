package tw.org.iiiedu.thegivers.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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

	// 頁次 pageNum為第幾頁,一頁5筆
	public List<GiverModel> getPerPage(int pageNum) {
		Criteria criteria = getSession().createCriteria(GiverModel.class)
				.setFirstResult((pageNum - 1) * 5).setMaxResults(5);
		List<GiverModel> models = criteria.addOrder(Order.asc("id")).list();
		return models;
	}

	// 名字收尋 unfinish
	// public GiverModel getByName(String name){
	// Criteria criteria = getSession().createCriteria(GiverModel.class);
	// criteria.add(Restrictions.eq("account", bean.getAccount()).ignoreCase());
	// GiverModel model = (GiverModel) criteria.list().iterator().next();
	//
	// }

	// 更新資料
	public void update(GiverModel bean) {
		getSession().update(bean);

	}

	// 刪除資料
	public void delete(String accouont) {
		getSession().delete(accouont);
	}

	// 條件收尋筆數
	public int getByAllConditionCount(String account, String name,
			String familyName, String tel, String email) {
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

		int count = ((Long) criteria.setProjection(
				Projections.rowCount()).uniqueResult()).intValue();

		return count;
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

}
