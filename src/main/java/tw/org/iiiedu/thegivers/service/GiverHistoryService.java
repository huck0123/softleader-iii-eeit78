package tw.org.iiiedu.thegivers.service;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.GiverHistoryDao;
import tw.org.iiiedu.thegivers.model.GiverHistoryModel;

@Service
public class GiverHistoryService {

	@Autowired
	private GiverHistoryDao giverHistoryDao;
	@Autowired
	SessionFactory sessionFactory;
	
	public List<GiverHistoryModel> getByGiver_id(Integer giver_id){
		List<GiverHistoryModel> giverHistoryModel = giverHistoryDao.getByGiver_id(giver_id);
		
		if(giverHistoryModel.size()>0){
			return giverHistoryModel;
		}else{
			return null;
		}
	}
}
