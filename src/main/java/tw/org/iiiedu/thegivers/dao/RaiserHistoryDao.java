package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.GiverHistoryModel;
import tw.org.iiiedu.thegivers.model.RaiserHistoryModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;

@Repository
public class RaiserHistoryDao {
	
	@Autowired
	SessionFactory sessionFactory;

	public List<RaiserHistoryModel> getByRaiser_id(Integer raiser_id) {

		List<RaiserHistoryModel> result = null;
		Session session = sessionFactory.getCurrentSession();

		result = session.createCriteria(RaiserHistoryModel.class)
				.add(Restrictions.eq("raiser_id", raiser_id)).list();
		System.out.println(result);
		return result;
	}
}
