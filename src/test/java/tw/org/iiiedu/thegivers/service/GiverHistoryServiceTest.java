package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class GiverHistoryServiceTest extends GenericTest  {

	@Autowired 
	private GiverHistoryService giverHistoryService;
	
	@Test
	public void testLogin(){
		assertTrue(giverHistoryService.getByGiver_id(1)!=null);
	}
}
