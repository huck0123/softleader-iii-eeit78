package tw.org.iiiedu.thegivers.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;

@Service
public class CampaignService {

	@Autowired
	private CampaignDao campaignDao;

	public boolean insert(CampaignModel cm) {

		if (campaignDao.insert(cm) == true) {
			return true;
		} else {
			return false;
		}
	}

	public boolean update(CampaignModel cm) {

		if (campaignDao.update(cm) == true) {
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(long id) {
		if (campaignDao.delete(id) == true) {
			return true;
		} else {
			return false;
		}
	}

	public List<CampaignModel> getByCampaignName(String name) {
		List<CampaignModel> list1 = new ArrayList<>();
		list1 = campaignDao.getByName(name);
		if (list1 != null) {
			return list1;
		} else {
			return null;
		}
	}

	public List<CampaignModel> getByLocation(String location) {
		List<CampaignModel> list2 = new ArrayList<>();
		list2 = campaignDao.getByLocation(location);
		if (list2 != null) {
			return list2;
		} else {
			return null;
		}
	}

	public List<CampaignModel> getByType(String type) {
		List<CampaignModel> list = new ArrayList<>();
		list = campaignDao.getByType(type);
		if (list != null) {
			return list;
		} else {
			return null;
		}
	}

	public List<CampaignModel> getByRaiserName(String raiserName) {
		List<CampaignModel> list = new ArrayList<>();
		list = campaignDao.getByRaiserName(raiserName);
		if (list != null) {
			return list;
		} else {
			return null;
		}
	}
}
