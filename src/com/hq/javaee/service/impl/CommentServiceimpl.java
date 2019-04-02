package com.hq.javaee.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hq.javaee.mapper.CommentMapper;
import com.hq.javaee.pojo.Comment;
import com.hq.javaee.service.CommentService;
import com.hq.javaee.utils.UUIDUtils;

@Service
public class CommentServiceimpl implements  CommentService {
	
	@Autowired
	private CommentMapper cm;

	@Override
	public String insert(Comment comment) {
		String  res="";
		comment.setCommentid(UUIDUtils.getNumUUID());
		comment.setCommenttime(new Date());
		int  cs=cm.insertBycomment(comment);
		if(cs>0){
			res="ok";
		}else{
			res="not ok ";
		}
		return  res;
	}

	@Override
	public String delete(Comment comment) {
			String  res="";
			int  result=cm.deleteByPrimaryKey(comment.getCommentid());
			if(result>0){
				res="ok";
			}else{
				res="fail";
			}
			return res;
			
	}

}
