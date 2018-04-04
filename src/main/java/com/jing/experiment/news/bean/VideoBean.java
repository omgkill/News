package com.jing.experiment.news.bean;

import java.sql.Timestamp;

import org.apache.ibatis.type.Alias;

@Alias("video")
public class VideoBean {
	private int voideoid;
	private String videoaddress;
private Timestamp videotimestamp;
private String videotitle;
private String videopicturead;
private String videoauthorname;

public String getVideoauthorname() {
	return videoauthorname;
}
public void setVideoauthorname(String videoauthorname) {
	this.videoauthorname = videoauthorname;
}
public int getVoideoid() {
	return voideoid;
}
public void setVoideoid(int voideoid) {
	this.voideoid = voideoid;
}

public String getVideoaddress() {
	return videoaddress;
}
public void setVideoaddress(String videoaddress) {
	this.videoaddress = videoaddress;
}
public Timestamp getVideotimestamp() {
	return videotimestamp;
}
public void setVideotimestamp(Timestamp videotimestamp) {
	this.videotimestamp = videotimestamp;
}
public String getVideotitle() {
	return videotitle;
}
public void setVideotitle(String videotitle) {
	this.videotitle = videotitle;
}
public String getVideopicturead() {
	return videopicturead;
}
public void setVideopicturead(String videopicturead) {
	this.videopicturead = videopicturead;
}
	

}
