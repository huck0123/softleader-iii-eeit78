package tw.org.iiiedu.thegivers.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.dao.TransactionDao;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

public class TransactionServiceTest extends GenericTest{

	@Autowired
	private TransactionService service;
	
	@Test
	public void test() {
		TransactionDetailModel model = new TransactionDetailModel();
		model.setGiverId(1);
		model.setCampaignId(2);
		model.setAmount(500);
		model.setCardType("visa");
		model.setCardNo("1234567891234567");
		model.setCardHolder("Tony");
		model.setCardHolderEmail("Tony@gmail.com");
		model.setCredit(true);
		model.setIp(null);
		
		service.insert(model);
	}

}
