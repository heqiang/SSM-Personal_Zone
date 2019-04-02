package com.hq.javaee.mapper;

import com.hq.javaee.pojo.Replay;

public interface ReplayMapper {
    int deleteByPrimaryKey(Integer relayid);

    int insert(Replay record);

    int insertSelective(Replay record);

    Replay selectByPrimaryKey(Integer relayid);

    int updateByPrimaryKeySelective(Replay record);

    int updateByPrimaryKey(Replay record);
}