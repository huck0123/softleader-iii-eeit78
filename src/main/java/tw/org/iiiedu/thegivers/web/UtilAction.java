package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
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
	
	private InputStream inputStream;
	
	
	
	public InputStream getInputStream() {
		return inputStream;
	}



	public String util(){
		
//		System.out.println(campaignService.getHighestCurrentFund());  //捐款額最高的活動
//		System.out.println(campaignService.getHighestGoal());  //最高募款金額的活動
//		System.out.println(campaignService.getCampaignCount());  //活動數量
//		System.out.println(OnlineSessionListener.getCount());  //在線人數
//		System.out.println(giverService.getCount());  //giver人數
//		System.out.println(raiserService.getCount());  //raiser人數
		
		//活動類型及筆數
		List<CampaignTypeModel> campaignTypeModels = campaignTypeService.getAll();
		int campaignTypeNumber = campaignTypeModels.size();
		
		CampaignForm campaignForm = new CampaignForm();
		Map<String, Integer> map = new HashMap<>();
		for(int i=0; i<campaignTypeNumber; i++){
			campaignForm.setType(campaignTypeModels.get(i).getName());
			int temp = campaignService.getByAllConditionCount(campaignForm).intValue();
			map.put(campaignTypeModels.get(i).getName(), temp);
		}
		
		//活動地點及筆數
		List<CityModel> cityModels = cityService.getAll();
		int cityNumber = cityModels.size();
		
		CampaignForm campaignForm1 = new CampaignForm();
		Map<String, Integer> map1 = new HashMap<>();
		for(int j=0; j<cityNumber; j++){
			campaignForm1.setLocation(cityModels.get(j).getName());
			int temp1 = campaignService.getByAllConditionCount(campaignForm1).intValue();
			map1.put(cityModels.get(j).getName(),temp1);
		}
		
		//giver年齡區間數量
		Map<String, Integer> map2 = new HashMap<>();  //男性
		Map<String, Integer> map3 = new HashMap<>();  //女性
		//建立date格式
		DateFormat df = new SimpleDateFormat("MM-dd-yyyy");
		//取得現在時間
		Calendar rightNow = Calendar.getInstance();
		int year = rightNow.get(Calendar.YEAR);  //年
		int month = rightNow.get(Calendar.MONTH)+1;  //月
		int date = rightNow.get(Calendar.DATE);  //日
		
		
		try {
			//男性
			//0~9歲
			map2.put("0~9", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-10)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-0)).getTime())));
			//10~19歲
			map2.put("10~19", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-20)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-10)).getTime())));
			//20~29歲
			map2.put("20~29", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-30)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-20)).getTime())));
			//30~39歲
			map2.put("30~39", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-40)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-30)).getTime())));
			//40~49歲
			map2.put("40~49", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-50)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-40)).getTime())));
			//50~59歲
			map2.put("50~59", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-60)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-50)).getTime())));
			//60~69歲
			map2.put("60~69", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-70)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-60)).getTime())));
			//70歲以上
			map2.put("70up", -giverService.getMaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-150)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-70)).getTime())));
			
			//女性
			//0~9歲
			map3.put("0~9", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-10)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-0)).getTime())));
			//10~19歲
			map3.put("10~19", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-20)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-10)).getTime())));
			//20~29歲
			map3.put("20~29", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-30)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-20)).getTime())));
			//30~39歲
			map3.put("30~39", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-40)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-30)).getTime())));
			//40~49歲
			map3.put("40~49", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-50)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-40)).getTime())));
			//50~59歲
			map3.put("50~59", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-60)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-50)).getTime())));
			//60~69歲
			map3.put("60~69", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-70)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-60)).getTime())));
			//70歲以上
			map3.put("70up", giverService.getFemaleAgeIntervalCount(
					new Timestamp(df.parse(month + "-" + date + "-" + (year-150)).getTime()),
					new Timestamp(df.parse(month + "-" + date + "-" + (year-70)).getTime())));
			
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//包成map丟到前端
		Map<String, Object> statMap = new HashMap<>();
		statMap.put("highestCurrentFund", campaignService.getHighestCurrentFund().getName());   //捐款額最高的活動
		statMap.put("highestCurrentFundID", campaignService.getHighestCurrentFund().getId());   //捐款額最高的活動ID
		statMap.put("highestGoal", campaignService.getHighestGoal().getName());                 //最高募款金額的活動
		statMap.put("highestGoalID", campaignService.getHighestGoal().getId());                   //最高募款金額的活動ID
		statMap.put("campaignCount", campaignService.getCampaignCount());             			//活動數量
		statMap.put("onlineCount", OnlineSessionListener.getCount());           			    //在線人數
		statMap.put("giverCount", giverService.getCount());                     		        //giver人數
		statMap.put("raiserCount", raiserService.getCount());           			            //raiser人數
		statMap.put("typeCount", map);                                              		    //活動類型
		statMap.put("cityCount", map1);                                       	 		        //活動地點及筆數
		statMap.put("maleAgeInterval", map2);
		statMap.put("femaleAgeInterval", map3);
		
		String jsonStr = JSONObject.toJSONString(statMap);
		inputStream = new ByteArrayInputStream(jsonStr.getBytes(StandardCharsets.UTF_8));
		
		return SUCCESS;
	}
	
	
	
}