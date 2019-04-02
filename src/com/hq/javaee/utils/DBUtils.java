package com.hq.javaee.utils;

import java.io.InputStream;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DBUtils {
	public static SqlSession getSqlSession(){
		InputStream is = DBUtils.class.getClassLoader().getResourceAsStream("mybatis-config.xml");
		SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(is);
		SqlSession sqlSession = sf.openSession();
		return sqlSession;
	}
}
