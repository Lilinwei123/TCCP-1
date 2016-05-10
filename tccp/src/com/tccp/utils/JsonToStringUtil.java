package com.tccp.utils;

import java.util.List;

import com.google.gson.Gson;
import com.tccp.entity.Action;

public class JsonToStringUtil {
	public static String jsonToString(Action action){
		Gson gson = new Gson();
		String jsonString = gson.toJson(action);
		System.out.println(jsonString);
		return jsonString;
	}
	public static String jsonToString(List<Action> actionList){
		Gson gson = new Gson();
		String jsonString = gson.toJson(actionList);
		System.out.println(jsonString);
		return jsonString;
	}
}
