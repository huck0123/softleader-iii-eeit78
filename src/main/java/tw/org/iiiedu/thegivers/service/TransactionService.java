package tw.org.iiiedu.thegivers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.TransactionDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

@Service
public class TransactionService {

	@Autowired
	private TransactionDao dao;
	
	@Autowired
	private CampaignService cService;
	
	
	//捐款(信用卡捐款)
	public TransactionDetailModel insert(TransactionDetailModel model, Integer cId){

		CampaignModel cModel = cService.getById(cId);
		int temp = cModel.getCurrentFund();
		temp = temp + model.getAmount();
		cModel.setCurrentFund(temp);
		
		model.setCampaignModel(cModel);
		model.setDate(new java.sql.Timestamp(new java.util.Date().getTime()));  //預設現在時間為捐款時間
		model.setCredit(false);
		model = dao.insert(model);
		
		return model;
	}
	
	//取出某campaignId的所有交易紀錄
	public int getCountByCampaignId(int cId){

		CampaignModel cModel = new CampaignModel();
		cModel.setId(cId);
		int count = dao.getCountByCampaignId(cModel);
		
		return count;
	}
}
