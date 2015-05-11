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
//		System.out.println(giverService.login("jerry0123", "password"));
//	}
	
//	@Test 
//	public void testGetByAccount(){
//		System.out.println(giverService.getByAccount("json123").getHeadshot());
//	}

//	@Test
//	public void testGetAll(){
//		List<GiverModel> list = giverService.getAll();
//		Iterator<GiverModel> i = list.iterator();
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//	}
	
//	@Test
//	public void testGetByCondition(){
//		List<GiverModel> list = giverService.getByCondition("0912146789", 1, 30);
//		Iterator<GiverModel> i = list.iterator();
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//	}
//	
//	@Test
//	public void testGetByConditionCount(){
//		int i = giverService.getByConditionCount("0912146789");
//		System.out.println(i);
//	}
	
	@Test
	public void testGetByIdNumber(){
		System.out.println(giverService.getByIdNumber("S129547631"));
	}
	
//	@Test
//	public void testGetCount(){
//		int i = giverService.getCount();
//		int j = giverService.getCount();
//		System.out.println(i);
//		System.out.println(j);
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
//	}
	
//	@Test
//	public void testGetByAllConditionCount(){
//		int i = giverService.getByAllConditionCount(null, "冰冰", null, null, null);
//		System.out.println(i);
//	}
	
//	@Test
//	public void testGetByAllCondition(){
//		List<GiverModel> list = giverService.getByAllCondition("Tim", "P", "柯", null, null, 0, 5);
//		
//		Iterator<GiverModel> i = list.iterator();
//		
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//			
//	}
	
//	@Test
//	public void testUpdate(){
//		GiverModel model = giverService.getByAccount("kitty");
//		System.out.println(model);
//		model.setEmail("Hellokitty@gmail.com");
//		giverService.update(model);
//		model = giverService.getByAccount("kitty");
//		System.out.println(model);
//	}
	
//	@Test
//	public void testHide(){
//		giverService.hide("kitty");
//		System.out.println(giverService.getByAccount("kitty"));
//	}
	
//	@Test
//	public void testOpen(){
//		giverService.open("jerry0123");
//		System.out.println(giverService.getByAccount("jerry0123"));
//	}

}
