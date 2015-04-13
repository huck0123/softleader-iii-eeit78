package tw.org.iiiedu.thegivers.dao;

import java.util.Iterator;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.AdminModel;

@Repository
public class AdminDao {

	@Autowired
	SessionFactory sessionFactory;

	public AdminModel getByAccount(String account) {

	

		AdminModel result = null;

		Session session = sessionFactory.getCurrentSession();

		try {
			Iterator adminModels = session.createCriteria(AdminModel.class)
					.add(Restrictions.eq("account", account).ignoreCase()).list().iterator();
			if (adminModels.hasNext()) {
				result = (AdminModel) adminModels.next();
			}

		} catch (Exception e) {

			e.printStackTrace();
		}
		return result;

	}

}
