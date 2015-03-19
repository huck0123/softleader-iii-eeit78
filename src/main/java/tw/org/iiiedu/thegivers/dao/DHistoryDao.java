package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.DHistoryModel;

@Repository
public class DHistoryDao {
	
	@Autowired
	private DataSource datasource2;
	
	public DHistoryModel getById(Long id){
		DHistoryModel dhm = null;
		
		Connection conn = null;
		
		try{
			conn = datasource2.getConnection();
			String sqlStmt = "select * from d_history where id = ?";
			PreparedStatement pstmt = conn.prepareStatement(sqlStmt);
			pstmt.setLong(1, id);
			
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				dhm = new DHistoryModel();
				dhm.setId(rs.getLong("id"));
				dhm.setCampaignId(rs.getLong("campaign_id"));
				dhm.setDonation(rs.getLong("donation"));
				dhm.setDonatorId(rs.getLong("donator_id"));
				dhm.setAnonymous(rs.getInt("anonymous"));
				dhm.setIp(rs.getString("ip"));
			}
			
		}catch(SQLException e){
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return dhm;
	}
}
