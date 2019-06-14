package ib.kcgl.model;

import ib.kcly.model.Kcly;
import ib.shopcar.model.Shopcar;

public class Kcgl {

	private int id;//  int(11) NOT NULL AUTO_INCREMENT ,
	private String name;//  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '¿Î³ÌÃû³Æ' ,
	private String price1;//  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
	private String price;//  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL ,
	private String descs;//  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
	private String img;//  longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL ,
	
	private Kcly kcly;
	
	private Shopcar shopcar;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice1() {
		return price1;
	}
	public void setPrice1(String price1) {
		this.price1 = price1;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getDescs() {
		return descs;
	}
	public void setDescs(String descs) {
		this.descs = descs;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Kcly getKcly() {
		return kcly;
	}
	public void setKcly(Kcly kcly) {
		this.kcly = kcly;
	}
	
	public Shopcar getShopcar() {
		return shopcar;
	}
	public void setShopcar(Shopcar shopcar) {
		this.shopcar = shopcar;
	}
	
}
