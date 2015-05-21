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
import tw.org.iiiedu.thegivers.dao.CampaignTypeDao;
import tw.org.iiiedu.thegivers.dao.CityDao;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.CampaignTypeModel;
import tw.org.iiiedu.thegivers.model.CityModel;

@Service
public class CityService {

	@Autowired
	private CityDao cityDao;
	@Autowired
	SessionFactory sessionFactory;

	public List<CityModel> getAll() {

		List<CityModel> list1 = new ArrayList<>();
		
		list1 = cityDao.getAll();


		if (list1 != null) {

			return list1;
		} else {
			return null;
		}
	}

}
