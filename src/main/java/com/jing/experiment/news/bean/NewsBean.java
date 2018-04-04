package com.jing.experiment.news.bean;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.persistence.Column;
import javax.persistence.Embedded;
import javax.persistence.Id;
import javax.persistence.OrderBy;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.ibatis.type.Alias;
import org.springframework.util.StringUtils;

import net.sf.json.JSON;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

@Alias("news")
@Table(name = "news")
public class NewsBean implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	private int id;
	@Column
	private String title;
	@Column
	@OrderBy(" desc")
	private Timestamp time;
	@Column
	private String content;
	@Column
	private String keywords;
	@Column
	private int categoryid;
	@Column
	private String pictureaddress;
	@Column
	private String videoaddress;
	@Column
	private String authorname;
	@Transient
	private int pageSize;
	@Transient
	private int offset;
	@Transient
	private String sort;
	@Transient
	private String sortOrder;

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



	public Timestamp getTime() {
		return time;
	}

	public void setTime(Timestamp time) {
		this.time = time;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public int getCategoryid() {
		return categoryid;
	}

	public void setCategoryid(int categoryid) {
		this.categoryid = categoryid;
	}

	

	public String getPictureaddress() {
		return pictureaddress;
	}

	public void setPictureaddress(String pictureaddress) {
		this.pictureaddress = pictureaddress;
	}

	public String getVideoaddress() {
		return videoaddress;
	}

	public void setVideoaddress(String videoaddress) {
		this.videoaddress = videoaddress;
	}

	public String getAuthorname() {
		return authorname;
	}

	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}

	public String toString(){
	
		return JSONObject.fromObject(this).toString();
	}

	public int getOffset() {
		return offset;
	}

	public void setOffset(int offset) {
		this.offset = offset;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(String sortOrder) {
		this.sortOrder = sortOrder;
	}
	
	




}
