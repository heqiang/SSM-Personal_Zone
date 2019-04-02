package com.hq.javaee.service;

import java.util.Map;

import com.hq.javaee.pojo.Leave_message;

public interface leave_messageService {

	String insert(Leave_message leave);

	String insertmessage(Leave_message leave);

	Map<String, Object> selectall(Leave_message leave);

	String delete(Leave_message leave);

}
