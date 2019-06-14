package ib.zymd.dao;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import ib.zymd.model.Zymd;
public class ZymdDao extends HibernateDaoSupport {
	
	
	 /**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
    public List<Zymd> findListZymdBycondition(String sqlCondition) {
    	
    	List<Zymd> zymdList = null;
    	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM Zymd zymd where 1=1 " + sqlCondition);
			zymdList = (List<Zymd>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return zymdList;
	}
    
    /**
     * ID查询
     * @param id
     * @return
     */
    public Zymd findZymdById(int id) {
    	Session session = null;
    	Zymd zymd = null;
    	try {
    		session = this.getSession();
    		zymd = (Zymd) session.get(Zymd.class, id);
    		session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return zymd;
	}
    
	
   /**
    * 保存或者修改
    * @param zymd
    */
    public void saveOrupdateZymd(Zymd zymd) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(zymd);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
    
    /**
     * 删除
     * @param zymd
     */
    public void deleteZymd(Zymd zymd) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.delete(zymd);
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
