package tw.org.iiiedu.thegivers.service;

import java.util.Arrays;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.AdminDao;
import tw.org.iiiedu.thegivers.model.AdminModel;

@Service
public class AdminService {
	
	@Autowired
	AdminDao adminDao;
	@Autowired
	SessionFactory sessionFactory;

	public AdminModel login(String account, String passwd){

		
		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		if(passwd!=null && passwd.length()!=0) {
			AdminModel am = adminDao.getByAccount(account);
			tx.commit();
			

			if(am!=null) {	
				String pass = am.getPasswd();	//資料庫抓出：byte[]
				if(passwd.equals(pass)) {
					return am;
				}
			}	
		}
		return null;
	}
	
}
