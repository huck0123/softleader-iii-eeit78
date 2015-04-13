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

import tw.org.iiiedu.thegivers.model.AdminModel;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverModel;

@Repository
public class GiverDao {

	@Autowired
	SessionFactory sessionFactory;

	public GiverModel getByAccount(String account) {

		GiverModel result = null;

		Session session = sessionFactory.getCurrentSession();

		
		try {
			Iterator giverModels = session.createCriteria(GiverModel.class)
					.add(Restrictions.eq("account", account).ignoreCase()).list().iterator();

			if (giverModels.hasNext()) {
		
				result = (GiverModel) giverModels.next();
			}
	
		} catch (Exception e) {
	
			e.printStackTrace();
		}
		return result;

	}

}
