package ib.shopcar.model;

import java.util.Date;

import ib.kcgl.model.Kcgl;
import ib.user.model.User;

public class Shopcar {
	private int id;//  int(11) NOT NULL AUTO_INCREMENT ,
	private Kcgl kcgl;//  int(11) NULL DEFAULT NULL ,
	private User user;//  int(11) NULL DEFAULT NULL ,
	private int count;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Kcgl getKcgl() {
		return kcgl;
	}
	public void setKcgl(Kcgl kcgl) {
		this.kcgl = kcgl;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
