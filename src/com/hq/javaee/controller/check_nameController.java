package com.hq.javaee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hq.javaee.pojo.Friend;
import com.hq.javaee.pojo.User;
import com.hq.javaee.service.FriendService;
import com.hq.javaee.service.UserService;

@RestController
public class check_nameController {
	@Autowired
	private UserService us;
	@Autowired  
	private FriendService  fs;
	
	@RequestMapping("/check")
	@ResponseBody
	public String  check(String username,Model  model){
		  System.out.println(username);
		String  result=us.find(username);
		System.out.println("结果是："+result);
		if("success".equals(result)){
			model.addAttribute("message","success");
			System.out.println("成功了");
			return result;
			}else{
				model.addAttribute("message","false");
				System.out.println("失败了");
				return result;
			
				
			}
		
	}
	@RequestMapping("insertmessage")
	@ResponseBody
	public String  insertmessage(User  user){
		String  res=us.updateuserid(user);
		if("ok".equals(res)){
			System.out.println("插入成功了啊");
		}else{
			System.out.println("插入失败了");
		}
		return res;
		
	}

	
	@RequestMapping("check_friendname")
	@ResponseBody
	public String  checkfriendname(Friend friend,Model  model){
		
		Map<String,Object> map=fs.select(friend);
		System.out.println(friend.getFriendname()+"昵称");
		if(map!=null&&!map.isEmpty()){
			String  res=map.get("result").toString();
			if("success".equals(res)){
					return res;
			}else{
				return res;
			}
		}else{
			return "network";
		}
		
	}
			
	

	
		
}
