package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class CampaignTypeServiceTest extends GenericTest {

	@Autowired
	CampaignTypeService campaignTypeService;
	
	@Test
	public void testGetAll() {

System.out.println(campaignTypeService.getAll());
	}

}
