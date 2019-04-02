package com.hq.javaee.mapper;

import com.hq.javaee.pojo.User;

public interface UserMapper {
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	User selectByPrimaryusername(String username);

	int updatebyusername(User user);

	int update(User user);
}