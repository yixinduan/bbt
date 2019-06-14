package ib.kcly.dao;
import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import ib.kcly.model.Kcly;


public class KclyDao extends HibernateDaoSupport {
	
	
	 /**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
    public List<Kcly> findListKclyBycondition(String sqlCondition) {
    	
    	List<Kcly> kclyList = null;
    	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM Kcly kcly where 1=1 " + sqlCondition);
			kclyList = (List<Kcly>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return kclyList;
	}
    
    /**
     * ID查询
     * @param id
     * @return
     */
    public Kcly findKclyById(int id) {
    	Session session = null;
    	Kcly kcly = null;
    	try {
    		session = this.getSession();
    		kcly = (Kcly) session.get(Kcly.class, id);
    		session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return kcly;
	}
    
	
   /**
    * 保存或者修改
    * @param kcly
    */
    public void saveOrupdateKcly(Kcly kcly) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(kcly);
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
    public void deleteKcly(Kcly kcly) {
    	Session session = null;
    	try {
	    	session = this.getSession();
	    	session.delete(kcly);
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
    public void deleteKclyMany(Kcly kcly) {
    	Session session = null;
    	try {
	    	session = this.getSession();	   
	    	
	    	List<Kcly> list = new ArrayList<Kcly>();
	    	
	    	if(kcly.getUser()!=null&&kcly.getUser().getId()!=0) {
	    		list = this.findListKclyBycondition(" and kcly.user.id="+kcly.getUser().getId());
	    	}else if(kcly.getKcgl()!=null&&kcly.getKcgl().getId()!=0) {
	    		
	    		list = this.findListKclyBycondition(" and kcly.kcgl.id="+kcly.getKcgl().getId());
	    	}
	    	for (Kcly kcly2 : list) {
	    		session.delete(kcly2);
			}
	    	session.flush();
    	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
