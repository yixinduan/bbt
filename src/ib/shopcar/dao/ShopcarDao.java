package ib.shopcar.dao;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ib.shopcar.model.Shopcar;


public class ShopcarDao extends HibernateDaoSupport {
	
	
	 /**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
    public List<Shopcar> findListShopcarBycondition(String sqlCondition) {
    	
    	List<Shopcar> shopcarList = null;
    	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM Shopcar shopcar where 1=1 " + sqlCondition);
			shopcarList = (List<Shopcar>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return shopcarList;
	}
    
    /**
     * ID查询
     * @param id
     * @return
     */
    public Shopcar findShopcarById(int id) {
    	Session session = null;
    	Shopcar shopcar = null;
    	try {
    		session = this.getSession();
    		shopcar = (Shopcar) session.get(Shopcar.class, id);
    		session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return shopcar;
	}
    
	
   /**
    * 保存或者修改
    * @param Shopcar
    */
    public void saveOrupdateShopcar(Shopcar shopcar) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(shopcar);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param Shopcar
     */
    public void deleteShopcar(Shopcar shopcar) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.delete(shopcar);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param Shopcar
     */
    public void deleteShopcarMany(Shopcar shopcar) {
    	Session session = null;
    	try {
	    	session = this.getSession();	   
	    	
	    	List<Shopcar> list = new ArrayList<Shopcar>();
	    	
	    	if(shopcar.getUser()!=null&&shopcar.getUser().getId()!=0) {
	    		list = this.findListShopcarBycondition(" and shopcar.user.id="+shopcar.getUser().getId());
	    	}else if(shopcar.getKcgl()!=null&&shopcar.getKcgl().getId()!=0) {
	    		
	    		list = this.findListShopcarBycondition(" and shopcar.kcgl.id="+shopcar.getKcgl().getId());
	    	}
	    	for (Shopcar shopcar2 : list) {
	    		session.delete(shopcar2);
			}
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
