package ib.kcgl.dao;
import ib.kcgl.model.Kcgl;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


public class KcglDao extends HibernateDaoSupport {
	
	
	 /**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
    public List<Kcgl> findListKcglBycondition(String sqlCondition) {
    	
    	List<Kcgl> kcglList = null;
    	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM Kcgl where 1=1 " + sqlCondition);
			kcglList = (List<Kcgl>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return kcglList;
	}
    
    /**
     * ID查询
     * @param id
     * @return
     */
    public Kcgl findKcglById(int id) {
    	Session session = null;
    	Kcgl kcgl = null;
    	try {
    		session = this.getSession();
    		kcgl = (Kcgl) session.get(Kcgl.class, id);
    		session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return kcgl;
	}
    
	
   /**
    * 保存或者修改
    * @param kcgl
    */
    public void saveOrupdateKcgl(Kcgl kcgl) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(kcgl);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param kcgl
     */
    public void deleteKcgl(Kcgl kcgl) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.delete(kcgl);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
