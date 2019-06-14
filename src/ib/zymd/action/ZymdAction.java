package ib.zymd.action;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.math.NumberUtils;
import org.aspectj.util.FileUtil;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.context.ApplicationContext;
import ib.common.BaseAction;
import ib.common.Pageinfo;
import ib.common.SpringContextHolder;
import ib.zymd.model.Zymd;
import ib.zymd.service.ZymdService;

public class ZymdAction extends BaseAction {
	
	private static ApplicationContext applicationContext = SpringContextHolder.getApplicationContext();
	
	private ZymdService zymdService = (ZymdService) applicationContext.getBean("zymdService");
		
	private static Pageinfo pageInfo;
		
	private List<Zymd> zymdList;
	
	private Zymd zymd;
	
	private String condition;
	
	private String ids;
		
	
	/**
	 * 实体列表
	 * @return
	 */
	public String zymdList() {
		
		zymdList = zymdService.findListZymdBycondition(null);
		
		pageInfo = new Pageinfo();
		pageInfo.setPageSize(20);
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		pageInfo.setTotalRecords(zymdList.size());
		
		zymdList = zymdService.getOnePageList(zymdList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		return SUCCESS;
	}
	
	/**
	 * 实体列表
	 * @return
	 */
	public String zymdListBycondition() {
		
		String sqlCondition = "";
		if(condition!=null&&!condition.equals("")){
			sqlCondition = " AND (shopname like '%"+condition+"%')";
		}
		zymdList = zymdService.findListZymdBycondition(sqlCondition);
		
		pageInfo = pageInfo == null ? new Pageinfo() : pageInfo;
		pageInfo.setCurrentPage(pageInfo.getCurrentPage() == 0 ? 1 : pageInfo.getCurrentPage());
		
		pageInfo.setTotalRecords(zymdList.size());
		pageInfo.setPageSize(pageInfo.getPageSize());
		
		zymdList = zymdService.getOnePageList(zymdList, pageInfo.getCurrentPage(), pageInfo.getPageSize()); // 用于分页后的列表查询
		
		
		
		return SUCCESS;
	}
	
	/**
	 * 查看或者修改实体
	 * @return
	 */
	public String zymdEdit() {
		
		if(zymd!=null&&zymd.getId()!=0){
			zymd = zymdService.findZymdById(zymd.getId());
			
		}else{
			zymd = new Zymd();
		}
		
		
		return SUCCESS;
	}
	
	/**
	 * 验证重复
	 */
	public void zymdByRepetition() {
		try {
			JSONObject jsonObject = new JSONObject();
			boolean flag = false;
			if(zymd!=null&&zymd.getShopname()!=null&&!zymd.getShopname().equals("")){
				String sql = " AND shopname ='"+zymd.getShopname()+"'";
	    		List<Zymd> list = zymdService.findListZymdBycondition(sql);
	    		if(list==null||list.isEmpty()){
	        		flag = true;
	        	}else if(list.size()>1){
	        		flag = false;
	        	}else{
	        		if(zymd.getId()==list.get(0).getId()){
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
	public String zymdSave(){
		
		if(zymd!=null){
			//zymd.setTime(new Date());
			zymdService.saveOrupdateZymd(zymd);
		}
		return SUCCESS;
	}
	
	/**
	 * 删除实体
	 * @return
	 */
	public String zymdDel() {
		
		zymd = zymdService.findZymdById(zymd.getId());
		if(zymd!=null){
			zymdService.deleteZymd(zymd);	
		}
		return SUCCESS;
	}
	
	/**
	 * 删除多个
	 * @return
	 */
	public String zymdAllDel(){
		zymdList = new ArrayList<Zymd>();
		if(ids!=null&&!ids.equals("")){
			String[] idArray = ids.split(",");
			for (String string : idArray) {
				Zymd entry = new Zymd();
				if(NumberUtils.isNumber(string)){
					entry.setId(NumberUtils.toInt(string));
					zymdService.deleteZymd(entry);
				}
				
			}
		}
		return SUCCESS;
	}
	
	public Pageinfo getPageInfo() {
		return pageInfo;
	}

	public  void setPageInfo(Pageinfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	public List<Zymd> getZymdList() {
		return zymdList;
	}

	public void setZymdList(List<Zymd> zymdList) {
		this.zymdList = zymdList;
	}

	public Zymd getZymd() {
		return zymd;
	}

	public void setZymd(Zymd zymd) {
		this.zymd = zymd;
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
