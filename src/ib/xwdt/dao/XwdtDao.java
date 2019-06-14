package ib.xwdt.dao;
import ib.kcly.model.Kcly;
import ib.xwdt.model.Xwdt;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class XwdtDao extends HibernateDaoSupport {
	
	
	 /**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
    public List<Xwdt> findListXwdtBycondition(String sqlCondition) {
    	
    	List<Xwdt> xwdtList = null;
    	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM Xwdt xwdt where 1=1 " + sqlCondition);
			xwdtList = (List<Xwdt>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return xwdtList;
	}
    
    /**
     * ID查询
     * @param id
     * @return
     */
    public Xwdt findXwdtById(int id) {
    	Session session = null;
    	Xwdt xwdt = null;
    	try {
    		session = this.getSession();
    		xwdt = (Xwdt) session.get(Xwdt.class, id);
    		session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return xwdt;
	}
    
	
   /**
    * 保存或者修改
    * @param xwdt
    */
    public void saveOrupdateXwdt(Xwdt xwdt) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(xwdt);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param Accountreg
     */
    public void deleteXwdt(Xwdt xwdt) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.delete(xwdt);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param kcly
     */
    public void deleteXwdtMany(Xwdt xwdt) {
    	Session session = null;
    	try {
	    	session = this.getSession();	   

	    	List<Xwdt> list = this.findListXwdtBycondition(" and xwdt.user.id=" + xwdt.getUser().getId());

	    	for (Xwdt xwdt2 : list) {
	    		session.delete(xwdt2);
			}
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
