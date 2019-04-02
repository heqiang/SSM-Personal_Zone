package com.hq.javaee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.hq.javaee.pojo.Comment;
import com.hq.javaee.service.CommentService;

@RestController
public class CommentController {

	@Autowired
	private CommentService  cs;
	@RequestMapping("comment")
	@ResponseBody
	public String comment(Comment comment,Model model){
			String  res=cs.insert(comment);		
			if("ok".equals(res)){
				model.addAttribute("message",res);
				return res;
 			}else{
				model.addAttribute("message",res);
			return res;
 			}
	}
	
	@RequestMapping("delete")
	public String  delete(Comment comment,Model  model){
		String  res=cs.delete(comment);		
		if("ok".equals(res)){
			model.addAttribute("message",res);
			return res;
			}else{
			model.addAttribute("message",res);
		return res;
			}
	}
	
}