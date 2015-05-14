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

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

@Repository
public class TransactionDao {

	@Autowired
	SessionFactory sessionFactory;
	@Autowired
	GiverHistoryAllConditionModel giverHistoryAllConditionModel;

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
		criteria.add(Restrictions.eq("campaignModel", cModel))
				.add(Restrictions.eq("credit", true))
				.setProjection(Projections.rowCount());
		int count = ((Long) criteria.uniqueResult()).intValue();

		return count;
	}

	// 取出某giverId的所有交易紀錄
	public List<TransactionDetailModel> getByGiverId(int gId) {
		
		Criteria criteria = getSession().createCriteria(
				TransactionDetailModel.class);
		List<TransactionDetailModel> models = criteria
				.add(Restrictions.eq("giverId", gId)).addOrder(Order.asc("id")).list();

		return models;
	}

	// 取出條件收尋的紀錄筆數
	public int getByConditionCount(String condition) {
		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class);
		criteria.createAlias("campaignModel", "model");
		
		Boolean b = null;
		if (condition.equals("true")) {
			b = true;
		} else if (condition.equals("false")) {
			b = false;
		}

		// 方法一
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.like("cardType", "%" + condition + "%").ignoreCase());
		or.add(Restrictions.like("cardNo", "%" + condition + "%"));
		or.add(Restrictions.like("cardHolder", "%" + condition + "%").ignoreCase());
		or.add(Restrictions.like("cardHolderEmail", "%" + condition + "%").ignoreCase());
		or.add(Restrictions.eq("credit", b));
		or.add(Restrictions.like("model.name", "%" + condition + "%").ignoreCase());
		criteria.add(or).setProjection(Projections.rowCount());
		int conditionCount = ((Long) criteria.uniqueResult()).intValue();
		
		return conditionCount;
				
	}
	
	//取出條件收尋的紀錄
	public List<TransactionDetailModel> getByCondition(String condition,
			int pageNum, int pageAmount) {
		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class);
		criteria.createAlias("campaignModel", "model");
		
		Boolean b = null;
		if (condition.equals("true")) {
			b = true;
		} else if (condition.equals("false")) {
			b = false;
		}
		
		//方法一
		Disjunction or = Restrictions.disjunction();
		or.add(Restrictions.like("cardType", "%"+condition+"%").ignoreCase());
		or.add(Restrictions.like("cardNo", "%" + condition + "%"));
		or.add(Restrictions.like("cardHolder", "%"+condition+"%").ignoreCase());
		or.add(Restrictions.like("cardHolderEmail", "%"+condition+"%").ignoreCase());
		or.add(Restrictions.eq("credit", b));
		or.add(Restrictions.like("model.name", "%"+condition+"%").ignoreCase());
		List<TransactionDetailModel> models = criteria.add(or)
				.setFirstResult((pageNum - 1) * pageAmount)
				.setMaxResults(pageAmount).addOrder(Order.asc("id")).list();

		
		//方法二
//		Criterion c1 = Restrictions.like("cardType", "%"+condition+"%").ignoreCase();
//		Criterion c2 = Restrictions.like("cardHolderEmail", "%"+condition+"%").ignoreCase();
//		Criterion c3 = Restrictions.or(c1, c2);
//		List<TransactionDetailModel> models = criteria.add(c3).list();
		
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
		List<TransactionDetailModel> list = criteria.add(Restrictions.eq("id", id)).list();
		if (list.size() > 0) {
			model = list.get(0);
			return model;
		} else {
			return null;
		}
	}

	//藉由條件取出某giverId的所有交易紀錄
	@SuppressWarnings("unchecked")
	public List<TransactionDetailModel> getByIdAndCondition(GiverHistoryAllConditionModel allCondition){
		
		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class);
		Disjunction or = Restrictions.disjunction();
		criteria.createAlias("campaignModel", "a");
		criteria.createAlias("a.raiserModel", "b");	
		
		criteria.add(Restrictions.eq("giverId", allCondition.getGiver_id()));
		
		if(allCondition.getKeyword() != null){
			or.add(Restrictions.like("a.name", "%" + allCondition.getKeyword() + "%"));
			or.add(Restrictions.like("b.name", "%" + allCondition.getKeyword() + "%"));
			criteria.add(or);
//			criteria.createCriteria("campaignModel")
//					.add(Restrictions.like("name", "%" + allCondition.getKeyword() + "%"));
//			criteria.createCriteria("campaignModel").createCriteria("raiserModel")
//					.add(Restrictions.like("name", "%" + allCondition.getKeyword() + "%"));
		}
		if(allCondition.getMinAmount() != null || allCondition.getMaxAmount() != null){
			giverHistoryAllConditionModel.makeDefaultAmount(allCondition);
			criteria.add(Restrictions.le("amount", allCondition.getMaxAmount()))
					.add(Restrictions.ge("amount", allCondition.getMinAmount()));
		}
		if(allCondition.getBeforeDate() != null || allCondition.getAfterDate() != null){
			giverHistoryAllConditionModel.makeDefaultDate(allCondition);
			criteria.add(Restrictions.between("date", allCondition.getAfterDate(), allCondition.getBeforeDate()));
		}
		if(allCondition.getPageNumber() == null || allCondition.getPageSize() == null){
			giverHistoryAllConditionModel.makeDefaultPage(allCondition);
		}
		
		List<TransactionDetailModel> transactionDetailModel = criteria
				.setFirstResult(allCondition.getPageNumber() * allCondition.getPageSize())
				.setMaxResults(allCondition.getPageSize()).addOrder(Order.asc("id")).list();
		return transactionDetailModel;
	}
	
	// 更新
	public void update(TransactionDetailModel model) {

		getSession().save(model);
	}

}
