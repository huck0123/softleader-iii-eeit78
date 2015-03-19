package tw.org.iiiedu.thegivers.dao;

//import static org.junit.Assert.fail;
import static org.junit.Assert.assertTrue;

import java.sql.Timestamp;

//import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.CampaignModel;

public class CampaignDaoTest extends GenericTest {
	
	@Autowired
	private CampaignDao campaignDao;
	
	@Test
	public void testGetById() {
		assertTrue(campaignDao.getById(2L)!=null);
	}

	@Test
	public void testGetAll() {
		assertTrue(campaignDao.getAll()!=null);
	}

	@Test
	public void testInsert() {
		CampaignModel cm = new CampaignModel();
		cm.setCurrentFund(123);
		cm.setDate(new Timestamp(5555));
		cm.setDetail("asdf");
		cm.setDuration(10);
		cm.setGoal(222);
		cm.setLocation("asdf");
		cm.setName("asdf");
		cm.setRaiserId(123);
		cm.setShow(true);
		cm.setType("asdfasdf");
		cm.setVedioUrl("asdfsaf");
		assertTrue(campaignDao.insert(cm)==true);
	}

	@Test
	public void testUpdate() {
		CampaignModel cm1 =new CampaignModel();
		cm1.setId(3);
		cm1.setName("change");
		cm1.setRaiserId(123);
		cm1.setGoal(100000000);
		cm1.setDate(new Timestamp(5555));
		cm1.setDuration(10);
		cm1.setCurrentFund(123);
		cm1.setShow(true);
		assertTrue(campaignDao.update(cm1));
	}

	@Test
	public void testDelete() {
		campaignDao.delete(1L);
		assertTrue(campaignDao.getById(1L)==null);
	}

}
