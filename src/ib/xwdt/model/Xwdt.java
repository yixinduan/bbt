package ib.xwdt.model;

import java.util.Date;

import ib.user.model.User;

public class Xwdt {

	private int id;//  int(11) NOT NULL AUTO_INCREMENT ,
	private String title;//  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '新闻标题' ,
	private String content;//  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
	private Date time;//  date NULL DEFAULT NULL COMMENT '发布日期' ,
	private User user;//  int(11) NULL DEFAULT NULL COMMENT '创建者id' ,
	private int count;//  int(11) NULL DEFAULT NULL COMMENT '浏览量' ,
	private String img;//  text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '图片' ,
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	
}
