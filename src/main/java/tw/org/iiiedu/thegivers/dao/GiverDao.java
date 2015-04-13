package tw.org.iiiedu.thegivers.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverModel;

@Repository
public class GiverDao {

	@Autowired
	private DataSource datasource2;

	public GiverModel getById(Long id) {

		String sqlString = "select * from donator where id = ?";
		ResultSet rs = null;
		try (Connection conn = datasource2.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sqlString);) {

			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			GiverModel dm = null;

			if (rs.next()) {
				dm = new GiverModel();
				dm.setId(rs.getLong("id"));
				dm.setAccount(rs.getString("account"));
				dm.setPasswd(rs.getString("passwd"));
				dm.setName(rs.getString("name"));
				dm.setGender(rs.getBoolean("gender"));
				dm.setId_number(rs.getString("id_number"));
				dm.setTel(rs.getString("tel"));
				dm.setAddress(rs.getString("address"));
				dm.setEmail(rs.getString("email"));
				dm.setGet_info(rs.getBoolean("gender"));
				dm.setHeadshot(rs.getBlob("headshot"));
				dm.setBirth(rs.getTimestamp("birth"));
				dm.setProved(rs.getBoolean("gender"));
				return dm;
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

	public String getName() {
		return "Gary Lee";
	}

}
