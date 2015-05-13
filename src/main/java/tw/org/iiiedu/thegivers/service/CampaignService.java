package tw.org.iiiedu.thegivers.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;

@Service
public class CampaignService {

	@Autowired
	private CampaignDao campaignDao;
	@Autowired
	SessionFactory sessionFactory;

	public List<CampaignModel> getAll(Integer pageNum,Integer pageSize) {
//		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		List<CampaignModel> list1 = new ArrayList<>();
		
		list1 = campaignDao.getAll(pageNum,pageSize);

//		tx.commit();
		if (list1 != null) {

			return list1;
		} else {
			return null;
		}
	}
	
	public CampaignModel getById(int id) {
//		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		CampaignModel cm = campaignDao.getById(id);
//		tx.commit();
		if (cm != null) {
			return cm;
		} else {
			return null;
		}
	}
	
	public boolean insert(CampaignModel cm) {
//		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		boolean b = campaignDao.insert(cm);
//		tx.commit();
		if (b) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(CampaignModel cm) {

		boolean b = campaignDao.update(cm); 
		if (b) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(int id) {
//		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		boolean b = campaignDao.delete(id);
//		tx.commit();
		if (b) {
			return true;
		} else {
			return false;
		}
	}

	public List<CampaignModel> getByCampaignName(String name) {
//		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		List<CampaignModel> list1 = new ArrayList<>();
		list1 = campaignDao.getByName(name);
//		tx.commit();
		if (list1 != null) {
			return list1;
		} else {
			return null;
		}
	}

	public List<CampaignModel> getByAllCondition(CampaignForm campaignForm){
		
		return campaignDao.getByAllCondition(campaignForm);
	}
	
	public Integer getCount(){
		return campaignDao.getCount();
	}
	
	public Long getByAllConditionCount(CampaignForm campaignForm) {
		
		return campaignDao.getByAllConditionCount(campaignForm);
	}
//	public List<CampaignModel> getByLocation(String location) {
//		List<CampaignModel> list2 = new ArrayList<>();
//		list2 = campaignDao.getByLocation(location);
//		if (list2 != null) {
//			return list2;
//		} else {
//			return null;
//		}
//	}
//
//	public List<CampaignModel> getByType(String type) {
//		List<CampaignModel> list = new ArrayList<>();
//		list = campaignDao.getByType(type);
//		if (list != null) {
//			return list;
//		} else {
//			return null;
//		}
//	}
//
//	public List<CampaignModel> getByRaiserName(String raiserName) {
//		List<CampaignModel> list = new ArrayList<>();
//		list = campaignDao.getByRaiserName(raiserName);
//		if (list != null) {
//			return list;
//		} else {
//			return null;
//		}
//	}
}
