package com.controller;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.BookVO;
import com.vo.ResBookVO;

@Controller
public class ResBookController {
	@Resource(name="bbiz")
	Biz<String,BookVO> biz;
	
	@Resource(name="resbookbiz")
	Biz<String,ResBookVO> resbbiz;
	
	//관리자 대출내역 조회
	@RequestMapping("/getresbookimpl.mc")
	public ModelAndView bookadd(ModelAndView mv) {
		ArrayList<ResBookVO> resblist = null;
		try {
			resblist = resbbiz.get();
			mv.addObject("resblist", resblist);
			mv.addObject("centerpage", "manager");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.setViewName("main/main");
		return mv;
	}
}
