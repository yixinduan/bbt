package ib.xwdt.service;

import ib.common.BaseService;
import ib.xwdt.dao.XwdtDao;
import ib.xwdt.model.Xwdt;

import java.util.List;

public class XwdtService extends BaseService {
    
	private XwdtDao xwdtDao;
	
	/**
	 * ��������ѯ
	 * @param sqlCondition
	 * @return
	 */
    public List<Xwdt> findListXwdtBycondition(String sqlCondition) {
    	
		return xwdtDao.findListXwdtBycondition(sqlCondition);
	}
    /**
     * ID��ѯ
     * @param id
     * @return
     */
    public Xwdt findXwdtById(int id) {
		
		return xwdtDao.findXwdtById(id);
	}

    /**
     * ��������޸�
     * @param xwdt
     */
    public void saveOrupdateXwdt(Xwdt xwdt) {
		
    	xwdtDao.saveOrupdateXwdt(xwdt);
	}
    
    /**
     * ɾ��
     * @param xwdt
     */
    public void deleteXwdt(Xwdt xwdt) {
		
    	xwdtDao.deleteXwdt(xwdt);
	}
    /**
     * ɾ��
     * @param xwdt
     */
    public void deleteXwdtMany(Xwdt xwdt) {
		
    	xwdtDao.deleteXwdtMany(xwdt);
	}
    
    
    
	public XwdtDao getXwdtDao() {
		return xwdtDao;
	}
	
	public void setXwdtDao(XwdtDao xwdtDao) {
		this.xwdtDao = xwdtDao;
	}
}
