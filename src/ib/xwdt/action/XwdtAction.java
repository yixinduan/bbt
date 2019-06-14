package ib.xwdt.action;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.user.model.User;
import ib.user.service.UserService;
import ib.xwdt.model.Xwdt;
import ib.xwdt.service.XwdtService;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.context.ApplicationContext;

import com.opensymphony.xwork2.ActionContext;

public class XwdtAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private XwdtService xwdtService = (XwdtService) applicationContext.getBean("xwdtService");
	
	private UserService userService = (UserService) applicationContext.getBean("userService");
	
	private static Pageinfo pageInfo;
		
	private List<Xwdt> xwdtList;
	
	private Xwdt xwdt;
	
	private String condition;

	private SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");// HH:mm:ss
	
	/**
	 * 实体列表
	 * @return
	 */
	public String xwdtList() {
		
		xwdtList = xwdtService.findListXwdtBycondition(null);
		if(xwdtList==null) {
			xwdtList = new ArrayList<Xwdt>();
		}
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(10);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(xwdtList.size());
		
		xwdtList = xwdtService.getOnePageList(xwdtList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	
	/**
	 * 实体列表
	 * @return
	 */
	public String xwdtListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (title like '%"+condition+"%' or content like '%\"+condition+\"%')";
		}
		
		xwdtList = xwdtService.findListXwdtBycondition(sqlCondition);
		if(xwdtList==null) {
			xwdtList = new ArrayList<Xwdt>();
		}
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(xwdtList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		if(xwdtList!=null){
			int count = pageInfo.getCurrentPage()-1;
			float sizeCount = (float) ((xwdtList.size()+0.0)/pageInfo.getPageSize());
			if(sizeCount<=count){
				pageInfo.setCurrentPage(pageInfo.getCurrentPage()-1);
			}
		}
		if(pageInfo.getCurrentPage()<=0){
			pageInfo.setCurrentPage(1);
		}
		
		xwdtList = xwdtService.getOnePageList(xwdtList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String xwdtAllList() {
		try {
			JSONArray jsonArray = new JSONArray();
			xwdtList = xwdtService.findListXwdtBycondition(null);
			for (Xwdt xwdt : xwdtList) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.accumulate("id", xwdt.getId());
				jsonObject.accumulate("title", xwdt.getTitle());
				jsonArray.add(jsonObject);
			}
			this.print(jsonArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String xwdtEdit() {
		
		if(xwdt!=null&&xwdt.getId()!=0){
			xwdt = xwdtService.findXwdtById(xwdt.getId());
		}else{
			xwdt = new Xwdt();
		}
		return SUCCESS;
	}
	
	/**
	 * 验证重复
	 */
	public void xwdtByRepetition() {
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			if(xwdt!=null&&xwdt.getTitle()!=null&&!xwdt.getTitle().equals("")){
				String sql = " AND name='"+xwdt.getTitle()+"'";
	    		List<Xwdt> list = xwdtService.findListXwdtBycondition(sql);
	    		if(list==null||list.isEmpty()){
	        		flag = true;
	        	}else if(list.size()>1){
	        		flag = false;
	        	}else{
	        		if(xwdt.getId()==list.get(0).getId()){
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
	public String xwdtSave(){
		
		if(xwdt!=null){
			
			xwdt.setTime(new Date());
			
			ActionContext actionContext = ActionContext.getContext();
			
			String rootName = actionContext.getSession().get("rootName")!=null?actionContext.getSession().get("rootName").toString():null;
			if(rootName!=null) {
				String sql = " AND name='"+ rootName +"' AND type=1 ";
				
				List<User> userList = userService.findListUserBycondition(sql);
				if(userList!=null&&userList.size()==1){
					xwdt.setUser(userList.get(0));
				}
			}
			xwdtService.saveOrupdateXwdt(xwdt);
		}
		return SUCCESS;
	}
	
	/**
	 * 删除实体
	 * @return
	 */
	public String xwdtDel() {
		
		xwdt = xwdtService.findXwdtById(xwdt.getId());
		if(xwdt!=null){
			xwdtService.deleteXwdt(xwdt);	
		}
		return SUCCESS;
	}
	
	public Pageinfo getPageInfo() {
		return pageInfo;
	}

	public  void setPageInfo(Pageinfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Xwdt> getXwdtList() {
		return xwdtList;
	}

	public void setXwdtList(List<Xwdt> xwdtList) {
		this.xwdtList = xwdtList;
	}

	public Xwdt getXwdt() {
		return xwdt;
	}

	public void setXwdt(Xwdt xwdt) {
		this.xwdt = xwdt;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}
	
}
