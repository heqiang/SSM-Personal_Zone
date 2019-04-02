package com.hq.javaee.service;

import java.util.Map;

import com.hq.javaee.pojo.Friend;

public interface FriendService {

	String addfriend(Friend friend);

	Map<String, Object> select(Friend friend);

}
