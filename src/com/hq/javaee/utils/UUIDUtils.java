package com.hq.javaee.utils;

import java.util.UUID;

public class UUIDUtils {

	public static void main(String[] args) {
		
		UUID uuid = UUID.randomUUID();
		
		String id = uuid.toString();
		
		System.out.println(id.hashCode());
		
	}
	public static String getUUID() {
		UUID uuid = UUID.randomUUID();
		return uuid.toString().replace("-", "");
	}
	public static int getNumUUID() {
		UUID uuid = UUID.randomUUID();
		int num = uuid.toString().replace("-", "").hashCode();
		return num > 0 ? num : -num;
	}
}
