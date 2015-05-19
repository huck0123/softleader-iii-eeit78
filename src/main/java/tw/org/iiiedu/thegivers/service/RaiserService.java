package tw.org.iiiedu.thegivers.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;

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

	public RaiserModel login(String account, String passwd) throws NoSuchAlgorithmException {

		// Transaction tx =
		// sessionFactory.getCurrentSession().beginTransaction();
		if (passwd != null && passwd.length() != 0) {

			RaiserModel rm = raiserDao.getByAccount(account);
			// tx.commit();
			if (rm != null) {
				MessageDigest md=MessageDigest.getInstance("MD5");
				byte[] pass = rm.getPasswd(); // 資料庫抓出：byte[]
				if (Arrays.equals(md.digest(passwd.getBytes()),pass)) {
					return rm;
				}
			}
		}
		return null;
	}

	public RaiserModel register(RaiserModel rm) {
		rm = raiserDao.insertAccount(rm);
		if (rm != null) {
			return rm;
		}
		return null;
	}

	public RaiserModel dataUpdate(RaiserModel rm) {
		rm = raiserDao.update(rm);
		if (rm != null) {
			return rm;
		}
		return null;
	}

	public RaiserModel getByAccount(String account) {
		RaiserModel rm = raiserDao.getByAccount(account);
		if (rm != null) {
			return rm;
		}
		return null;
	}

	public RaiserModel getByName(String name) {
		RaiserModel rm = raiserDao.getByName(name);
		if (rm != null) {
			return rm;
		}
		return null;
	}
	
	public List<RaiserModel> getAll() {
		List<RaiserModel> result = raiserDao.getAll();
		return result;
	}

	public int getCount() {
		int count = raiserDao.getCount();

		return count;
	}

	public Integer getByAllConditionCount(String account, String name,
			String contactPerson, boolean valid) {
		Integer count = raiserDao.getByAllConditionCount(account, name,
				contactPerson, valid);
		return count;
	}

	public List<RaiserModel> getByAllCondition(String account, String name,
			String contactPerson, boolean valid, Integer pageNum,
			Integer pageSize) {
		List<RaiserModel> result = raiserDao.getByAllCondition(account, name,
				contactPerson, valid, pageNum, pageSize);
		return result;
	}

	public List<RaiserModel> getPerPage(int page) {
		List<RaiserModel> result = raiserDao.getPerPage(page);
		return result;
	}

	public boolean valid(String account, boolean valid) {
		boolean result = raiserDao.check(account, valid);
		return result;
	}
}
