package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;

@Repository
public class CampaignDao {

	@Autowired
	private DataSource dataSource;

	public CampaignModel getById(Long id) {

		String sqlString = "select * from campaign where id = ?";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {

			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			CampaignModel cm = null;

			if (rs.next()) {
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				return cm;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public List<CampaignModel> getAll() {

		String sqlString = "select * from campaign";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {

			rs = pstmt.executeQuery();
			List<CampaignModel> lcm = new ArrayList<>();
			CampaignModel cm = null;
			while (rs.next()) {			
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				lcm.add(cm);
			}
			return lcm;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}

	public boolean insert(CampaignModel cm) {
		String sqlStmt = "insert into campaign(name, raiser_id, goal, date, duration,"
				+ " current_fund, type, vedio_url, detail, show, location)"
				+ " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlStmt);) {
			pstmt.setString(1, cm.getName());
			pstmt.setInt(2, cm.getRaiserId());
			pstmt.setInt(3, cm.getGoal());
			pstmt.setTimestamp(4, cm.getDate());
			pstmt.setInt(5, cm.getDuration());
			pstmt.setInt(6, cm.getCurrentFund());
			pstmt.setString(7, cm.getType());
			pstmt.setString(8, cm.getVedioUrl());
			pstmt.setString(9, cm.getDetail());
			pstmt.setBoolean(10, cm.isShow());
			pstmt.setString(11, cm.getLocation());
			if(pstmt.executeUpdate()==1){
				return true;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return false;
	}

	public boolean update(CampaignModel cm) {
		String UPDATE = "update campaign set name = ?,raiser_id = ?,goal = ?,"
				+ "date = ?,duration = ?,current_fund = ?,type = ?,vedio_url = ?,"
				+ "detail =?,show = ?,location = ? where id = ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(UPDATE);
			pstmt.setString(1, cm.getName());
			pstmt.setInt(2, cm.getRaiserId());
			pstmt.setInt(3, cm.getGoal());
			pstmt.setTimestamp(4, cm.getDate());
			pstmt.setInt(5, cm.getDuration());
			pstmt.setInt(6, cm.getCurrentFund());
			pstmt.setString(7, cm.getType());
			pstmt.setString(8, cm.getVedioUrl());
			pstmt.setString(9, cm.getDetail());
			pstmt.setBoolean(10, cm.isShow());
			pstmt.setString(11, cm.getLocation());
			pstmt.setLong(12, cm.getId());
			int num = pstmt.executeUpdate();
			if (num != 0) {
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return false;
	}

	public boolean delete(long id) {
		String sqlString = "delete from campaign where id = ?";

		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
			pstmt.setLong(1, id);
			pstmt.executeUpdate();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}
	
	public List<CampaignModel> getByLocation(String location) {

		String sqlString = "select * from campaign where location = ?";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
			pstmt.setString(1, location);
			rs = pstmt.executeQuery();
			List<CampaignModel> lcm = new ArrayList<>();
			CampaignModel cm = null;
			while (rs.next()) {			
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				lcm.add(cm);
			}
			return lcm;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public List<CampaignModel> getByName(String name) {

		String sqlString = "select * from campaign where name like ?";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
			pstmt.setString(1, "%"+name+"%");
			rs = pstmt.executeQuery();
			List<CampaignModel> lcm = new ArrayList<>();
			CampaignModel cm = null;
			while (rs.next()) {			
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				lcm.add(cm);
			}
			return lcm;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public List<CampaignModel> getByType(String type) {

		String sqlString = "select * from campaign where type = ?";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
			pstmt.setString(1, type);
			rs = pstmt.executeQuery();
			List<CampaignModel> lcm = new ArrayList<>();
			CampaignModel cm = null;
			while (rs.next()) {			
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				lcm.add(cm);
			}
			return lcm;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
	public List<CampaignModel> getByRaiserName(String raiserName) {

		String sqlString = "select * from campaign c1 join raiser r1 on r1.name= ?";
		ResultSet rs = null;
		try (Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {
			pstmt.setString(1, raiserName);
			rs = pstmt.executeQuery();
			List<CampaignModel> lcm = new ArrayList<>();
			CampaignModel cm = null;
			while (rs.next()) {			
				cm = new CampaignModel();
				cm.setId(rs.getLong("id"));
				cm.setName(rs.getString("name"));
				cm.setRaiserId(rs.getInt("raiser_id"));
				cm.setGoal(rs.getInt("goal"));
				cm.setDate(rs.getTimestamp("date"));
				cm.setDuration(rs.getInt("duration"));
				cm.setCurrentFund(rs.getInt("current_fund"));
				cm.setType(rs.getString("type"));
				cm.setType(rs.getString("vedio_url"));
				cm.setType(rs.getString("detail"));
				cm.setShow(rs.getBoolean("show"));
				cm.setLocation(rs.getString("location"));
				lcm.add(cm);
			}
			return lcm;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return null;
	}
	
}
