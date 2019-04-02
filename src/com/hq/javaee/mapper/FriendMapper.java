package com.hq.javaee.mapper;

import java.util.List;

import com.hq.javaee.pojo.Friend;

public interface FriendMapper {
    int deleteByPrimaryKey(Integer friendid);

    int insert(Friend record);

    int insertSelective(Friend record);

    Friend selectByPrimaryKey(Integer friendid);

    int updateByPrimaryKeySelective(Friend record);

    int updateByPrimaryKey(Friend record);

	int insertfriend(Friend friend);

	List<Friend> selectByuserid(Integer userid);
}