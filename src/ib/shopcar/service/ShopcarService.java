package ib.shopcar.service;

import ib.common.BaseService;
import ib.shopcar.dao.ShopcarDao;
import ib.shopcar.model.Shopcar;

import java.util.List;

public class ShopcarService extends BaseService {
    
	private ShopcarDao shopcarDao;
	
	/**
	 * ��������ѯ
	 * @param sqlCondition
	 * @return
	 */
    public List<Shopcar> findListShopcarBycondition(String sqlCondition) {
    	
		return shopcarDao.findListShopcarBycondition(sqlCondition);
	}
    /**
     * ID��ѯ
     * @param id
     * @return
     */
    public Shopcar findShopcarById(int id) {
		
		return shopcarDao.findShopcarById(id);
	}

    /**
     * ��������޸�
     * @param Shopcar
     */
    public void saveOrupdateShopcar(Shopcar shopcar) {
		
    	shopcarDao.saveOrupdateShopcar(shopcar);
	}
    
    /**
     * ɾ��
     * @param Shopcar
     */
    public void deleteShopcar(Shopcar shopcar) {
		
    	shopcarDao.deleteShopcar(shopcar);
	}
    public void deleteShopcarMany(Shopcar shopcar) {
		
    	shopcarDao.deleteShopcarMany(shopcar);
	}
    
	public ShopcarDao getShopcarDao() {
		return shopcarDao;
	}
	public void setShopcarDao(ShopcarDao shopcarDao) {
		this.shopcarDao = shopcarDao;
	}
    
    
}
