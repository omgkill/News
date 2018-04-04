package com.jing.experiment.news.controller;


import com.jing.experiment.news.bean.NewsBean;
import com.jing.experiment.news.mapper.NewsMapper;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller("action")
public class Action {

	@Resource
	private NewsMapper newsMapper;
	
	public void aa(){
		newsMapper.queryNewsByCondition(new NewsBean());
	}
}
