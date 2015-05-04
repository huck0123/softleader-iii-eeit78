package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import javax.sql.DataSource;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverModel;

@Repository
public class CampaignDao {

	@Autowired
	SessionFactory sessionFactory;

	public CampaignModel getById(int id) {

		CampaignModel result = null;
		Session session = sessionFactory.getCurrentSession();

		try {
			result = (CampaignModel) session.get(CampaignModel.class, id);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return result;
	}

	public List<CampaignModel> getAll(Integer pageNum,Integer pageSize) {

		Session session = sessionFactory.getCurrentSession();

		try {
			List campaignModels = session.createCriteria(CampaignModel.class)
					.setFirstResult(pageNum * pageSize).setMaxResults(pageSize).list();


			if (campaignModels.size() > 0) {

				return campaignModels;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public Long getByAllConditionCount(CampaignForm campaignForm) {
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CampaignModel.class);
		if(campaignForm.getId() != null){
			criteria.add(Restrictions.like("id", campaignForm.getId()));
		}
		if(campaignForm.getName() != null){
			criteria.add(Restrictions.like("name", "%"+campaignForm.getName()+"%").ignoreCase());
		}
		if(campaignForm.getType() != null){
			criteria.add(Restrictions.eq("type", campaignForm.getType()));
		}
		if(campaignForm.getLocation() != null){
			criteria.add(Restrictions.eq("location", campaignForm.getLocation()));
		}

		// criteria.add(Restrictions.eq("show", true));
		
		Long rows = (Long) criteria.setProjection(Projections.rowCount()).uniqueResult();
		
		return rows;
	}
	
	public List<CampaignModel> getByAllCondition(CampaignForm campaignForm) {
		System.out.println(campaignForm.getId());
		Session session = sessionFactory.getCurrentSession();
		Criteria criteria = session.createCriteria(CampaignModel.class);
		if(campaignForm.getId() != null){
			System.out.println(campaignForm.getId());
			criteria.add(Restrictions.eq("id", campaignForm.getId()));
		}
		if(campaignForm.getName() != null){
			System.out.println(campaignForm.getName());
			criteria.add(Restrictions.like("name", "%"+campaignForm.getName()+"%").ignoreCase());
		}
		if(campaignForm.getType() != null){
			criteria.add(Restrictions.eq("type", campaignForm.getType()));
		}
		if(campaignForm.getLocation() != null){
			criteria.add(Restrictions.eq("location", campaignForm.getLocation()));
		}

		// criteria.add(Restrictions.eq("show", true));
		
		
		List campaignModels = criteria.setFirstResult(campaignForm.getPageNum() * campaignForm.getPageSize()).setMaxResults(campaignForm.getPageSize()).list();
		System.out.println(campaignModels);
		return campaignModels;
	}

	public boolean insert(CampaignModel cm) {

		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(cm);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean update(CampaignModel cm) {

		Session session = sessionFactory.getCurrentSession();
		try {
			session.update(cm);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean delete(int id) {

		Session session = sessionFactory.getCurrentSession();
		try {
			Iterator<CampaignModel> campaignModels = session
					.createCriteria(CampaignModel.class)
					.add(Restrictions.eq("id", id)).list().iterator();
			if (campaignModels.hasNext()) {
				session.delete(campaignModels.next());
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public List<CampaignModel> getByName(String name) {

		List<CampaignModel> result = new ArrayList<CampaignModel>();
		Session session = sessionFactory.getCurrentSession();

		try {
			Iterator<CampaignModel> campaignModels = session
					.createCriteria(CampaignModel.class)
					.add(Restrictions.like("name", "%" + name + "%")).list()
					.iterator();
			while (campaignModels.hasNext()) {
				CampaignModel cm = campaignModels.next();
				result.add(cm);
			}
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Integer getCount() {

		Session session = sessionFactory.getCurrentSession();
		List campaignModels = session.createCriteria(CampaignModel.class)
				.list();

		if (campaignModels.size() > 0) {

			return campaignModels.size();
		}
		return null;
	}

	//
	// public List<CampaignModel> getByLocation(String location) {
	//
	// String sqlString = "select * from campaign where location = ?";
	// ResultSet rs = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
	// pstmt.setString(1, location);
	// rs = pstmt.executeQuery();
	// List<CampaignModel> lcm = new ArrayList<>();
	// CampaignModel cm = null;
	// while (rs.next()) {
	// cm = new CampaignModel();
	// cm.setId(rs.getLong("id"));
	// cm.setName(rs.getString("name"));
	// cm.setRaiserId(rs.getInt("raiser_id"));
	// cm.setGoal(rs.getInt("goal"));
	// cm.setDate(rs.getTimestamp("date"));
	// cm.setDuration(rs.getInt("duration"));
	// cm.setCurrentFund(rs.getInt("current_fund"));
	// cm.setType(rs.getString("type"));
	// cm.setType(rs.getString("vedio_url"));
	// cm.setType(rs.getString("detail"));
	// cm.setShow(rs.getBoolean("show"));
	// cm.setLocation(rs.getString("location"));
	// lcm.add(cm);
	// }
	// return lcm;
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// if (rs != null) {
	// try {
	// rs.close();
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }
	// }
	// return null;
	// }
	//

	//
	// public List<CampaignModel> getByType(String type) {
	//
	// String sqlString = "select * from campaign where type = ?";
	// ResultSet rs = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
	// pstmt.setString(1, type);
	// rs = pstmt.executeQuery();
	// List<CampaignModel> lcm = new ArrayList<>();
	// CampaignModel cm = null;
	// while (rs.next()) {
	// cm = new CampaignModel();
	// cm.setId(rs.getLong("id"));
	// cm.setName(rs.getString("name"));
	// cm.setRaiserId(rs.getInt("raiser_id"));
	// cm.setGoal(rs.getInt("goal"));
	// cm.setDate(rs.getTimestamp("date"));
	// cm.setDuration(rs.getInt("duration"));
	// cm.setCurrentFund(rs.getInt("current_fund"));
	// cm.setType(rs.getString("type"));
	// cm.setType(rs.getString("vedio_url"));
	// cm.setType(rs.getString("detail"));
	// cm.setShow(rs.getBoolean("show"));
	// cm.setLocation(rs.getString("location"));
	// lcm.add(cm);
	// }
	// return lcm;
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// if (rs != null) {
	// try {
	// rs.close();
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }
	// }
	// return null;
	// }
	//
	// public List<CampaignModel> getByRaiserName(String raiserName) {
	//
	// String sqlString =
	// "select * from campaign c1 join raiser r1 on r1.name= ?";
	// ResultSet rs = null;
	// try (Connection conn = dataSource.getConnection();
	// PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
	// pstmt.setString(1, raiserName);
	// rs = pstmt.executeQuery();
	// List<CampaignModel> lcm = new ArrayList<>();
	// CampaignModel cm = null;
	// while (rs.next()) {
	// cm = new CampaignModel();
	// cm.setId(rs.getLong("id"));
	// cm.setName(rs.getString("name"));
	// cm.setRaiserId(rs.getInt("raiser_id"));
	// cm.setGoal(rs.getInt("goal"));
	// cm.setDate(rs.getTimestamp("date"));
	// cm.setDuration(rs.getInt("duration"));
	// cm.setCurrentFund(rs.getInt("current_fund"));
	// cm.setType(rs.getString("type"));
	// cm.setType(rs.getString("vedio_url"));
	// cm.setType(rs.getString("detail"));
	// cm.setShow(rs.getBoolean("show"));
	// cm.setLocation(rs.getString("location"));
	// lcm.add(cm);
	// }
	// return lcm;
	// } catch (SQLException e) {
	// e.printStackTrace();
	// } finally {
	// if (rs != null) {
	// try {
	// rs.close();
	// } catch (SQLException e) {
	// // TODO Auto-generated catch block
	// e.printStackTrace();
	// }
	// }
	// }
	// return null;
	// }

}
