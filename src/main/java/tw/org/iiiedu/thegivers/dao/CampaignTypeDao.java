package tw.org.iiiedu.thegivers.dao;


import java.util.*;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Disjunction;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.CampaignTypeModel;


@Repository
public class CampaignTypeDao {

	@Autowired
	SessionFactory sessionFactory;

	public List<CampaignTypeModel> getAll() {

		Session session = sessionFactory.getCurrentSession();

		try {
			List campaignTypeModels = session.createCriteria(CampaignTypeModel.class)
					.list();

			if (campaignTypeModels.size() > 0) {

				return campaignTypeModels;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	
}
