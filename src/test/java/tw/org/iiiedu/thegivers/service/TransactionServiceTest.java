package tw.org.iiiedu.thegivers.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.CampaignModel;

public class TransactionServiceTest extends GenericTest{

	@Autowired
	private TransactionService service;
	
	@Autowired
	private CampaignService cService;
	
//	@Test
//	public void testInsert() {
//		TransactionDetailModel model = new TransactionDetailModel();
//		
//		model.setGiverId(1);
//		model.setAmount(500);
//		model.setCardType("visa");
//		model.setCardNo("1234567891234567");
//		model.setCardHolder("Tony");
//		model.setCardHolderEmail("Tony@gmail.com");
//		model.setCredit(true);
//		model.setIp(null);
//
//		service.insert(model, 2);
//	}

	@Test
	public void testGetCountByCampaignId(){
		System.out.println(service.getCountByCampaignId(1));
		System.out.println(service.getCountByCampaignId(2));
		System.out.println(service.getCountByCampaignId(3));
		System.out.println(service.getCountByCampaignId(4));
	}
}
