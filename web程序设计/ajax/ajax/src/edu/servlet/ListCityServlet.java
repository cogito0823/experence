package edu.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import edu.beans.City;
import edu.dao.CityDao;
import edu.util.JsonUtil;

public class ListCityServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public ListCityServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String provinceId = req.getParameter("provinceId");
		int id = 0;
		try {
			id = Integer.parseInt(provinceId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		CityDao cityDao = new CityDao();
		List<City> cityList = cityDao.findByProvinceId(id);
		//String cityListStr = JsonUtil.ListAjaxJson(cityList);
		JSONArray ja = JSONArray.fromObject(cityList);
		String cityListStr = ja.toString();
		System.out.println(cityListStr);
		//JsonUtil.writeJsonString(resp, cityListStr);
		resp.setCharacterEncoding("utf-8");
		PrintWriter out = resp.getWriter();
		out.write(cityListStr);
		out.close();
		resp.flushBuffer();
    }

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		this.doGet(req, resp);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
