package tw.org.iiiedu.thegivers.service;

import java.util.List;

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
//		model.setDate(new java.sql.Timestamp(new java.util.Date().getTime()));  //預設現在時間為捐款時間
		model.setCredit(false);
		model = dao.insert(model);
		
		return model;
	}
	
	//取出所有交易紀錄筆數
	public int getCount(){
		
		int count = dao.getCount();
		return count;
	}
	
	//取出某campaignId的所有交易紀錄筆數
	public int getCountByCampaignId(int cId){

		CampaignModel cModel = new CampaignModel();
		cModel.setId(cId);
		int count = dao.getCountByCampaignId(cModel);
		
		return count;
	}
	
	// 取出某giverId的所有交易紀錄
	public List<TransactionDetailModel> getByGiverId(int gId){
		
		List<TransactionDetailModel> models = dao.getByGiverId(gId);
		return models;
	}
	
	//取出所有交易紀錄
	public List<TransactionDetailModel> getAll(){
		
		List<TransactionDetailModel> models = dao.getAll();
		return models;
	}
	
	// 頁次 pageNum為第幾頁,一頁5筆
	public List<TransactionDetailModel> getPerPage(int pageNum){
		
		List<TransactionDetailModel> models = dao.getPerPage(pageNum);
		return models;
	}
	
	//ID查詢
	public TransactionDetailModel getById(int id){
		
		TransactionDetailModel model = dao.getById(id);
		return model;
	}
	
	//確認金額入帳
	public boolean creditCheck(int id){
		
		TransactionDetailModel model = dao.getById(id);
		model.setCredit(true);
		return true;
	}

	//金額未入帳
	public boolean creditUncheck(int id){
		
		TransactionDetailModel model = dao.getById(id);
		model.setCredit(false);
		return false;
	}
	
}
