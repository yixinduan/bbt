package ib.user.service;

import ib.common.BaseService;
import ib.user.dao.UserDao;
import ib.user.model.User;

import java.util.List;



public class UserService extends BaseService {
	
	private UserDao userDao;
	
	
	/**
	 * 按条件查询
	 * @param sqlCondition
	 * @return
	 */
    public List<User> findListUserBycondition(String sqlCondition) {
    	
		return userDao.findListUserBycondition(sqlCondition);
	}
    /**
     * ID查询
     * @param id
     * @return
     */
    public User findUserById(int id) {
		
		return userDao.findUserById(id);
	}

    /**
     * 保存或者修改
     * @param user
     */
    public void saveOrupdateUser(User user) {
		
    	userDao.saveOrupdateUser(user);
	}
    
    /**
     * 删除
     * @param user
     */
    public void deleteUser(User user) {
		
    	userDao.deleteUser(user);
	}
	public UserDao getUserDao() {
		return userDao;
	}
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
    
    
}
