package tw.org.iiiedu.thegivers.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

@Repository
public class TransactionDao {

	@Autowired
	SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// 捐款(信用卡捐款)
	public TransactionDetailModel insert(TransactionDetailModel model) {

		getSession().save(model);

		return model;
	}

	//取出所有交易紀錄筆數
	public int getCount(){
		
		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class);
		criteria.setProjection(Projections.rowCount());
		int count = ((Long) criteria.uniqueResult()).intValue();
		return count;
	}
	
	// 取出某campaignId的所有交易紀錄筆數
	public int getCountByCampaignId(CampaignModel cModel) {

		// ProjectionList projectionList = Projections.projectionList();
		// projectionList.add(Projections.groupProperty("CampaignModel"));
		// projectionList.add(Projections.rowCount());

		Criteria criteria = getSession().createCriteria(
				TransactionDetailModel.class);
		criteria.add(Restrictions.eq("campaignModel", cModel)).add(Restrictions.eq("credit", true)).setProjection(
				Projections.rowCount());
		int count = ((Long) criteria.uniqueResult()).intValue();

		return count;
	}

	// 取出某giverId的所有交易紀錄
	public List<TransactionDetailModel> getByGiverId(int gId) {
		
		Criteria criteria = getSession().createCriteria(
				TransactionDetailModel.class);
		List<TransactionDetailModel> models = criteria
				.add(Restrictions.eq("giverId", gId)).addOrder(Order.asc("id"))
				.list();

		return models;
	}

	// 取出所有交易紀錄
	public List<TransactionDetailModel> getAll() {

		Criteria criteria = getSession().createCriteria(
				TransactionDetailModel.class);
		List<TransactionDetailModel> models = criteria
				.addOrder(Order.asc("id")).list();
		return models;
	}

	// 頁次 pageNum為第幾頁,一頁5筆
	public List<TransactionDetailModel> getPerPage(int pageNum, int pageAmount) {

		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class)
				.setFirstResult((pageNum-1)*pageAmount).setMaxResults(pageAmount);
		List<TransactionDetailModel> models = criteria.addOrder(Order.asc("id")).list();
		return models;
	}

	// 用ID查詢
	public TransactionDetailModel getById(int id) {
		TransactionDetailModel model;

		Criteria criteria = getSession().createCriteria(
				TransactionDetailModel.class);
		List<TransactionDetailModel> list = criteria.add(
				Restrictions.eq("id", id)).list();
		if (list.size() > 0) {
			model = list.get(0);
			return model;
		} else {
			return null;
		}
	}

	// 更新
	public void update(TransactionDetailModel model) {

		getSession().save(model);
	}

	// 收尋
	// public TransactionDetailModel getByAllCondition()

}
