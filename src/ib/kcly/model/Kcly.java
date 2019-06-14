package ib.kcly.model;

import java.util.Date;
import ib.kcgl.model.Kcgl;
import ib.user.model.User;

public class Kcly {
	private int id;//  int(11) NOT NULL AUTO_INCREMENT ,
	private Kcgl kcgl;//  int(11) NULL DEFAULT NULL ,
	private User user;//  int(11) NULL DEFAULT NULL ,
	private String content;//  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'ÆÀÂÛ' ,
	private String reply;//  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '»Ø¸´' ,
	private Date time;	
	private Date replytime;
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
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Date getReplytime() {
		return replytime;
	}
	public void setReplytime(Date replytime) {
		this.replytime = replytime;
	}
}
