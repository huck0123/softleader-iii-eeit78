package tw.org.iiiedu.thegivers.listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class OnlineSessionListener implements HttpSessionListener {
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	private static int count;
	
    public static int getCount() {
    	return count;
    }

    public void sessionCreated(HttpSessionEvent arg0)  { 
    	OnlineSessionListener.count++;
    	System.out.println(count);
    }

    public void sessionDestroyed(HttpSessionEvent arg0)  { 
    	if(OnlineSessionListener.count > 0){
    		OnlineSessionListener.count--;
    	}
    	System.out.println(count);
    }
	
}
