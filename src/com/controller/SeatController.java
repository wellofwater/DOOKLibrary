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
	
	//////////////����////////////
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

	      // ���� Ȯ��
	      if(id == "" || id == null) {
	         throw new Exception();
	      }
	      
	      ArrayList<UseSeatVO> checklist = null;
	      try {
	         // �¼��� ��������� �˻�
	         checklist = usebiz.search(id);
	         //System.out.println(checklist.size());
	         if(checklist.size() > 0 && checklist.get(checklist.size()-1).getOuttime() == null) {
	               throw new Exception();
	         }
	         
	         // �¼� ���� ����
	         if (occupy == 0) {
	            seat.setOccupy(1);
	         }
	         biz.modify(seat);
	         
	         // �¼����� ������ ����
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

		// user id�� ���� useseat �˻�
		try {
			ArrayList<UseSeatVO> list = null;
			list = usebiz.search(userid);
			System.out.println(list);
			useseat = list.get(list.size() - 1);
		} catch (Exception e) {
			e.printStackTrace();
		}

		// �¼��� get�Ͽ� �� ���·� ����
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

		// �� �¼����� ����, ��ǽð� �Է�
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




