package tw.org.iiiedu.thegivers.dao;

import java.sql.Timestamp;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.GenericTest;
import tw.org.iiiedu.thegivers.model.GiverModel;

public class GiverDaoTest extends GenericTest{

	@Autowired
	GiverDao dao;
	
	@Test
	public void testGetByAccount() {
		Session session = dao.getSession();
		
		GiverModel bean = dao.getByAccount("jerry0123");
		System.out.println(bean);
	}
	
//	@Test
//	public void testInsert(){
//		Session session = dao.getSession();
//		Transaction tx = session.beginTransaction();
//		
//		GiverModel bean = new GiverModel();
//		bean.setAccount("Jsona");
//		bean.setAddress("台北市大安區");
//		bean.setBirth(new Timestamp((new java.util.Date()).getTime()));
//		bean.setEmail("Json@gmail.com");
//		bean.setFamilyName("王");
//		bean.setGender(true);
//		bean.setGetInfo(true);
//		bean.setHeadshot(null);
//		bean.setIdNumber("A123456788");
//		bean.setName("德馬");
//		bean.setPasswd("sa123456");
//		bean.setTel("0931468725");
//		bean.setValid(true);
//		
//		dao.insert(bean);
//		System.out.println(bean);
//		tx.commit();
//	}

//	@Test
//	public void testUpdate(){
//		Session session = dao.getSession();
//		Transaction tx = session.beginTransaction();
//		
//		GiverModel bean = new GiverModel();
//		bean.setAccount("Jsona");
//		bean.setAddress("台北市大安區");
//		bean.setBirth(new Timestamp((new java.util.Date()).getTime()));
//		bean.setEmail("Jsona@gmail.com");
//		bean.setFamilyName("張");
//		bean.setGender(true);
//		bean.setGetInfo(true);
//		bean.setHeadshot(null);
//		bean.setIdNumber("A123456788");
//		bean.setName("君亞");
//		bean.setPasswd("sa123456");
//		bean.setTel("0931468725");
//		bean.setValid(true);
//		
//		bean = dao.update(bean);
//		System.out.println("test  "+bean);
//		tx.commit();
//	}
	
//	@Test 
//	public void testGetById(){
//		Session session = dao.getSession();
//		Transaction tx = session.beginTransaction();
//		
//		GiverModel bean = dao.getById(3);
//		System.out.println(bean);
//		tx.commit();
//	}
	
//	@Test
//	public void testHide(){
//		Session session = dao.getSession();
//		Transaction tx = session.beginTransaction();
//		
//		dao.hide("Json");
//		tx.commit();
//	}
	
//	@Test
//	public void testGetAll(){
//		Session session = dao.getSession();
//		Transaction tx = session.beginTransaction();
//		
//		List<GiverModel> list = dao.getAll();
//		Iterator iterator = list.iterator();
//		while(iterator.hasNext()){
//			System.out.println(iterator.next());
//		}
//		tx.commit();
//	}
	
	
	
}
