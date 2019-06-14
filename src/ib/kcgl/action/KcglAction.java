package ib.kcgl.action;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.kcgl.model.Kcgl;
import ib.kcgl.service.KcglService;
import ib.kcly.model.Kcly;
import ib.kcly.service.KclyService;
import ib.shopcar.model.Shopcar;
import ib.shopcar.service.ShopcarService;

import java.util.ArrayList;
import java.util.List;
import net.sf.json.JSONObject;
import org.springframework.context.ApplicationContext;

public class KcglAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private KcglService kcglService = (KcglService) applicationContext.getBean("kcglService");
	
	private static Pageinfo pageInfo;
		
	private List<Kcgl> kcglList;
	
	private Kcgl kcgl;
	
	private String condition;
	
	private KclyService kclyService = (KclyService) applicationContext.getBean("kclyService");
	
	private List<Kcly> kclyList;
	
	private ShopcarService shopcarService = (ShopcarService) applicationContext.getBean("shopcarService");
	
	private List<Shopcar> shopcarList;
	
	private int activeFlag;

	
	/**
	 * 实体列表
	 * @return
	 */
	public String kcglList() {
		
		kcglList = kcglService.findListKcglBycondition(null);
		
		if(kcglList==null) {
			kcglList = new ArrayList<Kcgl>();
		}
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(10);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(kcglList.size());
		
		kcglList = kcglService.getOnePageList(kcglList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String kcglListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (name like '%"+condition+"%')";
		}

		kcglList = kcglService.findListKcglBycondition(sqlCondition);
		if(kcglList==null) {
			kcglList = new ArrayList<Kcgl>();
		}
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(kcglList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		if(kcglList!=null){
			int count = pageInfo.getCurrentPage()-1;
			float sizeCount = (float) ((kcglList.size()+0.0)/pageInfo.getPageSize());
			if(sizeCount<=count){
				pageInfo.setCurrentPage(pageInfo.getCurrentPage()-1);
			}
		}
		if(pageInfo.getCurrentPage()<=0){
			pageInfo.setCurrentPage(1);
		}
		
		kcglList = kcglService.getOnePageList(kcglList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String kcglEdit() {
		
		if(kcgl!=null&&kcgl.getId()!=0){
			kcgl = kcglService.findKcglById(kcgl.getId());
			
			String sqlCondition = " AND (kcgl.id="+kcgl.getId()+")";
			
			kclyList = kclyService.findListKclyBycondition(sqlCondition);
			
			
		}else{
			kcgl = new Kcgl();
		}
		return SUCCESS;
	}
	
	/**
	 * 验证重复
	 */
	public void kcglByRepetition() {
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			if(kcgl!=null&&kcgl.getName()!=null&&!kcgl.getName().equals("")){
				String sql = " AND name='"+kcgl.getName()+"'";
	    		List<Kcgl> list = kcglService.findListKcglBycondition(sql);
	    		if(list==null||list.isEmpty()){
	        		flag = true;
	        	}else if(list.size()>1){
	        		flag = false;
	        	}else{
	        		if(kcgl.getId()==list.get(0).getId()){
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
	public String kcglSave(){
		
		if(kcgl!=null){
			kcglService.saveOrupdateKcgl(kcgl);
		}
		return SUCCESS;
	}
	
	/**
	 * 删除实体
	 * @return
	 */
	public String kcglDel() {
		
		kcgl = kcglService.findKcglById(kcgl.getId());
		if(kcgl!=null){
			/**/
			Kcly kcly = new Kcly();
			kcly.setKcgl(kcgl);
			kclyService.deleteKclyMany(kcly);
			
			Shopcar shopcar = new Shopcar();
			shopcar.setKcgl(kcgl);
			shopcarService.deleteShopcarMany(shopcar);
			
			kcglService.deleteKcgl(kcgl);	
			
			
		}
		return SUCCESS;
	}
	
	public Pageinfo getPageInfo() {
		return pageInfo;
	}

	public  void setPageInfo(Pageinfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Kcgl> getKcglList() {
		return kcglList;
	}

	public void setKcglList(List<Kcgl> kcglList) {
		this.kcglList = kcglList;
	}

	public Kcgl getKcgl() {
		return kcgl;
	}

	public void setKcgl(Kcgl kcgl) {
		this.kcgl = kcgl;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public List<Kcly> getKclyList() {
		return kclyList;
	}

	public void setKclyList(List<Kcly> kclyList) {
		this.kclyList = kclyList;
	}

	public List<Shopcar> getShopcarList() {
		return shopcarList;
	}

	public void setshopcarList(List<Shopcar> shopcarList) {
		this.shopcarList = shopcarList;
	}
	
	public int getActiveFlag() {
		return activeFlag;
	}

	public void setActiveFlag(int activeFlag) {
		this.activeFlag = activeFlag;
	}


	
}
