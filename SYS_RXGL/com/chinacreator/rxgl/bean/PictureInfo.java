package com.chinacreator.rxgl.bean;

import com.chinacreator.common.bean.BaseValue;

public class PictureInfo extends BaseValue {

	private static final long serialVersionUID = 4140571551674865604L;

	/**
	 * 图像ID
	 */
	private String pic_id;
	
	/**
	 * 起点坐标
	 */
	private int x;
	
	private int y;
	
	/**
	 * 尺寸
	 */
	private int width;
	
	private int height;

	public String getPic_id() {
		return pic_id;
	}

	public void setPic_id(String pic_id) {
		this.pic_id = pic_id;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}
}
