package tw.org.iiiedu.thegivers.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.dao.TransactionDao;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

public class TransactionServiceTest extends GenericTest{

	@Autowired
	private TransactionDao dao;
	
	@Test
	public void test() {
		TransactionDetailModel model = new TransactionDetailModel();
		model.setGiverId(5);
		model.setCampaignId(3);
		model.setAmount(500);
		model.setCardNo("1234567891234567");
		model.setCredit(false);
		model.setIp(null);
		
		dao.insert(model);
	}

}
