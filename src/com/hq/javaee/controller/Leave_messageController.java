package com.hq.javaee.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hq.javaee.pojo.Leave_message;
import com.hq.javaee.service.leave_messageService;

@Controller
public class Leave_messageController {

	@Autowired
	private  leave_messageService ls;
	
	@RequestMapping("leavemessage")
	public String  leave(Leave_message leave,Model model){
		System.out.println(leave.getLeavemessagecontent()+""+leave.getUserid());
		
		String  result=ls.insert(leave);
		if("success".equals(result)){
				model.addAttribute("message",result);
				return "MessageBoard";
		}else{
			model.addAttribute("message",result);
			return "MessageBoard";
		}
			
	}
	@RequestMapping("personalleavemessage")
	public String  leavemessage(Leave_message leave,Model model ){
		System.out.println("开始留言了哈");
		String  res=ls.insertmessage(leave);
		System.out.println(leave.getLeavemessagepersonid());
		if("ok".equals(res)){
			model.addAttribute("message",res);
				return  "friend_leave_message";
		}else{
			model.addAttribute("message",res);
			System.out.println("fail leavemessage");
			return "friend_leave_message";
		}
		
		
	}
	@RequestMapping("aboutme")
	public String  aboutme(Leave_message leave,Model model){
		System.out.println(leave.getUserid());
			Map<String,Object> map=ls.selectall(leave);
				if(map!=null&&!map.isEmpty()){
				  String	 result=map.get("result").toString();
				  if("success".equals(result)){
					  	Leave_message  message=(Leave_message) map.get("message");
					  	model.addAttribute("messages",message);
					  	return "aboutme";
				  }else{
					  model.addAttribute("message","还没有你的留言哦");
					  return "aboutme";
				  }
				}else{
					model.addAttribute("message","network");
					return "aboutme";
				}
				
			
			}
	
	@RequestMapping("deleteleave_message")
	 public String  delete(Leave_message leave,Model model){
		String  res=ls.delete(leave);
		if("ok".equals(res)){
			model.addAttribute("mes","删除成功");
			return "aboutme";
		}else{
			model.addAttribute("mes","删除失败");
			return "aboutme";
		}
	}
	
	
}
