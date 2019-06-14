package ib.zymd.service;

import java.util.List;
import ib.common.BaseService;
import ib.zymd.dao.ZymdDao;
import ib.zymd.model.Zymd;

public class ZymdService extends BaseService {
    
	private ZymdDao zymdDao;
	
	/**
	 * 按条件查询
	 * @param sqlCondition
	 * @return
	 */
    public List<Zymd> findListZymdBycondition(String sqlCondition) {
    	
		return zymdDao.findListZymdBycondition(sqlCondition);
	}
    /**
     * ID查询
     * @param id
     * @return
     */
    public Zymd findZymdById(int id) {
		
		return zymdDao.findZymdById(id);
	}

    /**
     * 保存或者修改
     * @param zymd
     */
    public void saveOrupdateZymd(Zymd zymd) {
		
    	zymdDao.saveOrupdateZymd(zymd);
	}
    
    /**
     * 删除
     * @param zymd
     */
    public void deleteZymd(Zymd zymd) {
		
    	zymdDao.deleteZymd(zymd);
	}
	public ZymdDao getZymdDao() {
		return zymdDao;
	}
	public void setZymdDao(ZymdDao zymdDao) {
		this.zymdDao = zymdDao;
	}
    
    
    
}
