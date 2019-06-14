package ib.kcgl.service;

import ib.common.BaseService;
import ib.kcgl.dao.KcglDao;
import ib.kcgl.model.Kcgl;

import java.util.List;

public class KcglService extends BaseService {
    
	private KcglDao kcglDao;
	
	/**
	 * ��������ѯ
	 * @param sqlCondition
	 * @return
	 */
    public List<Kcgl> findListKcglBycondition(String sqlCondition) {
    	
		return kcglDao.findListKcglBycondition(sqlCondition);
	}
    /**
     * ID��ѯ
     * @param id
     * @return
     */
    public Kcgl findKcglById(int id) {
		
		return kcglDao.findKcglById(id);
	}

    /**
     * ��������޸�
     * @param kcgl
     */
    public void saveOrupdateKcgl(Kcgl kcgl) {
		
    	kcglDao.saveOrupdateKcgl(kcgl);
	}
    
    /**
     * ɾ��
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
