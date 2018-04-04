package com.jing.experiment.news.bean;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("commentShow")
public class CommentBeanShow {
int id;
String commentcontent;
Timestamp commenttime;
String username;
int commentnewsid;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getCommentcontent() {
	return commentcontent;
}
public void setCommentcontent(String commentcontent) {
	this.commentcontent = commentcontent;
}

public Timestamp getCommenttime() {
	return commenttime;
}
public void setCommenttime(Timestamp commenttime) {
	this.commenttime = commenttime;
}

public String getUsername() {
	return username;
}
public void setUsername(String username) {
	this.username = username;
}
public int getCommentnewsid() {
	return commentnewsid;
}
public void setCommentnewsid(int commentnewsid) {
	this.commentnewsid = commentnewsid;
}

}
