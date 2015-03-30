package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.RaiserHistoryModel;

@Repository
public class RaiserHistoryDao {
	@Autowired
	private DataSource datasource2;

	public RaiserHistoryModel getById(Long id) {
		PreparedStatement prst = null;
		Connection conn = null;
		RaiserHistoryModel rhm = null;
		try {
			conn = datasource2.getConnection();
			String stmt = "select * from r_history where id = ?";
			prst = conn.prepareStatement(stmt);
			prst.setLong(1, id);
			ResultSet rs = prst.executeQuery();
			if (rs.next()) {
				rhm = new RaiserHistoryModel();
				rhm.setId(rs.getLong("id"));
				rhm.setRaiser_id(rs.getLong("raiser_id"));
				rhm.setCampaign_id(rs.getLong("campaign_id"));
				rhm.setIp(rs.getString("ip"));
				return rhm;

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return null;
	}
}
