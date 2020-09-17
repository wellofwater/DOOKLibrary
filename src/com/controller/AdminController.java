package com.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.BookVO;
import com.vo.ResBookVO;
import com.vo.SeatVO;
import com.vo.UseSeatVO;
import com.vo.UserVO;

@Controller
public class AdminController {
	@Resource(name = "ubiz")
	Biz<String, UserVO> biz;

	@Resource(name = "bbiz")
	Biz<String, BookVO> bbiz;

	@Resource(name = "resbookbiz")
	Biz<String, ResBookVO> resbbiz;
	
	@Resource(name = "useseatbiz")
	Biz<Integer, UseSeatVO> usebiz;
	
	@Resource(name = "seatbiz")
	Biz<String, SeatVO> seatbiz;


	// ������ �߰� ����� ���Ե� ������
	@RequestMapping("/useraddadmin.mc")
	public ModelAndView useraddadmin(ModelAndView mv) {
		mv.addObject("position", 1);
		mv.addObject("centerpage", "user/register");
		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping("/useraddadminimpl.mc")
	public ModelAndView useraddadminimpl(ModelAndView mv, UserVO regiuser) {
		try {
			biz.register(regiuser);
			mv.addObject("registeruser", regiuser);
			mv.addObject("centerpage", "user/registerok");
		} catch (Exception e) {
			mv.addObject("centerpage", "user/registerfail");
			e.printStackTrace();
		}
		mv.setViewName("main/main");
		return mv;
	}

	// ���� ���� ������
	@RequestMapping("/userdeleteadmin.mc")
	public ModelAndView userdelete(ModelAndView mv) {
		mv.addObject("centerpage", "user/delete");
		mv.setViewName("main/main");
		return mv;
	}

	// ���� ��ü ��ȸ ������
	@RequestMapping("/userselectall.mc")
	public ModelAndView userselectall(ModelAndView mv, String id) {
		mv.addObject("centerpage", "user/selectall");
		mv.setViewName("main/main");
		return mv;
	}

	// ���� ���̵� �Է�
	@RequestMapping("/userupdateadmin.mc")
	public ModelAndView userupdateadmin(ModelAndView mv) {
		mv.addObject("centerpage", "user/get");
		mv.setViewName("main/main");
		return mv;
	}

	// ���� �� ��ȸ
	@RequestMapping("/userdetailadminimpl.mc")
	public ModelAndView userdetailadminimpl(ModelAndView mv, HttpServletRequest request) {
		String id = request.getParameter("id");
		System.out.println(id);
		UserVO dbuser = null;
		try {
			dbuser = biz.get(id);
			mv.addObject("centerpage", "user/detail");
			mv.addObject("position", 1);
			mv.addObject("dbuser", dbuser);
		} catch (Exception e) {
			mv.addObject("centerpage", "user/selectfail");
			System.out.println("get failed");
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// ���� �� ��ȸ
	// ä����
	// �������� : 2020.09.08
	@RequestMapping("/userdetail.mc")
	public ModelAndView userdetail(ModelAndView mv, String id) {
		System.out.println(id);
		UserVO dbuser = null;
		try {
			dbuser = biz.get(id);
			mv.addObject("centerpage", "user/detail");
			// �α��� ������ ���� ������ �� ���� -> ���� ���濡�� �Ϲݻ���� / ������ ���� ����
			int position = dbuser.getPosition();
			if (position==1) {
				mv.addObject("position", 1);
			}
			mv.addObject("dbuser", dbuser);
		} catch (Exception e) {
			mv.addObject("centerpage", "user/selectfail");
			System.out.println("get failed");
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// �������� ����
	@RequestMapping("/userupdateadminimple.mc")
	public ModelAndView userupdateadminimple(ModelAndView mv, UserVO submitUser) {
		System.out.println("User update requested");
		System.out.println(submitUser);
		try {
			biz.modify(submitUser);
			mv.addObject("centerpage", "user/updateok");
			mv.addObject("updateuser",submitUser);
		} catch (Exception e) {
			mv.addObject("centerpage", "user/updatefail");
			e.printStackTrace();
		}
		mv.setViewName("main/main");
		return mv;
	}

	// �������� ���
	@RequestMapping("/userdeleteimpl.mc")
	public ModelAndView userdelete(ModelAndView mv, String id) {
		UserVO dUser = null;
		try {
			dUser = biz.get(id);
			mv.addObject("deleteuser", dUser);
			biz.remove(id);
			mv.addObject("centerpage", "user/deleteok");
		} catch (Exception e) {
			e.printStackTrace();
			mv.addObject("centerpage", "user/deletefail");
		}

		mv.setViewName("main/main");
		return mv;
	}

	// ��ü������ȸ
	@RequestMapping("/userselectalladminimpl.mc")
	public ModelAndView userselectalladminimpl(ModelAndView mv) {
		ArrayList<UserVO> userlist = null;
		System.out.println("select all requested");
		try {
			userlist = biz.get();
			mv.addObject("userlist", userlist);
			mv.addObject("centerpage", "user/selectall");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// manager������ �̵�
	@RequestMapping("/manager.mc")
	public ModelAndView manager(ModelAndView mv, String id) {
		System.out.println(id);
		UserVO user = null;
		BookVO book = null;
		ArrayList<ResBookVO> resbook = null;
		ArrayList<UseSeatVO> useseat = null;
		ArrayList<BookVO> bookList = new ArrayList<BookVO>();		
		ArrayList<BookVO> latebookList = new ArrayList<BookVO>();
		ArrayList<ResBookVO> lateresbook = new ArrayList<ResBookVO>();
		
		//���� ã��
		try {
			user = biz.get(id);
			System.out.println("Got user");
			// �Ϲ� ����ڰ� ȣ��� �׸�
			if (user.getPosition()==0);{
				mv.addObject("centerpage", "mainpage");
				mv.setViewName("main/main");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//��� ���� ���� ��ȸ
		try {
			resbook = resbbiz.get();
			System.out.println(resbook);
			mv.addObject("resbook", resbook);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// ��� �¼� ���� ��ȸ
		try {
			useseat = usebiz.get();
			System.out.println("Useseat acquired");
			mv.addObject("seatlist", useseat);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (ResBookVO v:resbook) {
			try {
				book = bbiz.get(v.getBookid());
				System.out.println(book);
				bookList.add(book);
				System.out.println("Book added to list");
				// ��ü���� ���� �� ����Ʈ�� ���ϱ�.

				Date utilDate = v.getDuedate();				
		        Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date());
		        DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		        Date testDate = df.parse("2020-09-15"); // ��ü ������ ����
		        mv.addObject("testDate", testDate);
		        //2020.09.08  ��¥  + ���� ���� ģ���鸸 ��ü����
		        if (testDate.compareTo(utilDate)>0 && v.getState().equals("t")) {
		        	latebookList.add(book);
		        	lateresbook.add(v);
		        }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		mv.addObject("latebookList", latebookList);
		mv.addObject("lateresbook", lateresbook);
		mv.addObject("bookList", bookList);
		mv.addObject("centerpage", "manager");
		mv.setViewName("main/main");
		return mv;
	}
	
	// mybook������ �̵� + ���� �߰�
	// ��������: 2020.09.08
	@RequestMapping("/mybook.mc")
	public ModelAndView mybook(ModelAndView mv, String id) {
		System.out.println(id);
		UserVO user = null;
		BookVO book = null;
		ArrayList<ResBookVO> resbook = null;
		ArrayList<UseSeatVO> useseat = null;
		ArrayList<BookVO> bookList = new ArrayList<BookVO>();		
		ArrayList<BookVO> latebookList = new ArrayList<BookVO>();
		ArrayList<ResBookVO> lateresbook = new ArrayList<ResBookVO>();
		
		//���� ã��
		try {
			user = biz.get(id);
			System.out.println("Got user");
			System.out.println(user);
			// 2020.09.08 �߰���
//			mv.addObject("user", user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//���� ���̵�� ����, ���� ���� ��ȸ
		try {
			resbook = resbbiz.search(user.getId());
			System.out.println("Resbook acquired");
			System.out.println(resbook);
			mv.addObject("resbook", resbook);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//���� ���̵�� ����, �¼� ���� ��ȸ
		try {
			useseat = usebiz.search(user.getId());
			System.out.println("Useseat acquired");
			System.out.println(useseat);
			mv.addObject("seatlist", useseat);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		for (ResBookVO v:resbook) {
			try {
				book = bbiz.get(v.getBookid());
				System.out.println(book);
				bookList.add(book);
				System.out.println("Book added to list");
				// ��ü���� ���� �� ����Ʈ�� ���ϱ�.

				Date utilDate = v.getDuedate();				
		        Calendar cal = Calendar.getInstance();
		        cal.setTime(new Date());
		        DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		        Date testDate = df.parse(df.format(new Date())); // ��ü ������ ����
		        mv.addObject("testDate", testDate);
		        //2020.09.08  ��¥  + ���� ���� ģ���鸸 ��ü����
		        if (testDate.compareTo(utilDate)>0 && v.getState().equals("t")) {
		        	latebookList.add(book);
		        	lateresbook.add(v);
		        }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		mv.addObject("latebookList", latebookList);
		mv.addObject("lateresbook", lateresbook);
		mv.addObject("bookList", bookList);
		mv.addObject("centerpage", "mybook");
		mv.setViewName("main/main");
		return mv;
	}

}
