package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class CityServiceTest extends GenericTest {

	@Autowired
	CityService cityService;
	
	@Test
	public void testGetAll() {
		System.out.println(cityService.getAll());
	}

}
