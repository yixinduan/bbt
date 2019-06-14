package ib.user.action;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.kcly.model.Kcly;
import ib.kcly.service.KclyService;
import ib.user.model.User;
import ib.user.service.UserService;
import ib.xwdt.model.Xwdt;
import ib.xwdt.service.XwdtService;
import ib.shopcar.model.Shopcar;
import ib.shopcar.service.ShopcarService;

import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONObject;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.context.ApplicationContext;

import com.opensymphony.xwork2.ActionContext;


public class UserAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private UserService userService = (UserService) applicationContext.getBean("userService");
	
	private static Pageinfo pageInfo;
		
	private List<User> userList;
	
	private User user;
	
	private String condition;
	
	private String ids;
	
	
	private KclyService kclyService = (KclyService) applicationContext.getBean("kclyService");
	
	private XwdtService xwdtService = (XwdtService) applicationContext.getBean("xwdtService");
	
	private ShopcarService shopcarService = (ShopcarService) applicationContext.getBean("shopcarService");
	
	/**
	 * 实体列表
	 * @return
	 */
	public String userList() {
		
		userList = userService.findListUserBycondition(null);
		
		if(userList==null) {
			userList = new ArrayList<User>();
		}
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(20);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(userList.size());
		
		userList = userService.getOnePageList(userList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String userListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (name like '%"+condition+"%' OR phone like '%"+condition+"%')";
			
		}
		userList = userService.findListUserBycondition(sqlCondition);
		if(userList==null) {
			userList = new ArrayList<User>();
		}
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(userList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		userList = userService.getOnePageList(userList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String userEdit() {
		
		if(user!=null&&user.getId()!=0){
			user = userService.findUserById(user.getId());
		}else{
			user = new User();
		}
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String grzx() {
		
		ActionContext actionContext = ActionContext.getContext();
		
		String userName = (String) actionContext.getSession().get("userName");
		
		String sql = " AND name='"+ userName +"'";
		
		
		userList = userService.findListUserBycondition(sql);
		if(userList!=null&&userList.size()==1){
			user = userList.get(0);
		}else{
			user = new User();
		}

		return SUCCESS;
	}
	
	
	/**
	 * 验证重复
	 */
	public void userByRepetition() {
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			if(user!=null&&user.getName()!=null&&!user.getName().equals("")){
				String sql = " AND name='"+user.getName()+"'";
	    		List<User> list = userService.findListUserBycondition(sql);
	    		if(list==null||list.isEmpty()){
	        		flag = true;
	        	}else if(list.size()>1){
	        		flag = false;
	        	}else{
	        		if(user.getId()==list.get(0).getId()){
	        			flag = true;
	        		}else{
	        			flag = false;
	        		}
	        	}
			}
			jsonObject.accumulate("flag", flag);
			this.print(jsonObject.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 保存实体
	 * @return
	 */
	public String userSave(){
		
		if(user!=null){
			userService.saveOrupdateUser(user);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 保存实体
	 * @return
	 */
	public void userUpdate(){

		if(user!=null){
			User entry = userService.findUserById(user.getId());
			
			if(user.getName()!=null&&!"".equals(user.getName())){
				entry.setName(user.getName());
			}
			
			if(user.getPhone()!=null&&!"".equals(user.getPhone())){
				entry.setPhone(user.getPhone());
			}
			
			if(user.getPwd()!=null&&!"".equals(user.getPwd())){
				entry.setPwd(user.getPwd());
			}
			
			userService.saveOrupdateUser(entry);
		}
		this.print("保存成功");
	}
	
	/**
	 * 删除实体
	 * @return
	 */
	public String userDel() {
		
		user = userService.findUserById(user.getId());
		if(user!=null){
			//删除留言
			Kcly kcly = new Kcly();
			kcly.setUser(user);
			kclyService.deleteKclyMany(kcly);
			
			//删除留言
			Shopcar shopcar = new Shopcar();
			shopcar.setUser(user);
			shopcarService.deleteShopcarMany(shopcar);
			
			//删除新闻动态
			Xwdt xwdt = new Xwdt();
			xwdt.setUser(user);
			xwdtService.deleteXwdtMany(xwdt);
			
			userService.deleteUser(user);	
		}
		return SUCCESS;
	}
	
	/**
	 * 删除多个
	 * @return
	 */
	public String userAllDel(){
		userList = new ArrayList<User>();
		if(ids!=null&&!ids.equals("")){
			String[] idArray = ids.split(",");
			for (String string : idArray) {
				User entry = new User();
				if(NumberUtils.isNumber(string)){
					entry.setId(NumberUtils.toInt(string));
					userService.deleteUser(entry);
				}
				
			}
		}
		return SUCCESS;
	}
	
	/**
	 * 删除多个
	 * @return
	 */
	public String userReserve(){
		if(user!=null&&user.getId()!=0){
			user = userService.findUserById(user.getId());
			
			user.setPwd("123456");
			
			userService.saveOrupdateUser(user);
		}
		return SUCCESS;
	}

	
	public Pageinfo getPageInfo() {
		return pageInfo;
	}

	public  void setPageInfo(Pageinfo pageInfo) {
		this.pageInfo = pageInfo;
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

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}
}
