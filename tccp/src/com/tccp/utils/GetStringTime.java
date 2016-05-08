package com.tccp.utils;

import java.util.Date;

public class GetStringTime {
	public static String getStringTime(){
		Date date = new Date(System.currentTimeMillis());
		return DateFormatUtil.dateFormat(date);
	}
}
