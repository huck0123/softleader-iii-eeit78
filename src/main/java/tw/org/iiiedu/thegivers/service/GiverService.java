package tw.org.iiiedu.thegivers.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.org.iiiedu.thegivers.dao.GiverDao;
import tw.org.iiiedu.thegivers.model.GiverModel;

@Service
public class GiverService {

	@Autowired
	private GiverDao giverDao;


public GiverModel login(String account, String passwd){
	
	return null;
}

	
	


	
}
