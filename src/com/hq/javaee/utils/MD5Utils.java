package com.hq.javaee.utils;

import org.apache.commons.codec.digest.DigestUtils;

public class MD5Utils {

	public static void main(String[] args) {
		String pass = DigestUtils.md5Hex("");
		System.out.println(pass);
	}
	
	public static String toMd5(String pass) {
		return DigestUtils.md5Hex(pass);
	}
}
