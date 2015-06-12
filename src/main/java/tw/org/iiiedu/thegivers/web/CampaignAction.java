package tw.org.iiiedu.thegivers.web;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.dao.CampaignDao;
import tw.org.iiiedu.thegivers.form.CampaignForm;
import tw.org.iiiedu.thegivers.model.CampaignModel;
import tw.org.iiiedu.thegivers.model.RaiserModel;
import tw.org.iiiedu.thegivers.service.CampaignService;
import tw.org.iiiedu.thegivers.service.TransactionService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CampaignAction extends ActionSupport implements
		ServletRequestAware{

	private InputStream inputStream;

	private CampaignForm campaignForm;
	private HttpServletRequest request;
	@Autowired
	private CampaignService campaignService;
	@Autowired
	private TransactionService transactionService;

	public InputStream getInputStream() {
		return inputStream;
	}

	public CampaignForm getCampaignForm() {
		return campaignForm;
	}

	public void setCampaignForm(CampaignForm campaignForm) {
		this.campaignForm = campaignForm;
	}

	public String selectByAllCondition() throws Exception {
		if (campaignForm.getPageNum() == null) {
			campaignForm.setPageNum(0);
		}
		if (campaignForm.getPageSize() == null) {
			campaignForm.setPageSize(6);
		}
		List campaigns = campaignService.getByAllCondition(campaignForm);
		Gson gson = new Gson();
		String json = gson.toJson(campaigns);

		inputStream = new ByteArrayInputStream(
				json.getBytes(StandardCharsets.UTF_8));

		return "selectByAllCondition";
	}

	public String selectByAllConditionCount() throws Exception {

		Long count = campaignService.getByAllConditionCount(campaignForm);

		inputStream = new ByteArrayInputStream(count.toString().getBytes(
				StandardCharsets.UTF_8));

		return "selectByAllConditionCount";
	}

	public String insert() throws Exception {
		//驗證campaignForm資料
		Map<String,String> errorsMap = new HashMap<>();
		request.setAttribute("errors", errorsMap);
		if(campaignForm.getName().trim() == null || campaignForm.getName().trim().length()==0){
		errorsMap.put("name", "活動名稱請勿留白");
		} 

		if(campaignForm.getGoal() == null){
		errorsMap.put("goal", "目標金額請勿留白");
		} else if(campaignForm.getGoal() <0){
		errorsMap.put("goal", "請填入正確金額");
		}
		
		if(campaignForm.getImage() == null){
		errorsMap.put("image", "請上傳圖片");
		}
		
		if(campaignForm.getDuration() == null){
		errorsMap.put("duration", "活動天數請勿留白");
		}
		
		if(campaignForm.getType().trim() == null || campaignForm.getType().trim().length()==0 ){
		errorsMap.put("type", "類型請勿留白");
		}
		
		if(campaignForm.getLocation().trim() == null || campaignForm.getLocation().trim().length()==0 ){
		errorsMap.put("location", "地點請勿留白");
		}
		
		if(campaignForm.getVedioUrl().trim() == null || campaignForm.getVedioUrl().trim().length()==0 ){
		errorsMap.put("vedioUrl", "影片聯結請勿留白");
		}
		
		if(campaignForm.getDetail().trim() == null || campaignForm.getDetail().trim().length()==0 ){
		errorsMap.put("detail", "活動詳情請勿留白");
		}
		
		if(errorsMap.size()>0){
		return "input";
		}


		CampaignModel cm = new CampaignModel();
		RaiserModel rm = (RaiserModel) request.getSession().getAttribute(
				"raiser");
		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
		cm.setStartDate(new Timestamp(new java.util.Date().getTime()));
		System.out.println(cm.getStartDate().getTime());
		System.out.println(cm.getStartDate().getTime()+campaignForm.getDuration()*24*3600*1000);
		long l = campaignForm.getDuration();
		l= l*24*3600*1000;
		cm.setEndDate(new Timestamp(cm.getStartDate().getTime()+ l));
		System.out.println(cm.getEndDate().toString());
		if (campaignForm.getImage() != null) {
			cm.setImage(IOUtils.toByteArray(new FileInputStream(campaignForm
					.getImage())));
		}
		cm.setLocation(campaignForm.getLocation());
		cm.setName(campaignForm.getName());
		cm.setCurrentFund(0);
		cm.setRaiserModel(rm);
		cm.setType(campaignForm.getType());
		cm.setVedioUrl(campaignForm.getVedioUrl());

		campaignService.insert(cm);
		return "insert";
	}

	public String update() throws Exception {
		//驗證campaignForm資料
//		Map<String,String> errorsMap = new HashMap<>();
//		request.setAttribute("errors", errorsMap);
//		if(campaignForm.getName().trim() == null || campaignForm.getName().trim().length()==0){
//		errorsMap.put("name", "活動名稱請勿留白");
//		} 
//
//		if(campaignForm.getGoal() == null){
//		errorsMap.put("goal", "目標金額請勿留白");
//		} else if(campaignForm.getGoal() <0){
//		errorsMap.put("goal", "請填入正確金額");
//		}
//		
//		if(campaignForm.getImage() == null){
//		errorsMap.put("image", "請上傳圖片");
//		}
//		
//		if(campaignForm.getDuration() == null){
//		errorsMap.put("duration", "活動天數請勿留白");
//		}
//		
//		if(campaignForm.getType().trim() == null || campaignForm.getType().trim().length()==0 ){
//		errorsMap.put("type", "類型請勿留白");
//		}
//		
//		if(campaignForm.getLocation().trim() == null || campaignForm.getLocation().trim().length()==0 ){
//		errorsMap.put("location", "地點請勿留白");
//		}
//		
//		if(campaignForm.getVedioUrl().trim() == null || campaignForm.getVedioUrl().trim().length()==0 ){
//		errorsMap.put("vedioUrl", "影片聯結請勿留白");
//		}
//		
//		if(campaignForm.getDetail().trim() == null || campaignForm.getDetail().trim().length()==0 ){
//		errorsMap.put("detail", "活動詳情請勿留白");
//		}
//		
//		if(errorsMap.size()>0){
//		return "input";
//		}

		
		
		CampaignModel cm = campaignService.getById(campaignForm.getId());
//		RaiserModel rm = (RaiserModel) request.getSession().getAttribute(
//				"raiser");
//		cm.setGoal(campaignForm.getGoal());
		cm.setDetail(campaignForm.getDetail());
//		cm.setStartDate(new Timestamp(new java.util.Date().getTime()));
//		cm.setEndDate(new Timestamp(cm.getStartDate().getTime()+campaignForm.getDuration()*24*3600*1000));
		if (campaignForm.getImage() != null) {
			cm.setImage(IOUtils.toByteArray(new FileInputStream(campaignForm
					.getImage())));
		}
//		cm.setLocation(campaignForm.getLocation());
//		cm.setName(campaignForm.getName());
//		cm.setCurrentFund(0);
//		cm.setRaiserModel(rm);
//		cm.setType(campaignForm.getType());
//		cm.setVedioUrl(campaignForm.getVedioUrl());

		campaignService.update(cm);
		return "update";
	}
	
	
	
	public String selectGiverCountByCampaignId() {

		Integer count = transactionService.getCountByCampaignId(campaignForm
				.getId());

		inputStream = new ByteArrayInputStream(count.toString().getBytes(
				StandardCharsets.UTF_8));

		return "selectCampaignGiverCount";
	}

	public String ban() {
		if (campaignForm.getBan() == null) {
			return "ban";
		}
		String[] strArr = campaignForm.getBan().split("&");
		if (strArr.length > 0) {
			for (int i = 0; i < strArr.length; i++) {
				String id = strArr[i].substring(strArr[i].lastIndexOf("=")+1);
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(id));
				cm.setValid(false);
				campaignService.update(cm);
			}
		}
		return "ban";
	}

	public String unban() {
		if (campaignForm.getBan() == null) {
			return "unban";
		}
		String[] strArr = campaignForm.getBan().split("&");
		if (strArr.length > 0) {
			for (int i = 0; i < strArr.length; i++) {
				String id = strArr[i].substring(strArr[i].lastIndexOf("=")+1);
				CampaignModel cm = campaignService.getById(Integer
						.parseInt(id));
				cm.setValid(true);
				campaignService.update(cm);
			}
		}
		return "unban";
	}

	public String selectRaiserIdById(){
		CampaignModel cm = campaignService.getById(campaignForm.getId());
		Integer outputRaiserId = cm.getRaiserModel().getId();
		inputStream = new ByteArrayInputStream(outputRaiserId.toString().getBytes(
				StandardCharsets.UTF_8));
		return "selectRaiserIdById";
	}
	
	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	public String downloadExcel() {

		Workbook wb = new HSSFWorkbook();

		// create a new sheet
		Sheet s = wb.createSheet();
		// declare a row object reference
		Row r = null;
		// declare a cell object reference
		Cell c = null;
		Cell c2 = null;
		Cell c3 = null;
		Cell c4 = null;
		Cell c5 = null;
		Cell c6 = null;
		Cell c7 = null;
		Cell c8 = null;
		Cell c9 = null;

		// Define title
		r = s.createRow(0);
		c = r.createCell(0);
		c2 = r.createCell(1);
		c3 = r.createCell(2);
		c4 = r.createCell(3);
		c5 = r.createCell(4);
		c6 = r.createCell(5);
		c7 = r.createCell(6);
		c8 = r.createCell(7);
		c9 = r.createCell(8);

		c.setCellValue("id");
		c2.setCellValue("活動名稱");
		c3.setCellValue("raiser_id");
		c4.setCellValue("目標金額");
		c5.setCellValue("活動開始日期");
		c6.setCellValue("活動結束日期");
		c7.setCellValue("目前金額");
		c8.setCellValue("活動類型");
		c9.setCellValue("捐款人數");

		List<CampaignModel> list = campaignService.getAllForExcel();
		CampaignModel model;

		// Define a few rows
		for (int rownum = 1; rownum <= list.size(); rownum++) {
			r = s.createRow(rownum);
			c = r.createCell(0);
			c2 = r.createCell(1);
			c3 = r.createCell(2);
			c4 = r.createCell(3);
			c5 = r.createCell(4);
			c6 = r.createCell(5);
			c7 = r.createCell(6);
			c8 = r.createCell(7);
			c9 = r.createCell(8);

			model = (CampaignModel) list.get(rownum - 1);
			c.setCellValue(model.getId());
			c2.setCellValue(model.getName());
			c3.setCellValue(model.getRaiserModel().getId());
			c4.setCellValue(model.getGoal());
			c5.setCellValue(model.getStartDate().toString());
			c6.setCellValue(model.getEndDate().toString());
			c7.setCellValue(model.getCurrentFund());
			c8.setCellValue(model.getType());
			c9.setCellValue(transactionService.getCountByCampaignId(model
					.getId()));

		}

		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			wb.write(baos);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		inputStream = new ByteArrayInputStream(baos.toByteArray());
		return "downloadExcel";
	}




	
}
