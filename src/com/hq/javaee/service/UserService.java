package com.hq.javaee.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.hq.javaee.pojo.User;

public interface UserService {

	Map<String, Object> login(User user);

	String regist(User user);

	String find(String username);

	Map<String, Object> update(User user);

	String updatebyusername(User user);

	void uploadAvatar(User user);

	Map<String, Object> selectbyusername(User user);

	String insert(User user);

	String updateuserid(User user);

}
