package com.hq.javaee.service;

import com.hq.javaee.pojo.Comment;

public interface CommentService {

	String insert(Comment comment);

	String delete(Comment comment);

}
