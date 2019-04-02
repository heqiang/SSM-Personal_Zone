package com.hq.javaee.service.impl;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hq.javaee.mapper.MessageMapper;
import com.hq.javaee.mapper.UserMapper;
import com.hq.javaee.pojo.Message;
import com.hq.javaee.pojo.User;
import com.hq.javaee.service.MessageService;
import com.hq.javaee.utils.UUIDUtils;

@Service
public class MessageServiceimpl  implements  MessageService {

	@Autowired
	private  MessageMapper mm;
	@Autowired
	private  UserMapper  um;

	@Override
	public String insertmessage(Message message) {
		String  result="";
		message.setMessageid(UUIDUtils.getNumUUID());
		message.setPosttime(new Date());
		
		
		int  result1=mm.insertSelective(message);
		if(result1>0){
			result="success";
		}else{
			result="fail";
		}
	 return	result;
	}

	





//	@Override
//	public List<Message> insertmessage(Message message) {
//			Map<String,Object> map=new HashMap<>();
//			message.setMessageid(UUIDUtils.getNumUUID());
//			message.setPosttime(new Date());
//			int   result=mm.insertSelective(message);
//			if(result>0){
//				Message  _message=mm.selectBypostid(message.getPostid());
//				if(_message!=null){
//					map.put("result", "success");
//					map.put("message", _message);
//				}else{
//					map.put("result", "_message is  null");
//				}
//				
//			}else{
//				map.put("result", "fail");
//			}
//			return map;
//	}
//	
	
	
}
