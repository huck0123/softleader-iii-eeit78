package tw.org.iiiedu.thegivers.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	//收尋
//	public TransactionDetailModel getByAllCondition()
	
}
