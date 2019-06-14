package ib.kcly.service;

import ib.common.BaseService;
import ib.kcly.dao.KclyDao;
import ib.kcly.model.Kcly;

import java.util.List;

public class KclyService extends BaseService {
    
	private KclyDao kclyDao;
	
	/**
	 * 按条件查询
	 * @param sqlCondition
	 * @return
	 */
    public List<Kcly> findListKclyBycondition(String sqlCondition) {
    	
		return kclyDao.findListKclyBycondition(sqlCondition);
	}
    /**
     * ID查询
     * @param id
     * @return
     */
    public Kcly findKclyById(int id) {
		
		return kclyDao.findKclyById(id);
	}

    /**
     * 保存或者修改
     * @param kcly
     */
    public void saveOrupdateKcly(Kcly kcly) {
		
    	kclyDao.saveOrupdateKcly(kcly);
	}
    
    /**
     * 删除
     * @param kcly
     */
    public void deleteKcly(Kcly kcly) {
		
    	kclyDao.deleteKcly(kcly);
	}
    public void deleteKclyMany(Kcly kcly) {
		
    	kclyDao.deleteKclyMany(kcly);
	}
    
	public KclyDao getKclyDao() {
		return kclyDao;
	}
	public void setKclyDao(KclyDao kclyDao) {
		this.kclyDao = kclyDao;
	}
    
    
}
