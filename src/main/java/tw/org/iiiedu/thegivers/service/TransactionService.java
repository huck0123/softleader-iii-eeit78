package tw.org.iiiedu.thegivers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.TransactionDao;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

@Service
public class TransactionService {

	@Autowired
	private TransactionDao dao;
	
	//捐款(信用卡捐款)
	public TransactionDetailModel insert(TransactionDetailModel model){
		model = dao.insert(model);
		return model;
	}
}
