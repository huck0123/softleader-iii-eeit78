package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;

@Repository
public class RaiserDao {
	@Autowired
	SessionFactory sessionFactory;

	public RaiserModel getByAccount(String account) {

		RaiserModel result = null;

		Session session = sessionFactory.getCurrentSession();

		try {
			Iterator raiserModels = session.createCriteria(RaiserModel.class)
					.add(Restrictions.eq("account", account).ignoreCase())
					.list().iterator();

			if (raiserModels.hasNext()) {

				result = (RaiserModel) raiserModels.next();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;

	}

	public RaiserModel insertAccount(RaiserModel rm) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(rm);
			return rm;
		} catch (Exception e) {
			System.out.println("新增帳號失敗");
			e.printStackTrace();
			return null;
		}
	}

	public RaiserModel update(RaiserModel rm) {
		RaiserModel result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(rm);
			return rm;
		} catch (Exception e) {
			System.out.println("資料更新發生錯誤");
			e.printStackTrace();
			return null;
		}
	}

	public RaiserModel getById(int id) {
		RaiserModel result = null;
		Session session = sessionFactory.getCurrentSession();
		try {
			result = (RaiserModel) session.get(RaiserModel.class, id);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("查無此人");
		}
		return null;
	}

	public List<RaiserModel> getAll() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RaiserModel.class);
		List<RaiserModel> result = criteria.list();
		return result;
	}

	public int getCount() {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RaiserModel.class);
		int count = criteria.list().size();
		return count;
	}

	public List<RaiserModel> getPerPage(int page) {

		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RaiserModel.class)
				.setFirstResult((page - 1) * 3).setMaxResults(3);
		List<RaiserModel> result = criteria.list();
		return result;
	}

	public int getByAllConditionCount(String account, String name,
			String contactPerson) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RaiserModel.class);
		if (account != null) {
			criteria.add(Restrictions.like("account", "%" + account + "%"));
		}
		if (name != null) {
			criteria.add(Restrictions.like("name", "%" + name + "%")
					.ignoreCase());
		}
		if (contactPerson != null) {
			criteria.add(Restrictions.like("contactPerson", "%" + contactPerson
					+ "%"));
		}
		int conut = (int) criteria.setProjection(Projections.rowCount())
				.uniqueResult();

		return conut;
	}

	public List<RaiserModel> getByAllCondition(String account, String name,
			String contactPerson, Integer pageNum, Integer pageSize) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(RaiserModel.class);
		if (account != null) {
			criteria.add(Restrictions.like("account", "%" + account + "%"));
		}
		if (name != null) {
			criteria.add(Restrictions.like("name", "%" + name + "%")
					.ignoreCase());
		}
		if (contactPerson != null) {
			criteria.add(Restrictions.like("contactPerson", "%" + contactPerson
					+ "%"));
		}
		// criteria.add(Restrictions.eq("show", true));

		List list = criteria
				.setFirstResult(pageNum * pageSize)
				.setMaxResults(pageSize).list();

		return list;
	}
}
