package edu.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

public class JsonUtil {
	
	public static void writeJsonString(HttpServletResponse resp, String str){
		try {
			resp.setCharacterEncoding("utf-8");
			PrintWriter out = resp.getWriter();
			out.write(str);
			out.close();
			resp.flushBuffer();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static String ListAjaxJson(List<?> list){
		JSONArray jsonArray = null;
		try{
			jsonArray = JSONArray.fromObject(list);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return jsonArray.toString();
	}

}
