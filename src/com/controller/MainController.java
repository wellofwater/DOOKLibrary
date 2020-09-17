package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.SeatVO;
import com.vo.UseSeatVO;
import com.vo.UserVO;


@Controller
public class MainController {
	
	@Resource(name="ubiz")
	Biz<String, UserVO> userbiz;
	
	////////////////////////////
	
	@RequestMapping("/main.mc")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("main/main");
		return mv;
	}
	
	@RequestMapping("/test.mc")
	public ModelAndView test(ModelAndView mv) {

		mv.addObject("centerpage", "test");
		mv.setViewName("main/main");
		return mv;
	}
	
	@RequestMapping("/login.mc")
	public ModelAndView login(ModelAndView mv) {
		mv.addObject("centerpage", "login");
		mv.setViewName("main/main");
		return mv;
	}

	/////////////////////////혜성 부분///////////////////////

	
	////////////////////////////////////////////////
	@RequestMapping("/loginimpl.mc")
	public ModelAndView loginimpl(ModelAndView mv,
			HttpServletRequest request,
			HttpSession session) {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		try {
			UserVO dbuser = userbiz.get(id);
			if(pwd.equals(dbuser.getPwd())) {
				session.setAttribute("loginuser", dbuser);
				mv.addObject("centerpage", "mainpage");
			}else {
				mv.addObject("centerpage", "mainpage");	
			}
		} catch (Exception e) {
			mv.addObject("centerpage", "mainpage");
			e.printStackTrace();
		}
		
		mv.setViewName("main/main");
		return mv;
	}
	
	@RequestMapping("/logout.mc")
	public ModelAndView logout(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		HttpSession session = request.getSession();
		if(session != null) {
			session.invalidate();
		}
		mv.setViewName("main/main");
		return mv;
	}
	
	/////////////////////희진이형 부분/////////////////////////

	
	@RequestMapping("/registeradmin.mc")
	public ModelAndView register(ModelAndView mv) {
		mv.addObject("centerpage", "user/registeradmin");
		mv.setViewName("main/main");
		return mv;
	}
	
	
	////////////////////////새롬 날씨 ///////////////////////////
	
	// 수정 날짜: 2020.09.08
	   @RequestMapping("/weather.mc")
	   public void getWeather(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws IOException {
	      String key = "dDw%2BIZmXJgVoq5s7ykMsHVW7Pbr%2FueK49QRY5HECqvCimV9k0gZUQdnP0GoMfBn%2FXafD3LpV3%2B8nqsQTtjpudg%3D%3D";
	      
	       //오늘 년월일, 현재시간
	       Date date = new Date();
	       SimpleDateFormat format_date = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
	       SimpleDateFormat format_time = new SimpleDateFormat("kk", Locale.KOREA);
	       SimpleDateFormat format_m = new SimpleDateFormat("mm", Locale.KOREA);
	       
	       String weather_date = format_date.format(date);
	       String strhour = format_time.format(date);
	       String strmin = format_m.format(date);
	       int min = Integer.parseInt(strmin);
	       String weather_time = "";
	       if(min >= 25) {
	          weather_time = strhour + "00";
	       } else {
	          int hour = Integer.parseInt(strhour) - 1;
	          weather_time = String.format("%02d", hour) + "00";
	       }
	       
	      String urlstr = "http://apis.data.go.kr/1360000/VilageFcstInfoService/getUltraSrtNcst?serviceKey="+ key +"&pageNo=1&numOfRows=10&dataType=XML&base_date="+ weather_date + "&base_time=" + weather_time +"&nx=59&ny=125&";
	      String xmlstr = getWeatherRequest(urlstr, "");
	       response.setContentType("text/xml;charset=utf-8");
	       PrintWriter out = response.getWriter();
	       out.print(xmlstr);
	      mv.addObject("weatherxml", xmlstr);
	   }
	   
	   // 수정 날짜: 2020.09.08
	   public String getWeatherRequest(String url, String parameter) {
	      try {
	         String param = "{\"param\":\"" + parameter + "\"} ";
	         URL uri = new URL(url);
	         HttpURLConnection connection = (HttpURLConnection) uri.openConnection();
	         connection.setRequestMethod("GET");
	         int code = connection.getResponseCode();
	         if (code == 200) {
	            try (BufferedReader input = new BufferedReader(new InputStreamReader(connection.getInputStream()))) {
	               String line;
	               StringBuffer buffer = new StringBuffer();
	               while ((line = input.readLine()) != null) {
	                  buffer.append(line);
	               }
	               return buffer.toString();
	            }
	         }
	         return code + "";
	      } catch (Throwable e) {
	         throw new RuntimeException(e);
	      }
	   }
	
}




