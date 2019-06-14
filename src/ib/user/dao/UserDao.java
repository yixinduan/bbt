package ib.user.dao;

import ib.user.model.User;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


/**
 * 用户持久层实现接口
 * @author quanmin
 *
 */
public class UserDao extends HibernateDaoSupport {
	/**
	  * 条件查询
	  * @param sqlCondition
	  * @return
	  */
   public List<User> findListUserBycondition(String sqlCondition) {
   	
   	List<User> userList = null;
   	Session session = null;
		try {
			if (sqlCondition == null) {
				sqlCondition = "";
			}
			session = this.getSession();
			Query query = session.createQuery("FROM User where 1=1 " + sqlCondition);
			userList = (List<User>) query.list();
			session.flush();
		} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return userList;
	}
   
   /**
    * ID查询
    * @param id
    * @return
    */
   public User findUserById(int id) {
   	Session session = null;
   	User user = null;
   	try {
   		session = this.getSession();
   		user = (User) session.get(User.class, id);
   		session.flush();
   	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
		return user;
	}
   
	
  /**
   * 保存或者修改
   * @param user
   */
   public void saveOrupdateUser(User user) {
   	Session session = null;
   	try {
	    	session = this.getSession();
	    	session.saveOrUpdate(user);
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
   public void deleteUser(User user) {
   	Session session = null;
   	try {
	    	session = this.getSession();
	    	session.delete(user);
	    	session.flush();
   	} catch (Exception e) {
			e.fillInStackTrace();
		}finally {
			releaseSession(session);
		}
	}
}
