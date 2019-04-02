package com.hq.javaee.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hq.javaee.mapper.FriendMapper;
import com.hq.javaee.pojo.Friend;
import com.hq.javaee.service.FriendService;
import com.hq.javaee.utils.UUIDUtils;

@Service
public class friendServiceimpl implements FriendService {

		@Autowired
		private FriendMapper fm;

		@Override
		public String addfriend(Friend friend) {
			String  result="";
			friend.setFriendid(UUIDUtils.getNumUUID());
		
			 int  result1=fm.insertfriend(friend);
			
			if(result1>0){
				result="success";
			}else{
				result="fail";
			}
		 return	result;
	
		}

		@Override
		public Map<String, Object> select(Friend friend) {
			Map<String, Object> map = new HashMap<>();
				
		System.out.println("朋友的名字："+friend.getFriendname()+"用户id:"+friend.getUserid());
				
				List<Friend> list=fm.selectByuserid(friend.getUserid());
				if(list!=null&&!list.isEmpty()){
					for(int i=0;i<list.size();i++){
						if(list.get(i).getFriendname().equals(friend.getFriendname())){
							map.put("result", "success");
						}else{
							map.put("result", "fail");
						}	
				}	
				}else{
					map.put("result", "fail");
				}
			
			return map;
			}
	}
		
		
		

