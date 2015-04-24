package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class RaiserHistoryServiceTest extends GenericTest  {

	@Autowired 
	private RaiserHistoryService raiserHistoryService;
	
	@Test
	public void testLogin(){
		assertTrue(raiserHistoryService.getByRaiser_id(1)!=null);
	}
}
