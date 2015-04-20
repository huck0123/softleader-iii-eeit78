package tw.org.iiiedu.thegivers.service;

import static org.junit.Assert.*;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.dao.RaiserDao;
import tw.org.iiiedu.thegivers.model.RaiserModel;

public class RaiserServiceTest extends GenericTest {

	@Autowired
	private RaiserService raiserService;
	
	@Test
	public void testLogin() {
		assertTrue(raiserService.login("greenpeace", "password")!=null);
	}
	
	@Test
	public void testGetByAccount(){
		RaiserModel rm = raiserService.getByAccount("greenpeace");
		
		System.out.println(rm);
	}
	
//	@Test
//	public void testRegister(){
//		RaiserModel rm = new RaiserModel();
//		rm.setId(88);
//		rm.setAccount("chigi");
//		rm.setName("chigikonderwhei");
//		rm.setAddress("");
//		rm.setContactPerson("BILL");
//		rm.setContactTel("0933000111");
//		rm.setDetail("money");
//		rm.setEmail("chigi@gmail.com");
//		rm.setPasswd("password");
//		rm.setTel("28825252");
//		rm.setVideoUrl("www.www");
//		rm = raiserService.register(rm);
//		System.out.println(rm);
//	}

	@Test
	public void testDataUpdate(){
		RaiserModel rm = raiserService.getByAccount("chigi");
		rm.setContactPerson("JianYian");
		rm = raiserService.dataUpdate(rm);
		System.out.println(rm);
	}
	@Test
	public void testGetAll(){
		List<RaiserModel> list = raiserService.getAll();
		
		System.out.println(list.get(0));
	}
	
	@Test
	public void testGetCount(){
		int i = raiserService.getCount();
		System.out.println(i);
	}
	
	@Test
	public void testGetPerPage(){
		List<RaiserModel> list = raiserService.getPerPage();
		
		Iterator<RaiserModel> i = list.iterator();
		
		while(i.hasNext()){
			System.out.println(i.next());
		}
			
	}
}
