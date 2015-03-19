package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tw.org.iiiedu.thegivers.model.RaiserModel;

@Repository
public class RaiserDao {
	@Autowired
	private DataSource datasource;

	public RaiserModel getById(Long id) {
		Connection conn = null;
		try {
			conn = datasource.getConnection();

			String sqlString = "select * from raiser where id = ?";

			PreparedStatement pstmt = conn.prepareStatement(sqlString);
			pstmt.setLong(1, id);
			ResultSet rs = pstmt.executeQuery();

			RaiserModel rm = null;

			if (rs.next()) {
				rm = new RaiserModel();
				rm.setId(rs.getLong("id"));
				rm.setRaiser_id(rs.getLong("raiser_id"));
				rm.setCampaign_id(rs.getLong("campaign_id"));
				rm.setIpv4(rs.getString("ipv4"));
				rm.setIpv6(rs.getString("ipv6"));

				return rm;
			}
		} catch (SQLException e) {
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
		return null;
	}
}
