package ib.kcly.service;

import ib.common.BaseService;
import ib.kcly.dao.KclyDao;
import ib.kcly.model.Kcly;

import java.util.List;

public class KclyService extends BaseService {
    
	private KclyDao kclyDao;
	
	/**
	 * ��������ѯ
	 * @param sqlCondition
	 * @return
	 */
    public List<Kcly> findListKclyBycondition(String sqlCondition) {
    	
		return kclyDao.findListKclyBycondition(sqlCondition);
	}
    /**
     * ID��ѯ
     * @param id
     * @return
     */
    public Kcly findKclyById(int id) {
		
		return kclyDao.findKclyById(id);
	}

    /**
     * ��������޸�
     * @param kcly
     */
    public void saveOrupdateKcly(Kcly kcly) {
		
    	kclyDao.saveOrupdateKcly(kcly);
	}
    
    /**
     * ɾ��
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
