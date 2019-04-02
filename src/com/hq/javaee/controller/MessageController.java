package com.hq.javaee.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.hq.javaee.pojo.Message;
import com.hq.javaee.pojo.User;
import com.hq.javaee.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private   MessageService  ms;
	
	@RequestMapping("postmessage")
	public String postmessage(Message message,HttpSession session,Model model){
			User  user=(User) session.getAttribute("user");
			
			String  result=ms.insertmessage(message);
			if("success".equals(result)){
				model.addAttribute("message",result);
				return "postmessage";
			}else{
				model.addAttribute("message",result);
				return  "postmessage";
			}
	
	
	}
}