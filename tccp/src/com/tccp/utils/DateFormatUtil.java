package com.tccp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFormatUtil {
	public static String dateFormat(Date date){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日 HH时mm分ss秒");
		return (String)sdf.format(date);
	}
}
