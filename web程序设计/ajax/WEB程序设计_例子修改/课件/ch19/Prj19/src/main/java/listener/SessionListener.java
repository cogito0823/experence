package listener;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		//初始化购物车
		HashMap books = new HashMap();
		session.setAttribute("books",books);
		//初始化总钱数
		session.setAttribute("money",0F);
	}
	public void sessionDestroyed(HttpSessionEvent arg0) {}	
}
