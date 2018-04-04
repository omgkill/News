package com.jing.experiment.news.bean;

import org.apache.ibatis.type.Alias;

@Alias("picture")
public class PictureBean {
	private int pictureid;
	private String pictureadress;

	public int getPictureid() {
		return pictureid;
	}

	public void setPictureid(int pictureid) {
		this.pictureid = pictureid;
	}

	public String getPictureadress() {
		return pictureadress;
	}

	public void setPictureadress(String pictureadress) {
		this.pictureadress = pictureadress;
	}

}
