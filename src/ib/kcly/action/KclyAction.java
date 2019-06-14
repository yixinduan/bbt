package ib.kcly.action;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.kcgl.model.Kcgl;
import ib.kcgl.service.KcglService;
import ib.kcly.model.Kcly;
import ib.kcly.service.KclyService;
import ib.user.model.User;
import ib.user.service.UserService;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.math.NumberUtils;
import org.springframework.context.ApplicationContext;

import com.opensymphony.xwork2.ActionContext;

public class KclyAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private KclyService kclyService = (KclyService) applicationContext.getBean("kclyService");
	
	private KcglService kcglService = (KcglService) applicationContext.getBean("kcglService");
	
	private UserService userService = (UserService) applicationContext.getBean("userService");
	
	
	private static Pageinfo pageInfo;
		
	private List<Kcly> kclyList;
	
	private Kcly kcly;
	
	private String condition;
	
	private String ids;
	
	private int activeFlag;
	
	
	/**
	 * 实体列表
	 * @return
	 */
	public String kclyList() {
		
		kclyList = kclyService.findListKclyBycondition(null);
		
		if(kclyList==null) {
			kclyList = new ArrayList<Kcly>();
		}
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(10);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(kclyList.size());
		
		kclyList = kclyService.getOnePageList(kclyList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String kclyListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (content like '%"+condition+"%')";
		}
		kclyList = kclyService.findListKclyBycondition(sqlCondition);
		
		if(kclyList==null) {
			kclyList = new ArrayList<Kcly>();
		}
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(kclyList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		if(kclyList!=null){
			int count = pageInfo.getCurrentPage()-1;
			float sizeCount = (float) ((kclyList.size()+0.0)/pageInfo.getPageSize());
			if(sizeCount<=count){
				pageInfo.setCurrentPage(pageInfo.getCurrentPage()-1);
			}
		}
		if(pageInfo.getCurrentPage()<=0){
			pageInfo.setCurrentPage(1);
		}
		
		kclyList = kclyService.getOnePageList(kclyList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String kclyEdit() {
		
		
		if(kcly!=null&&kcly.getId()!=0){
			kcly = kclyService.findKclyById(kcly.getId());
	
		}else{
			kcly = new Kcly();
		}
		return SUCCESS;
	}
	
	/**
	 * 保存实体
	 * @return
	 */
	public String kclySave(){
		
		if(kcly!=null){
			if(kcly.getId()==0) {
				kcly.setTime(new Date());
				
				ActionContext actionContext = ActionContext.getContext();
				String userName = actionContext.getSession().get("userName")!=null?actionContext.getSession().get("userName").toString():null;
				if(userName!=null) {
					String sql = " AND name='"+ userName +"' AND type=2 ";
					
					List<User> userList = userService.findListUserBycondition(sql);
					if(userList!=null&&userList.size()==1){
						kcly.setUser(userList.get(0));
					}
				}
				
				
			}else {
				String reply = kcly.getReply();
				
				kcly = kclyService.findKclyById(kcly.getId());
				kcly.setReply(reply);
				kcly.setReplytime(new Date());
			}
			
			
			kclyService.saveOrupdateKcly(kcly);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 删除实体
	 * @return
	 */
	public String kclyDel() {
		
		kcly = kclyService.findKclyById(kcly.getId());
		if(kcly!=null){
			kclyService.deleteKcly(kcly);	
		}
		return SUCCESS;
	}
	
	/**
	 * 删除多个
	 * @return
	 */
	public String kclyAllDel(){
		kclyList = new ArrayList<Kcly>();
		if(ids!=null&&!ids.equals("")){
			String[] idArray = ids.split(",");
			for (String string : idArray) {
				Kcly entry = new Kcly();
				if(NumberUtils.isNumber(string)){
					entry.setId(NumberUtils.toInt(string));
					kclyService.deleteKcly(entry);
				}
				
			}
		}
		return SUCCESS;
	}
	
	public String upload_kclyEdit(){
		
		
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String kclyBy_tgListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (content like '%"+condition+"%')";
		}
		if(kcly.getKcgl()!=null&&kcly.getKcgl().getId()!=0){
			sqlCondition = " AND (question.question_type.id = "+kcly.getKcgl().getId()+") ";
		}
		
		
		kclyList = kclyService.findListKclyBycondition(sqlCondition);
		
		try {
			JSONArray jsonArray = new JSONArray();
			for (Kcly kcly : kclyList) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.accumulate("id", kcly.getId());
				jsonObject.accumulate("kc_name", kcly.getKcgl().getName());
				jsonObject.accumulate("user_name", kcly.getUser().getName());
				jsonObject.accumulate("content", kcly.getContent());
				jsonObject.accumulate("reply", kcly.getReply());
				jsonArray.add(jsonObject);
			}
			this.print(jsonArray.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return SUCCESS;
	}

	public static Pageinfo getPageInfo() {
		return pageInfo;
	}

	public static void setPageInfo(Pageinfo pageInfo) {
		KclyAction.pageInfo = pageInfo;
	}

	public List<Kcly> getKclyList() {
		return kclyList;
	}

	public void setKclyList(List<Kcly> kclyList) {
		this.kclyList = kclyList;
	}

	public Kcly getKcly() {
		return kcly;
	}

	public void setKcly(Kcly kcly) {
		this.kcly = kcly;
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

	public int getActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}


}
