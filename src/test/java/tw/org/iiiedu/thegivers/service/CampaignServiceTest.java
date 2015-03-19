package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import java.sql.Timestamp;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.CampaignModel;

public class CampaignServiceTest extends GenericTest{

	@Autowired
	private CampaignService campaignService;
	
	@Test
	public void testInsert() {
		CampaignModel cm = new CampaignModel();
		cm.setCurrentFund(1000);
		cm.setDate(new Timestamp(System.currentTimeMillis()));
		cm.setDetail("募款");
		cm.setDuration(10);
		cm.setGoal(222);
		cm.setLocation("台北市大安區資策會");
		cm.setName("資策會募款");
		cm.setRaiserId(123);
		cm.setShow(true);
		cm.setType("資訊募款");
		cm.setVedioUrl("http://docs.oracle.com/javase/8/docs/api/");
		assertTrue(campaignService.insert(cm));
	}

	@Test
	public void testUpdate() {
		CampaignModel cm1 =new CampaignModel();
		cm1.setId(5);
		cm1.setName("中文中文");
		cm1.setRaiserId(123);
		cm1.setGoal(100000000);
		cm1.setDate(new Timestamp(System.currentTimeMillis()));
		cm1.setDuration(10);
		cm1.setCurrentFund(123);
		cm1.setShow(true);
		assertTrue(campaignService.update(cm1));
	}
	
	@Test
	public void testDelete() {
		assertTrue(campaignService.delete(1));
	}
	@Test
	public void testGetByCampaignName() {
		assertTrue(campaignService.getByCampaignName("cam")!=null);
	}

	@Test
	public void testGetByLocation() {
		assertTrue(campaignService.getByLocation("台北市大安區資策會")!=null);
	}

	@Test
	public void testGetByType() {
		assertTrue(campaignService.getByType("campaignType1")!=null);
		System.out.println("Type  " + campaignService.getByType("campaignType1"));
	}
	
	@Test
	public void testGetByRaiserName() {
		assertTrue(campaignService.getByRaiserName("raiserName1")!=null);
		System.out.println("raisername  "+campaignService.getByRaiserName("raiserName1"));
	}

}
