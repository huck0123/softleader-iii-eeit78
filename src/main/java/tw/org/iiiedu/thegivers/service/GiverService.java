package tw.org.iiiedu.thegivers.service;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.GiverDao;
import tw.org.iiiedu.thegivers.model.AdminModel;
import tw.org.iiiedu.thegivers.model.GiverModel;

@Service
public class GiverService {

	@Autowired
	private GiverDao giverDao;
	@Autowired
	SessionFactory sessionFactory;

public GiverModel login(String account, String passwd){

	Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
	if(passwd!=null && passwd.length()!=0) {
		
		GiverModel gm = giverDao.getByAccount(account);
		tx.commit();


		if(gm!=null) {	
			String pass = gm.getPasswd();	//資料庫抓出：byte[]
			if(passwd.equals(pass)) {
				return gm;
			}
		}	
	}
	return null;
}

	
	


	
}
