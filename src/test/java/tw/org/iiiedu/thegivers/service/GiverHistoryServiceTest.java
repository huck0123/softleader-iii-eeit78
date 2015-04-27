package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;

public class GiverHistoryServiceTest extends GenericTest  {

	@Autowired 
	private GiverHistoryService giverHistoryService;
	
	@Test
	public void testLoadAll(){
		GiverHistoryAllConditionModel g = new GiverHistoryAllConditionModel();
		g.setGiver_id(1);
		assertTrue(giverHistoryService.loadAll(g)!=null);
	}
}
