package ib.shopcar.service;

import ib.common.BaseService;
import ib.shopcar.dao.ShopcarDao;
import ib.shopcar.model.Shopcar;

import java.util.List;

public class ShopcarService extends BaseService {
    
	private ShopcarDao shopcarDao;
	
	/**
	 * 按条件查询
	 * @param sqlCondition
	 * @return
	 */
    public List<Shopcar> findListShopcarBycondition(String sqlCondition) {
    	
		return shopcarDao.findListShopcarBycondition(sqlCondition);
	}
    /**
     * ID查询
     * @param id
     * @return
     */
    public Shopcar findShopcarById(int id) {
		
		return shopcarDao.findShopcarById(id);
	}

    /**
     * 保存或者修改
     * @param Shopcar
     */
    public void saveOrupdateShopcar(Shopcar shopcar) {
		
    	shopcarDao.saveOrupdateShopcar(shopcar);
	}
    
    /**
     * 删除
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
