package com.hq.javaee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hq.javaee.pojo.Replay;
import com.hq.javaee.service.ReplayService;

@RestController
public class ReplayController {
		@Autowired
		private  ReplayService  rs;
		
		@RequestMapping("replay")
		public  String  replay(Replay replay,Model  model){
			String res=	rs.insert(replay);
			if("ok".equals(res)){
				System.out.println("回复成功");
			}else{
				System.out.println("回复失败");
			}
			return res;
		}
}
