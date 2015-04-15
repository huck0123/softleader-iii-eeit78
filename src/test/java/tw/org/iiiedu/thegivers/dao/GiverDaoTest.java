package tw.org.iiiedu.thegivers.dao;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.GiverModel;

public class GiverDaoTest extends GenericTest{

	@Autowired
	GiverDao dao;
	
	@Test
	public void testGetByAccount() {
		GiverModel bean = dao.getByAccount("goodman9527");
		System.out.println(bean);
		
	}
	
	@Test
	public void testInsert(){
		GiverModel bean = new GiverModel();
//		bean.setAccount(account);
//		bean.setAddress(address);
//		bean.setBirth(birth);
//		bean.setEmail(email);
//		bean.setFamilyName(familyName);
//		bean.setGender(gender);
//		bean.setGetInfo(getInfo);
//		bean.setHeadshot(headshot);
//		bean.setId(id);
//		bean.setIdNumber(idNumber);
//		bean.setName(name);
//		bean.setPasswd(passwd);
//		bean.setTel(tel);
//		bean.setValid(valid);
		
		
		dao.insert(bean);
	}

}
