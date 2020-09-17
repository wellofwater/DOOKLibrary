package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.SeatVO;
import com.vo.UseSeatVO;
import com.vo.UserVO;


@Controller
public class SeatController {
	
	@Resource(name="ubiz")
	Biz<String, UserVO> userbiz;
	
	//////////////새롬////////////
	@Resource(name = "seatbiz")
	Biz<String, SeatVO> biz;
	@Resource(name = "useseatbiz")
	Biz<Integer, UseSeatVO> usebiz;
	
	@RequestMapping("/seat.mc")
	public ModelAndView seat(ModelAndView mv, HttpServletRequest request) {
		ArrayList<SeatVO> list = null;
		String floor = request.getParameter("floor");
		if (floor == null) {
			floor = "1F";
		}

		try {
			list = biz.search(floor);
//			for(SeatVO co:list) {
//				System.out.println(co);
//			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		mv.addObject("seatlist", list);
		mv.addObject("centerpage", "seat");
		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping("/seatupdateimpl.mc")
	public void seatupdateimpl(ModelAndView mv, SeatVO seat, HttpServletResponse res, HttpServletRequest request) throws Exception {
	      int occupy = seat.getOccupy();
	      String id = request.getParameter("user");
	      UseSeatVO useseat = new UseSeatVO(id, seat.getId());
	      String result = "0";

	      // 유저 확인
	      if(id == "" || id == null) {
	         throw new Exception();
	      }
	      
	      ArrayList<UseSeatVO> checklist = null;
	      try {
	         // 좌석을 사용중인지 검사
	         checklist = usebiz.search(id);
	         //System.out.println(checklist.size());
	         if(checklist.size() > 0 && checklist.get(checklist.size()-1).getOuttime() == null) {
	               throw new Exception();
	         }
	         
	         // 좌석 상태 변경
	         if (occupy == 0) {
	            seat.setOccupy(1);
	         }
	         biz.modify(seat);
	         
	         // 좌석배정 데이터 삽입
	         usebiz.register(useseat);
	         result = seat.getId().substring(0, 1);
	      } catch (Exception e1) {
	         e1.printStackTrace();
	      }

	      PrintWriter out = res.getWriter();
	      out.print(result);
	      out.close();
	   }

	@RequestMapping("/checkoutimpl.mc")
	public void checkoutimpl(ModelAndView mv, String userid, HttpServletResponse res) throws IOException {
		UseSeatVO useseat = null;
		SeatVO seat = null;
		String result = "0";

		// user id를 통해 useseat 검색
		try {
			ArrayList<UseSeatVO> list = null;
			list = usebiz.search(userid);
			System.out.println(list);
			useseat = list.get(list.size() - 1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// 좌석을 get하여 빈 상태로 셋팅
		if (useseat.getOuttime() == null) {
			try {
				seat = biz.get(useseat.getSid());
				if (seat.getOccupy() == 1) {
					seat.setOccupy(0);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 빈 좌석으로 수정, 퇴실시간 입력
		try {
			biz.modify(seat);
			usebiz.modify(useseat);
			result = seat.getId().substring(0, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		PrintWriter out = res.getWriter();
		out.print(result);
		out.close();
	}
	
	@RequestMapping("/seatmanual.mc")
	public ModelAndView seatmanual(ModelAndView mv) {

		mv.addObject("centerpage", "seatmanual");
		mv.setViewName("main/main");
		return mv;
	}
	
}




