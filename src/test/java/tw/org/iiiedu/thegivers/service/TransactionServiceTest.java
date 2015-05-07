package tw.org.iiiedu.thegivers.service;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

public class TransactionServiceTest extends GenericTest{

	@Autowired
	private TransactionService service;
	
	
//	@Test
//	public void testInsert() {
//		TransactionDetailModel model = new TransactionDetailModel();
//		
//		model.setGiverId(1);
//		model.setAmount(8);
//		model.setCardType("visa");
//		model.setCardNo("1234567891234567");
//		model.setCardHolder("Tony");
//		model.setCardHolderEmail("Tony@gmail.com");
//		model.setCredit(true);
//		model.setIp(null);
//
//		service.insert(model, 1);
//	}
	
//	@Test
//	public void testGetCount(){
//		System.out.println(service.getCount());
//	}

//	@Test
//	public void testGetCountByCampaignId(){
//		System.out.println(service.getCountByCampaignId(1));
//		System.out.println(service.getCountByCampaignId(2));
//		System.out.println(service.getCountByCampaignId(3));
//		System.out.println(service.getCountByCampaignId(4));
//	}
	
//	@Test
//	public void testGetAll(){
//		Iterator<TransactionDetailModel> i = service.getAll().iterator();
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//	}
	
//	@Test
//	public void testGetByGiverId(){
//		service.getByGiverId(3);
//		
//		Iterator<TransactionDetailModel> i = service.getByGiverId(1).iterator();
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//		Iterator<TransactionDetailModel> i2 = service.getByGiverId(2).iterator();
//		while(i2.hasNext()){
//			System.out.println(i2.next());
//		}
//		Iterator<TransactionDetailModel> i3 = service.getByGiverId(3).iterator();
//		while(i3.hasNext()){
//			System.out.println(i3.next());
//		}
//		
//	}
	
//	@Test
//	public void testGetById(){
//		System.out.println(service.getById(1));
//		System.out.println(service.getById(2));
//		System.out.println(service.getById(3));
//		System.out.println(service.getById(4));
//	}
	
//	@Test
//	public void testCreditCheck(){
//		service.creditCheck(1);
//		service.creditCheck(2);
//		service.creditCheck(3);
//	}
	
//	@Test
//	public void testCreditUncheck(){
//		service.creditUncheck(1);
//		service.creditUncheck(2);
//		service.creditUncheck(3);
//	}
	
//	@Test
//	public void testGetPerPage(){
//		List<TransactionDetailModel> list = service.getPerPage(6);
//		Iterator<TransactionDetailModel> i = list.iterator();
//		while(i.hasNext()){
//			System.out.println(i.next());
//		}
//	}
	
}
