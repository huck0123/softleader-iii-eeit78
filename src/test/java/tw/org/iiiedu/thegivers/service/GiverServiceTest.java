package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class GiverServiceTest extends GenericTest {

	@Autowired
	private GiverService giverService;

	@Test
	public void testLogin() {
		assertTrue(giverService.login("jerry0123", "password")!=null);
	}

}
