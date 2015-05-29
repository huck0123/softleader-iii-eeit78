package tw.org.iiiedu.thegivers.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;

public class GiverServiceTest extends GenericTest {

	@Autowired
	private GiverService giverService;

	@Test
	public void testGetMaleAgeIntervalCount() throws ParseException{
		DateFormat df = new SimpleDateFormat("MM-dd-yyyy");
		Calendar rightNow = Calendar.getInstance();
		int year = rightNow.get(Calendar.YEAR);
		int month = rightNow.get(Calendar.MONTH)+1;
		int date = rightNow.get(Calendar.DATE);
		System.out.println(year);
		
		int a = giverService.getMaleAgeIntervalCount(
//				new Timestamp(df.parse("05-21-2015").getTime()));
				new Timestamp(df.parse(month + "-" + date + "-" + (year-30)).getTime()),
				new Timestamp(df.parse(month + "-" + date + "-" + (year-20)).getTime()));
		System.out.println(a);
	}
	
//	@Test
//	public void testGetById(){
//		System.out.println(giverService.getById(1));
//	}
	
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
	
//	@Test
//	public void testGetByIdNumber(){
//		System.out.println(giverService.getByIdNumber("S129547631"));
//	}
	
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
//	public void testUpdate() throws NoSuchAlgorithmException{
//		GiverModel model = giverService.getByAccount("jerry0123");
//		byte[] b = MessageDigest.getInstance("MD5").digest("password".getBytes());
//		model.setPasswd(b);
//		giverService.update(model);
//		b = model.getPasswd();
//		int i;
//		for(i=0; i<b.length; i++){
//			System.out.print("xxx"+b[i]);
//		}
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
