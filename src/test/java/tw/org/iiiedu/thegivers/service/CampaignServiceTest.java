package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import java.sql.Timestamp;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;


public class CampaignServiceTest extends GenericTest {

	@Autowired
	private CampaignService campaignService;
	@Autowired 
	private RaiserService raiserService;
	

//	@Test
//	public void testGetAll() {
//		assertTrue(campaignService.getAll() != null);
//	}

	@Test
	public void testGetById() {
		assertTrue(campaignService.getById(1) != null);
	}

	@Test
	public void testInsert() {
		CampaignModel cm = new CampaignModel();
		cm.setCurrentFund(1000);
		cm.setStartDate(new Timestamp(System.currentTimeMillis()));
		cm.setDetail("募款");
		cm.setEndDate(new Timestamp(System.currentTimeMillis()
				+ (3600 * 24 * 30)));
		cm.setGoal(222);
		cm.setLocation("台北市大安區資策會");
		cm.setName("資策會募款");
		cm.setRaiserModel(raiserService.getByAccount("GreenPeace"));
		cm.setShow(true);
		cm.setValid(true);
		cm.setType("資訊募款");
		cm.setVedioUrl("http://docs.oracle.com/javase/8/docs/api/");
		assertTrue(campaignService.insert(cm));
	}

	@Test
	public void testUpdate() {
		CampaignModel cm = new CampaignModel();
		RaiserModel rm = raiserService.getByAccount("GreenPeace");
		String name = "xxxx";
		cm.setCurrentFund(1000);
		cm.setStartDate(new Timestamp(System.currentTimeMillis()));
		cm.setDetail("募款");
		cm.setEndDate(new Timestamp(System.currentTimeMillis()
				+ (3600 * 24 * 30)));
		cm.setGoal(222);
		cm.setLocation("台北市大安區資策會");
		cm.setName(name);
		cm.setRaiserModel(rm);
		cm.setShow(true);
		cm.setValid(true);
		cm.setType("資訊募款");
		cm.setVedioUrl("http://docs.oracle.com/javase/8/docs/api/");
		campaignService.update(cm);
		System.out.println(campaignService.getById(4));
		assertTrue(campaignService.getById(4).getName().equals(name));
	}

	 @Test 
	 public void getByAllConditionCount(){
		 CampaignForm cf = new CampaignForm();
		 assertTrue(campaignService.getByAllConditionCount(cf)>0);
	
	 }
	 
	 @Test
	 public void getByAllCondition(){
		 CampaignForm cf = new CampaignForm();
		 cf.setId(23);
		 System.out.println("hahaha"+campaignService.getByAllCondition(cf));
		 assertTrue(campaignService.getByAllCondition(cf).size()>0);
	 }
	
//
//	 @Test
//	 public void testDelete() {
//	 assertTrue(campaignService.delete(3));
//	 }
	 
	 @Test
	 public void testGetByCampaignName() {
	 assertTrue(campaignService.getByCampaignName("")!=null);
	 System.out.println(campaignService.getByCampaignName(""));
	 }
	
	// @Test
	// public void testGetByLocation() {
	// assertTrue(campaignService.getByLocation("台北市大安區資策會")!=null);
	// }
	//
	// @Test
	// public void testGetByType() {
	// assertTrue(campaignService.getByType("campaignType1")!=null);
	// System.out.println("Type  " +
	// campaignService.getByType("campaignType1"));
	// }
	//
	// @Test
	// public void testGetByRaiserName() {
	// assertTrue(campaignService.getByRaiserName("raiserName1")!=null);
	// System.out.println("raisername  "+campaignService.getByRaiserName("raiserName1"));
	// }

}
