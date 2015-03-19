package tw.org.iiiedu.thegivers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.DonatorDao;

@Service
public class DonatorService {

	@Autowired
	private DonatorDao donatorDao;

	public String getName() {
		return donatorDao.getName();
	}


	
}
