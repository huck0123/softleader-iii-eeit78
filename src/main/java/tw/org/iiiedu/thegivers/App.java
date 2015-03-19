package tw.org.iiiedu.thegivers;

import java.sql.Timestamp;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.model.CampaignModel;

public class App {

	public static void main(String[] args) {

		ApplicationContext appContext = new ClassPathXmlApplicationContext(
				new String[] { "spring-service.xml", "spring-dao.xml",
						"spring-database.xml" });

		// DonatorDao donatorDao = (DonatorDao)
		// appContext.getBean("donatorDao");
		//
		// System.out.println(donatorDao.getName());

		// DonatorService donatorService
		// = (DonatorService) appContext.getBean("donatorService");
		// System.out.println(donatorService.getName());

		CampaignDao cdao = (CampaignDao) appContext.getBean("campaignDao");
		System.out.println(cdao.getById(1L));
		System.out.println(cdao.getById(2L));
		System.out.println(cdao.getById(3L));

		System.out.println(cdao.getAll());
		
		System.out.println(cdao.delete(1));
		
		CampaignModel cm = new CampaignModel();
		cm.setCurrentFund(123);
		cm.setDate(new Timestamp(5555));
		cm.setDetail("asdf");
		cm.setDuration(10);
		cm.setGoal(222);
		cm.setLocation("asdf");
		cm.setName("asdf");
		cm.setRaiserId(123);
		cm.setShow(true);
		cm.setType("asdfasdf");
		cm.setVedioUrl("asdfsaf");
		System.out.println(cdao.insert(cm));
		
		CampaignModel cm1 =new CampaignModel();
		cm1.setId(3);
		cm1.setName("change");
		cm1.setRaiserId(123);
		cm1.setGoal(100000000);
		cm1.setDate(new Timestamp(5555));
		cm1.setDuration(10);
		cm1.setCurrentFund(123);
		cm1.setShow(true);
		System.out.println(cdao.update(cm1));
		
//		DonatorDao donatorDao = (DonatorDao) appContext.getBean("donatorDao");
//		System.out.println(donatorDao.getById(1L));
//		System.out.println(donatorDao.getById(2L));
//		System.out.println(donatorDao.getById(3L));
//
//		RHistoryDao rHistoryDao = (RHistoryDao) appContext
//				.getBean("RHistoryDao");
//		System.out.println(rHistoryDao.getById(1L));
//		System.out.println(rHistoryDao.getById(2L));
//		System.out.println(rHistoryDao.getById(3L));
//
//		DHistoryDao dhistoryDao = (DHistoryDao) appContext
//				.getBean("DHistoryDao");
//		System.out.println(dhistoryDao.getById(1L));
//		System.out.println(dhistoryDao.getById(2L));
//		System.out.println(dhistoryDao.getById(3L));
		
		
	}
}
