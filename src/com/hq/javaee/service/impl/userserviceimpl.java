package com.hq.javaee.service.impl;

import java.util.Date;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import com.hq.javaee.mapper.UserMapper;
import com.hq.javaee.pojo.User;
import com.hq.javaee.service.UserService;
import com.hq.javaee.utils.DBUtils;
import com.hq.javaee.utils.MD5Utils;
import com.hq.javaee.utils.UUIDUtils;

@Service("userService")
public class userserviceimpl implements UserService {

		@Autowired
		private UserMapper usermapper;
	@Override
	public Map<String, Object> login(User user) {
		Map<String, Object> map = new HashMap<>();
	
		User    _user= 	usermapper.selectByPrimaryusername(user.getUsername());
	
		if(_user==null){
			map.put("result", "username  is not found");
		}else{
			if(MD5Utils.toMd5(user.getPassword()).equals(_user.getPassword())){
				map.put("user", _user);
				map.put("result", "success");
				
			}else{
				map.put("result", "password  error");	
			}	
		}
		return map;
	
	
	
	}
	@Override
	public String regist(User user) {
		
		String result="";
		User   _user=usermapper.selectByPrimaryusername(user.getUsername());
		if(_user==null){
			user.setUserid(UUIDUtils.getNumUUID());
			user.setPassword(MD5Utils.toMd5(user.getPassword()));
			user.setCreatetime(new Date());
			usermapper.insertSelective(user);
			result="success";
		}else{
			result="username is used";
		}
		
		return  result;
		
		
	}
	@Override
	public String find(String username) {
		String  result="";
		User  user=usermapper.selectByPrimaryusername(username);
		System.out.println(user);
		if(user==null){//没有哦找到该用户
			result="success";
		}else{
			result="false";//存在该用户
		}
	return  result;
	}
	
	
	@Override
	public Map<String, Object> update(User user) {
		Map<String, Object> map=new HashMap<>();
	
		int  result=usermapper.updateByPrimaryKeySelective(user);
		if(result>0){
			User user1=usermapper.selectByPrimaryusername(user.getUsername());
			if(user1!=null){
				map.put("user", user1);
				map.put("update", "success");
				
			}else{
				map.put("update", "fail");
			}
		
		}else{
			map.put("update", "更新失败");
		}
		

	return map;
	
	}
	@Override
	public String updatebyusername(User user) {
		String  result="";
		user.setPassword(MD5Utils.toMd5(user.getPassword()));
		int   re=	usermapper.updatebyusername(user);
		

		if(re>0){
			result="success";
		}else{
			result="密码找回失败";
		}
		return result;
	}
	@Override
	public void uploadAvatar(User user) {
		SqlSession session = DBUtils.getSqlSession();

		UserMapper um = session.getMapper(UserMapper.class);
		
		user.setPassword(null);
		
//		um.updateByPrimaryKeySelective(user);
		
		session.commit();
		session.close();
	}
	@Override
	public Map<String, Object> selectbyusername(User user) {
		Map<String, Object> map=new HashMap<>();
		
	User fuser=usermapper.selectByPrimaryusername(user.getUsername());
		if(fuser!=null){
			map.put("result", "ok");
			map.put("fuser",fuser);
		}else{
			map.put("result","fail");
			
		}
		return map;
		
	}
	@Override
	public String insert(User user) {
		// TODO Auto-generated method stub
		return null;
	}
	public String updateuserid(User user) {
		String  res="";
		System.out.println(user.getUserid());
		int  result=usermapper.update(user);
		if(result>0){
			res="ok";
		}else{
			res="no";
		}
		
		return res;
	}
	

	
	

}
