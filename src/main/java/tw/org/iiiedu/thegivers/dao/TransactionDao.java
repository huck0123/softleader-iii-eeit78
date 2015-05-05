package tw.org.iiiedu.thegivers.dao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
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
	
	//捐款(信用卡捐款)
	public TransactionDetailModel insert(TransactionDetailModel model){

		getSession().save(model);
		
		return model;
	}
	
	//取出某campaignId的所有交易紀錄
	public int getCountByCampaignId(CampaignModel cModel){
		
//		ProjectionList projectionList = Projections.projectionList();
//		projectionList.add(Projections.groupProperty("CampaignModel"));
//		projectionList.add(Projections.rowCount());
		
		Criteria criteria = getSession().createCriteria(TransactionDetailModel.class);
		criteria.add(Restrictions.eq("CampaignModel", cModel)).setProjection(Projections.rowCount());
		int count = ((Long) criteria.uniqueResult()).intValue();
		
		return count;
	}
	
	//收尋
//	public TransactionDetailModel getByAllCondition()
	
}
