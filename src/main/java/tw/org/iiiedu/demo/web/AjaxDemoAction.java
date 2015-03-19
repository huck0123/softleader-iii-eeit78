package tw.org.iiiedu.demo.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.opensymphony.xwork2.ActionSupport;

public class AjaxDemoAction extends ActionSupport {
	private static final long serialVersionUID = 1L;
	
	private InputStream inputStream;
	
	public InputStream getInputStream() {
		return inputStream;
	}

	public String ajax() {
		inputStream = new ByteArrayInputStream("String".getBytes());
		return "success";
	}
	
}
