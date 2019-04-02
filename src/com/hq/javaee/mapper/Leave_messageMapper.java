package com.hq.javaee.mapper;

import com.hq.javaee.pojo.Leave_message;

public interface Leave_messageMapper {
    int deleteByPrimaryKey(Integer leavemessageid);

    int insert(Leave_message record);

    int insertSelective(Leave_message leave);

    Leave_message selectByPrimaryKey(Integer leavemessageid);

    int updateByPrimaryKeySelective(Leave_message record);

    int updateByPrimaryKey(Leave_message record);

	int insertmessage(Leave_message leave);

	Leave_message selectbyuserid(Integer userid);

	int deleteByid(Integer leavemessageid);
}