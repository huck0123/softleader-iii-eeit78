package tw.org.iiiedu.thegivers.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.RaiserHistoryDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserHistoryModel;

@Service
public class RaiserHistoryService {

	@Autowired
	private RaiserHistoryDao raiserHistoryDao;
	@Autowired
	SessionFactory sessionFactory;
	
	public List<RaiserHistoryModel> getByRaiser_id(Integer raiser_id){
		List<RaiserHistoryModel> raiserHistoryModel= raiserHistoryDao.getByRaiser_id(raiser_id);
		
		if(raiserHistoryModel.size()>0){
			return raiserHistoryModel;
		}else{
			return null;
		}
	}
}
