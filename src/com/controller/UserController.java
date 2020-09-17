package com.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.UserVO;

@Controller
public class UserController {
	@Resource(name = "ubiz")
	Biz<String, UserVO> biz;

	/* ������ �̵���� */
	// ����� �߰� ������ �ε�
	@RequestMapping("/useradd.mc")
	public ModelAndView useradd(ModelAndView mv) {
		mv.addObject("centerpage", "user/register");
		mv.setViewName("main/main");
		return mv;
	}
	
	// �������� ���
		@RequestMapping("/signoutimpl.mc")
		public ModelAndView signout(HttpServletRequest request, String id) {
			UserVO dUser = null;

			try {
				dUser = biz.get(id);
				biz.remove(id);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			ModelAndView mv = new ModelAndView();
			HttpSession session = request.getSession();
			if(session != null) {
				session.invalidate();
			}

			mv.setViewName("main/main");
			return mv;
		}

}
