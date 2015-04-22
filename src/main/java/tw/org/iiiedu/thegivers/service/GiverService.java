package tw.org.iiiedu.thegivers.service;

import java.util.List;

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

	//登入
	public GiverModel login(String account, String passwd) {

		if (passwd != null && passwd.length() != 0) {

			GiverModel gm = giverDao.getByAccount(account);

			if (gm != null) {
				String pass = gm.getPasswd(); // 資料庫抓出：byte[]
				if (passwd.equals(pass)) {
					return gm;
				}
			}
		}
		return null;
	}
	
	//註冊帳號
	public GiverModel register(GiverModel model){
		model = giverDao.insert(model);
		return model;
	}
	
	//帳號收尋
	public GiverModel getByAccount(String account){
		GiverModel model = giverDao.getByAccount(account);
		return model;
	}
	
	//select All
	public List<GiverModel> getAll(){
		
		List<GiverModel> result = giverDao.getAll();
		
		return result;
	}
	
	//總筆數
	public int getCount(){
		int count = giverDao.getCount();
		
		return count;
	}
	
	//頁次
	public List<GiverModel> getPerPage(int pageNum){
		List<GiverModel> result = giverDao.getPerPage(pageNum);
		return result;
	}
	
	//條件收尋
	public List<GiverModel> getByAllCondition(String account, String name, String familyName
			, String tel, String email, Integer pageNum, Integer pageSize){
		List<GiverModel> models = giverDao.getByAllCondition(account, name, familyName,  tel, email, pageNum, pageSize);
		return models;
	}

}
