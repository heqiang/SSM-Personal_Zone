package com.hq.javaee.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hq.javaee.pojo.Friend;
import com.hq.javaee.service.FriendService;

@Controller
public class friendController {
	
		@Autowired
		private FriendService fs;
	
		@RequestMapping("addfriend")
		public String addfriend(Friend friend,Model  model){
			System.out.println(friend.getFriendname());
				String  res=fs.addfriend(friend);
				
				if("success".equals(res)){
					model.addAttribute("message",res);
					return "addfriend";
				}else{
					model.addAttribute("message",res);
					return "addfriend";
				}
		}
		
}
