package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
					.add(Restrictions.eq("account", account).ignoreCase()).list().iterator();

			if (raiserModels.hasNext()) {
		
				result = (RaiserModel) raiserModels.next();
			}
	
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		return result;

	}
}
