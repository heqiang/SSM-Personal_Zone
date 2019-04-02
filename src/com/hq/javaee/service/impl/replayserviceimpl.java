package com.hq.javaee.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hq.javaee.mapper.ReplayMapper;
import com.hq.javaee.pojo.Replay;
import com.hq.javaee.service.ReplayService;
import com.hq.javaee.utils.UUIDUtils;

@Service
public class replayserviceimpl  implements ReplayService{

	@Autowired
	private ReplayMapper  rm;
	@Override
	public String insert(Replay replay) {
		String  res="";
		replay.setRelayid(UUIDUtils.getNumUUID());
		replay.setReplaytime(new Date());
		int result=rm.insertSelective(replay);
		if(result>0){
			res="ok";
		}else{
			res="fail";
		}
		return  res;
	}

}
