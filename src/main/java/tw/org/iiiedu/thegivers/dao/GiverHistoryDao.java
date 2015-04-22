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

@Repository
public class GiverHistoryDao {

	@Autowired
	SessionFactory sessionFactory;

	public List<GiverHistoryModel> getByGiver_id(Integer giver_id) {

		List<GiverHistoryModel> result = null;
		Session session = sessionFactory.getCurrentSession();

		result = session.createCriteria(GiverHistoryModel.class)
				.add(Restrictions.eq("giver_id", giver_id)).list();
		System.out.println(result);
		return result;
	}
}
