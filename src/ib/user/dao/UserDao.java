package ib.user.dao;

import ib.user.model.User;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;


/**
 * �û��־ò�ʵ�ֽӿ�
 * @author quanmin
 *
 */
public class UserDao extends HibernateDaoSupport {
	/**
	  * ������ѯ
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
    * ID��ѯ
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
   * ��������޸�
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
    * ɾ��
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
