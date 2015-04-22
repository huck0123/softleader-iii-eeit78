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

	@Test
	public void testLogin() {
		System.out.println(giverService.login("jerry0123", "password"));
	}
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
	
//	@Test
//	public void testGetPerPage(){
//		List<GiverModel> list = giverService.getPerPage(2);
//		
//		Iterator<GiverModel> i = list.iterator();
//		
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//			
//	}
	
	@Test
	public void testGetByAllCondition(){
		List<GiverModel> list = giverService.getByAllCondition("Tim", "P", "柯", null, null, 0, 5);
		
		Iterator<GiverModel> i = list.iterator();
		
		while(i.hasNext()){
			System.out.println(i.next());
		}
			
	}

}
