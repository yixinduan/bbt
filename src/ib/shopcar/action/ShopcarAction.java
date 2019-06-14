package ib.shopcar.action;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.kcgl.model.Kcgl;
import ib.kcgl.service.KcglService;
import ib.shopcar.model.Shopcar;
import ib.shopcar.service.ShopcarService;
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

public class ShopcarAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private ShopcarService shopcarService = (ShopcarService) applicationContext.getBean("shopcarService");
	
	private KcglService kcglService = (KcglService) applicationContext.getBean("kcglService");
	
	private UserService userService = (UserService) applicationContext.getBean("userService");
	
	
	private static Pageinfo pageInfo;
		
	private List<Shopcar> shopcarList;
	
	private Shopcar shopcar;
	
	private String condition;
	
	private String ids;
	
	private int activeFlag;
	
	
	/**
	 * 实体列表
	 * @return
	 */
	public String shopcarList() {
		
		shopcarList = shopcarService.findListShopcarBycondition(null);
		
		if(shopcarList==null) {
			shopcarList = new ArrayList<Shopcar>();
		}
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(10);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(shopcarList.size());
		
		shopcarList = shopcarService.getOnePageList(shopcarList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String shopcarListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (content like '%"+condition+"%')";
		}
		shopcarList = shopcarService.findListShopcarBycondition(sqlCondition);
		
		if(shopcarList==null) {
			shopcarList = new ArrayList<Shopcar>();
		}
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(shopcarList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		if(shopcarList!=null){
			int count = pageInfo.getCurrentPage()-1;
			float sizeCount = (float) ((shopcarList.size()+0.0)/pageInfo.getPageSize());
			if(sizeCount<=count){
				pageInfo.setCurrentPage(pageInfo.getCurrentPage()-1);
			}
		}
		if(pageInfo.getCurrentPage()<=0){
			pageInfo.setCurrentPage(1);
		}
		
		shopcarList = shopcarService.getOnePageList(shopcarList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String shopcarEdit() {
		
		
		if(shopcar!=null&&shopcar.getId()!=0){
			shopcar = shopcarService.findShopcarById(shopcar.getId());
	
		}else{
			shopcar = new Shopcar();
		}
		return SUCCESS;
	}
	
	/**
	 * 保存实体
	 * @return
	 */
	public String shopcarSave(){
		
		if(shopcar!=null){
			if(shopcar.getId()==0) {
				/*shopcar.setTime(new Date());*/
				
				ActionContext actionContext = ActionContext.getContext();
				String userName = actionContext.getSession().get("userName")!=null?actionContext.getSession().get("userName").toString():null;
				if(userName!=null) {
					String sql = " AND name='"+ userName +"' AND type=2 ";					
					List<User> userList = userService.findListUserBycondition(sql);
					if(userList!=null&&userList.size()==1){
						shopcar.setUser(userList.get(0));
					}
				}								
			}else {				
				shopcar = shopcarService.findShopcarById(shopcar.getId());				
			}
			shopcarService.saveOrupdateShopcar(shopcar);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 删除实体
	 * @return
	 */
	public String shopcarDel() {
		
		shopcar = shopcarService.findShopcarById(shopcar.getId());
		if(shopcar!=null){
			shopcarService.deleteShopcar(shopcar);	
		}
		return SUCCESS;
	}
	
	/**
	 * 删除多个
	 * @return
	 */
	public String shopcarAllDel(){
		shopcarList = new ArrayList<Shopcar>();
		if(ids!=null&&!ids.equals("")){
			String[] idArray = ids.split(",");
			for (String string : idArray) {
				Shopcar entry = new Shopcar();
				if(NumberUtils.isNumber(string)){
					entry.setId(NumberUtils.toInt(string));
					shopcarService.deleteShopcar(entry);
				}
				
			}
		}
		return SUCCESS;
	}
	
	public String upload_shopcarEdit(){
		
		
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String shopcarBy_tgListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (content like '%"+condition+"%')";
		}
		if(shopcar.getKcgl()!=null&&shopcar.getKcgl().getId()!=0){
			sqlCondition = " AND (question.question_type.id = "+shopcar.getKcgl().getId()+") ";
		}
		
		
		shopcarList = shopcarService.findListShopcarBycondition(sqlCondition);
		
		try {
			JSONArray jsonArray = new JSONArray();
			for (Shopcar shopcar : shopcarList) {
				JSONObject jsonObject = new JSONObject();
				jsonObject.accumulate("id", shopcar.getId());
				jsonObject.accumulate("kc_name", shopcar.getKcgl().getName());
				jsonObject.accumulate("user_name", shopcar.getUser().getName());
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
		ShopcarAction.pageInfo = pageInfo;
	}

	public List<Shopcar> getShopcarList() {
		return shopcarList;
	}

	public void setShopcarList(List<Shopcar> shopcarList) {
		this.shopcarList = shopcarList;
	}

	public Shopcar getShopcar() {
		return shopcar;
	}

	public void setShopcar(Shopcar shopcar) {
		this.shopcar = shopcar;
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
