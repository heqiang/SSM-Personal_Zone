package com.hq.javaee.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hq.javaee.mapper.Leave_messageMapper;
import com.hq.javaee.pojo.Leave_message;
import com.hq.javaee.service.leave_messageService;
import com.hq.javaee.utils.UUIDUtils;

@Service
public class leave_messageServiceimpl implements leave_messageService {

		@Autowired
		private Leave_messageMapper  lm;
		
	public String insert(Leave_message leave) {
		String  res="";
		leave.setLeavemessageid(UUIDUtils.getNumUUID());
		leave.setLeavemessagetime(new Date());
		int  result=lm.insertSelective(leave);
		if(result>0){
			res="succes";
		}else{
			res="fail";
		}
		return res;
	}

	@Override
	public String insertmessage(Leave_message leave) {
		String  res="";
		leave.setLeavemessageid(UUIDUtils.getNumUUID());
		leave.setLeavemessagetime(new Date());
		int  result=lm.insertmessage(leave);
		if(result>0){
			res="ok";
		}else{
			res="fail";
		}
		return res;
	}

	@Override
	public Map<String, Object> selectall(Leave_message leave) {
		Map<String, Object> map = new HashMap<>();
		Leave_message   leave1=lm.selectbyuserid(leave.getUserid());
		if(leave1!=null){
			map.put("result", "success");
			map.put("message", leave1);
		}else{
			map.put("result", "fail");
		}
		return map;
	}

	@Override
	public String delete(Leave_message leave) {
		String   res="";
		int result=	lm.deleteByid(leave.getLeavemessageid());
		if(result>0){
			res="ok";
		}else{
			res="fail";
		}
		return  res;
	}
	

}
