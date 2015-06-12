package tw.org.iiiedu.thegivers.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.TransactionDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.GiverHistoryAllConditionModel;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;

@Service
public class TransactionService {

	@Autowired
	private TransactionDao dao;
	
	@Autowired
	private CampaignService cService;
	
	
	//捐款(信用卡捐款) cId為campaignId
	public TransactionDetailModel insert(TransactionDetailModel model, Integer cId){

		CampaignModel cModel = cService.getById(cId);
		
		model.setCampaignModel(cModel);
		model.setCredit(false);
		model = dao.insert(model);
		
		return model;
	}
	
	//取出所有交易紀錄筆數
	public int getCount(){
		
		int count = dao.getCount();
		return count;
	}
	
	//取出某campaignId的所有交易紀錄筆數(捐款)
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
	
	// 取出某giverId的所有藉由條件查詢的交易紀錄
	public List<TransactionDetailModel> getByIdAndCondition(GiverHistoryAllConditionModel allCondition){
		List<TransactionDetailModel> models = dao.getByIdAndCondition(allCondition);
		return models;
	}
	
	// 取出條件收尋的紀錄筆數
	public int getByConditionCount(String condition) {
		
		int conditionCount = dao.getByConditionCount(condition);
		return conditionCount;
	}
	
	//取出條件收尋的紀錄
	public List<TransactionDetailModel> getByCondition(String condition,
			int pageNum, int pageAmount){
		
		List<TransactionDetailModel> models = dao.getByCondition(condition, pageNum, pageAmount);
		return models;
	}
	
	//取出所有交易紀錄
	public List<TransactionDetailModel> getAll(){
		
		List<TransactionDetailModel> models = dao.getAll();
		return models;
	}
	
	// 頁次 pageNum為第幾頁,一頁5筆
	public List<TransactionDetailModel> getPerPage(int pageNum, int pageAmount){
		
		List<TransactionDetailModel> models = dao.getPerPage(pageNum, pageAmount);
		return models;
	}
	
	//ID查詢
	public TransactionDetailModel getById(int id){
		
		TransactionDetailModel model = dao.getById(id);
		return model;
	}
	
	//確認金額入帳  id為與transaction_detail相對應的id
	public boolean creditCheck(int id){
		
		TransactionDetailModel model = dao.getById(id);
		CampaignModel cModel = model.getCampaignModel();
		int temp = cModel.getCurrentFund();
		temp += model.getAmount();
		cModel.setCurrentFund(temp);
		
		model.setCampaignModel(cModel);
		model.setCredit(true);
		return true;
	}

	//金額未入帳
	public boolean creditUncheck(int id){
		
		TransactionDetailModel model = dao.getById(id);
		CampaignModel cModel = model.getCampaignModel();
		int temp = cModel.getCurrentFund();
		temp -= model.getAmount();
		cModel.setCurrentFund(temp);
		
		model.setCampaignModel(cModel);
		model.setCredit(false);
		return false;
	}
	
}
