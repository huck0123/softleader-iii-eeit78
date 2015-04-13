package tw.org.iiiedu.thegivers.service;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.GiverDao;
import tw.org.iiiedu.thegivers.dao.RaiserDao;
import tw.org.iiiedu.thegivers.model.GiverModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;

@Service
public class RaiserService {

	@Autowired
	private RaiserDao raiserDao;
	@Autowired
	SessionFactory sessionFactory;

	public RaiserModel login(String account, String passwd) {

		Transaction tx = sessionFactory.getCurrentSession().beginTransaction();
		if (passwd != null && passwd.length() != 0) {

			RaiserModel rm = raiserDao.getByAccount(account);
			tx.commit();

			if (rm != null) {
				String pass = rm.getPasswd(); // 資料庫抓出：byte[]
				if (passwd.equals(pass)) {
					return rm;
				}
			}
		}
		return null;
	}
}
