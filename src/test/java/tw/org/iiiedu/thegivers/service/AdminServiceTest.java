package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class AdminServiceTest extends GenericTest  {

	@Autowired 
	private AdminService adminService;
	
	@Test
	public void testLogin(){
		assertTrue(adminService.login("admin", "password")!=null);
	}

}
