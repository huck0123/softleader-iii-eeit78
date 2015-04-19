package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.assertTrue;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.GiverModel;

public class GiverServiceTest extends GenericTest {

	@Autowired
	private GiverService giverService;

//	@Test
//	public void testLogin() {
//		assertTrue(giverService.login("jerry0123", "password")!=null);
//	}
//	
//	@Test
//	public void testGetAll(){
//		List<GiverModel> list = giverService.getAll();
//		
//		System.out.println(list.get(0));
//	}
	
//	@Test
//	public void testGetCount(){
//		int i = giverService.getCount();
//		System.out.println(i);
//	}
	
	@Test
	public void testGetPerPage(){
		List<GiverModel> list = giverService.getPerPage();
		
		Iterator<GiverModel> i = list.iterator();
		
		while(i.hasNext()){
			System.out.println(i.next());
		}
			
	}

}
