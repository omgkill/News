package com.jing.experiment.news.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class JumpPageController {

	@RequestMapping("/abcd")
	public String indexToFirst(){
		
		return "first";
	}
}
