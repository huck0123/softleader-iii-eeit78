package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.dao.RaiserDao;

public class RaiserServiceTest extends GenericTest {

	@Autowired
	private RaiserService raiserService;
	
	@Test
	public void testLogin() {
		assertTrue(raiserService.login("greenpeace", "password")!=null);
	}

}
