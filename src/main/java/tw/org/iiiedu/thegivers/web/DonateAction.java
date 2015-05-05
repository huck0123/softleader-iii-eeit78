package tw.org.iiiedu.thegivers.web;

import org.apache.struts2.ServletActionContext;
import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.org.iiiedu.thegivers.form.TransactionDetailForm;
import tw.org.iiiedu.thegivers.model.TransactionDetailModel;
import tw.org.iiiedu.thegivers.service.TransactionService;

import com.opensymphony.xwork2.ActionSupport;

public class DonateAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	protected Logger log = LoggerFactory.getLogger(this.getClass());

	
	@Autowired
	TransactionService service;
	
	private TransactionDetailForm form;
	private TransactionDetailModel model;
	
	
	public TransactionDetailForm getForm() {
		return form;
	}

	public void setForm(TransactionDetailForm form) {
		this.form = form;
	}




	//insert
	public String donate(){
		log.debug("++++++++++++++++++++++++++++++donateAction++++++++++++{}",form);
		model = new TransactionDetailModel();
		
		model.setGiverId(form.getGiverId());
		model.setAmount(form.getAmount());
		model.setCardType(form.getCardType());
		model.setCardNo(form.getCardNo());
		model.setCardHolder(form.getCardHolder());
		model.setCardHolderEmail(form.getCardHolderEmail());
		model.setIp(ServletActionContext.getRequest().getRemoteAddr());

		try{
			service.insert(model, form.getCampaignId()); //Service insert接收兩參數
			log.debug("++++++++++++++++++++++++++++++donateAction++++++++++++{}",form);
		}catch(HibernateException e){
			e.printStackTrace();
			return "fail";
		}
		return SUCCESS;
	}
	
}
