package ib.login.action;
import ib.common.BaseAction;
import ib.common.SpringContextHolder;
import ib.user.model.User;
import ib.user.service.UserService;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.ApplicationContext;

import com.opensymphony.xwork2.ActionContext;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class Login_RootAction extends BaseAction implements SessionAware,ServletResponseAware{
	
private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private UserService userService = (UserService) applicationContext.getBean("userService");
			
	private List<User> userList;
	
	private User user;
	
	private HttpServletResponse response;
	
    private String checkNum; 
    
    private Map<String, Object> sessionMap;
	
    
    public void checkName() {
		
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			
			ActionContext actionContext = ActionContext.getContext();
			String sql = " AND name='"+ user.getName() +"' AND type=1 ";
			userList = userService.findListUserBycondition(sql);
			
			if(userList!=null&&userList.size()==1){
				flag = true;
			}
			jsonObject.accumulate("flag", flag);
			this.print(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    
    /**
     * ��֤����
     * @return
     * @throws Exception
     */
	public void checkpwd() {
		
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			
			String sql = " AND name='"+ user.getName() +"' AND type=1 ";
			
			userList = userService.findListUserBycondition(sql);
			if(userList!=null&&userList.size()==1){
				User entity = userList.get(0);
				if(entity.getPwd().equals(user.getPwd())){
					
					String checkStr = (String) sessionMap.get("randomCode");
					if(checkStr.equals(checkNum)) {
						flag = true;
					}else{
						jsonObject.accumulate("msg", "��֤�����");
					}
				}else{
					jsonObject.accumulate("msg", "�������");
				}
			}
			
			jsonObject.accumulate("flag", flag);
			this.print(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
    
    /**
     * ��Ա��¼��ת
     * @return
     * @throws Exception
     */
	public String login() {
		
		ActionContext actionContext = ActionContext.getContext();
		
		
		String sql = " AND name='"+ user.getName() +"' AND type=1 ";
				
		userList = userService.findListUserBycondition(sql);
		if(userList!=null&&userList.size()==1){
			actionContext.getSession().put("rootName", user.getName());
		}
		return SUCCESS;
	}

	/**
	 * �û��˳�
	 * @return
	 * @throws Exception
	 */
	public String logout() throws Exception{
		Map<String,Object> map = ActionContext.getContext().getSession();
		map.clear();
		return SUCCESS;
	}
	
	/**
	 * ��֤��
	 */
    public String randomCode() { 
    	try {
	        response.setHeader("Cache-Control", "no-cache");  
	        int width=90; //ͼƬ���  
	        int height=26; //ͼƬ�߶�  
	        BufferedImage image=new BufferedImage(width,height,BufferedImage.TYPE_INT_RGB);  
	        Graphics graphics=image.createGraphics();  
	        graphics.setColor(this.getColor());   //������ɫ  
	        graphics.fillRect(0, 0, width, height);  
	        graphics.setFont(new Font("Arial",Font.BOLD,18));  
	        graphics.setColor(this.getColor());   //�ֵ���ɫ  
	        String number=String.valueOf(System.currentTimeMillis()%9000+1000);   //������λ�����  
	        sessionMap.put("randomCode", number);     //д��session��  
	        graphics.drawString(number, (int)(width*0.3), (int)(height*0.8));  
	        graphics.dispose();  
	        JPEGImageEncoder encoder=JPEGCodec.createJPEGEncoder(response.getOutputStream());  
	        encoder.encode(image);  
	        response.getOutputStream().flush();    //ˢ�µ�ҳ������ͼƬ  
	        response.getOutputStream().close();    //�ر�writer  
    	} catch (Exception e) {
			e.printStackTrace();
		}
        
        return null;  
    }
	
    public String regUser(){
    	return SUCCESS;
    }
    
	private Color getColor(){  
	    int red=(int)(Math.random()*1000%256);  
	    int green=(int)(Math.random()*1000%256);  
	    int blue=(int)(Math.random()*1000%256);  
	    return new Color(red,green,blue);  
	}


	public UserService getUserService() {
		return userService;
	}


	public void setUserService(UserService userService) {
		this.userService = userService;
	}


	public List<User> getUserList() {
		return userList;
	}


	public void setUserList(List<User> userList) {
		this.userList = userList;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public HttpServletResponse getResponse() {
		return response;
	}


	public void setResponse(HttpServletResponse response) {
		this.response = response;
	}

	public Map<String, Object> getSessionMap() {
		return sessionMap;
	}


	public void setSessionMap(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}


	public void setSession(Map<String, Object> sessionMap) {
		this.sessionMap = sessionMap;
	}

	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}


	public String getCheckNum() {
		return checkNum;
	}


	public void setCheckNum(String checkNum) {
		this.checkNum = checkNum;
	}
}
