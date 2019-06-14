package ib.kcgl.service;

import ib.common.BaseService;
import ib.kcgl.dao.KcglDao;
import ib.kcgl.model.Kcgl;

import java.util.List;

public class KcglService extends BaseService {
    
	private KcglDao kcglDao;
	
	/**
	 * 按条件查询
	 * @param sqlCondition
	 * @return
	 */
    public List<Kcgl> findListKcglBycondition(String sqlCondition) {
    	
		return kcglDao.findListKcglBycondition(sqlCondition);
	}
    /**
     * ID查询
     * @param id
     * @return
     */
    public Kcgl findKcglById(int id) {
		
		return kcglDao.findKcglById(id);
	}

    /**
     * 保存或者修改
     * @param kcgl
     */
    public void saveOrupdateKcgl(Kcgl kcgl) {
		
    	kcglDao.saveOrupdateKcgl(kcgl);
	}
    
    /**
     * 删除
     * @param kcgl
     */
    public void deleteKcgl(Kcgl kcgl) {
		
    	kcglDao.deleteKcgl(kcgl);
	}
    
    
	public KcglDao getKcglDao() {
		return kcglDao;
	}
	public void setKcglDao(KcglDao kcglDao) {
		this.kcglDao = kcglDao;
	}
}
