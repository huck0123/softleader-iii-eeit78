package tw.org.iiiedu.thegivers.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.listener.OnlineSessionListener;
import tw.org.iiiedu.thegivers.model.CampaignTypeModel;
import tw.org.iiiedu.thegivers.model.CityModel;
import tw.org.iiiedu.thegivers.service.CampaignService;
import tw.org.iiiedu.thegivers.service.CampaignTypeService;
import tw.org.iiiedu.thegivers.service.CityService;
import tw.org.iiiedu.thegivers.service.GiverService;
import tw.org.iiiedu.thegivers.service.RaiserService;

import com.opensymphony.xwork2.ActionSupport;

public class UtilAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private CampaignService campaignService;
	@Autowired
	private GiverService giverService;
	@Autowired
	private RaiserService raiserService;
	@Autowired
	private CampaignTypeService campaignTypeService;
	@Autowired
	private CityService cityService;
	
	public String util(){
		System.out.println(campaignService.getHighestCurrentFund());  //捐款額最高的活動
		System.out.println(campaignService.getHighestGoal());  //最高募款金額的活動
		System.out.println(campaignService.getCampaignCount());  //活動數量
		System.out.println(OnlineSessionListener.getCount());  //在線人數
		System.out.println(giverService.getCount());  //giver人數
		System.out.println(raiserService.getCount());  //raiser人數
		
		//活動分布筆數
		List<CampaignTypeModel> campaignTypeModels = campaignTypeService.getAll();
		int campaignTypeNumber = campaignTypeModels.size();
		
		CampaignForm campaignForm = new CampaignForm();
		Map<String, Integer> map = new HashMap<>();
		for(int i=0; i<campaignTypeNumber; i++){
			campaignForm.setType(campaignTypeModels.get(i).getName());
			int temp = campaignService.getByAllConditionCount(campaignForm).intValue();
			map.put(campaignTypeModels.get(i).getName(), temp);
		}
		System.out.println(map); //活動分布筆數
		
		//活動地點筆數
		List<CityModel> cityModels = cityService.getAll();
		int cityNumber = cityModels.size();
		
		CampaignForm campaignForm1 = new CampaignForm();
		Map<String, Integer> map1 = new HashMap<>();
		for(int j=0; j<cityNumber; j++){
			campaignForm1.setLocation(cityModels.get(j).getName());
			int temp1 = campaignService.getByAllConditionCount(campaignForm1).intValue();
			map1.put(cityModels.get(j).getName(),temp1);
		}
		System.out.println(map1); //活動地點筆數
		
		return SUCCESS;
	}
	
	
}