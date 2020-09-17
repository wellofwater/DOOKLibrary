package com.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.frame.Biz;
import com.vo.BookVO;
import com.vo.ResBookVO;


@Controller
@SessionAttributes("book")
public class BookController {

	@Resource(name = "bbiz")
	Biz<String, BookVO> biz;

	@Resource(name = "resbookbiz")
	Biz<String, ResBookVO> resbbiz;
	
	@RequestMapping("/book.mc")
	public ModelAndView book(ModelAndView mv) {
		mv.addObject("centerpage", "book");
		mv.setViewName("main/main");
		return mv;
	}
	
	// p.385

	// p.385
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("책이름", "NAME");
		conditionMap.put("저자", "AUTHOR");
		conditionMap.put("출판사", "PUBLISHER");
		return conditionMap;
	}
	

	
// booklist.mc
	@RequestMapping("/booklist.mc")
	public ModelAndView booklist(ModelAndView mv, BookVO vo) {
		ArrayList<BookVO> list = null;
		System.out.println(vo);
		try {
			list = biz.search(vo);
			if(list.isEmpty()) {
				mv.addObject("centerpage", "bookfolder/searchfail");
			}else {
				mv.addObject("booklist", list);
				mv.addObject("centerpage", "booklist");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.setViewName("main/main");
		return mv;
	}
	
	// bookdetail
	@RequestMapping("/bookdetail.mc")
	public ModelAndView bookdetail(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get(id);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail", dbbook);

		mv.addObject("centerpage", "bookfolder/bookdetail");
		mv.setViewName("main/main");
		return mv;
	}
		
		
		///////////////////////////////희진이형 부분 ///////////////////////////

	// 채희진
	// 책 더하기 페이지로 이동
	// 최종수정: 2020.09.07
	@RequestMapping("/bookadd.mc")
	public ModelAndView bookadd(ModelAndView mv) {
		mv.addObject("centerpage", "book/register");
		mv.setViewName("main/main");
		return mv;
	}

	// 채희진
	// 책 더하기 기능
	// 최종수정: 2020.09.08
	@RequestMapping("/bookaddimpl.mc")
	public ModelAndView bookaddimpl(ModelAndView mv, BookVO regibook) {

		String imgname = regibook.getMf().getOriginalFilename();
		regibook.setImg(imgname);
		System.out.println(imgname);

		System.out.println("Book add requested");
		System.out.println(regibook);

		try {
			biz.register(regibook);
			Util.saveFile(regibook.getMf());
			System.out.println("Ok");
			mv.addObject("regibook", regibook); // 추가
			mv.addObject("centerpage", "book/registerok");
		} catch (Exception e) {

			System.out.println("fail");
			mv.addObject("centerpage", "book/registerfail");
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// 채희진
	// 장서조회
	// 최종수정: 2020.09.07
	@RequestMapping("/bookselectall.mc")
	public ModelAndView bookselectall(ModelAndView mv) {
		ArrayList<BookVO> list = null;
		try {
			list = biz.get();
			mv.addObject("booklist", list);
			mv.addObject("centerpage", "book/selectall");
		} catch (Exception e) {
			mv.addObject("centerpage", "book/selectfail");
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// 채희진
	// 책 상세조회
	// 최종수정:2020.09.08
	@RequestMapping("/bookdetail_search.mc")
	public ModelAndView bookdetail_search(ModelAndView mv, String id) {
		System.out.println(id);
		BookVO book = null;
		try {
			book = biz.get(id);
			System.out.println(book);
			mv.addObject("bookdetail", book);
			mv.addObject("centerpage", "book/detail");
		} catch (Exception e) {
			mv.addObject("centerpage", "book/selectfail");
			e.printStackTrace();
		}

		mv.setViewName("main/main");
		return mv;
	}

	// 채희진
	// 책 업데이트 페이지로 이동
	// 최종수정일 : 2020.09.08
	@RequestMapping("/bookupdate.mc")
	public ModelAndView bookupdate(ModelAndView mv) {
		mv.addObject("centerpage", "book/get");
		mv.setViewName("main/main");
		return mv;
	}
	
	// 채희진
	// 책 업데이트
	// 최종수정:2020.09.08
	@RequestMapping("/bookupdateimpl.mc")
	public String bookupdateimpl(BookVO book) {
		String newimgname = book.getMf().getOriginalFilename();

		if (!newimgname.equals("")) {
			book.setImg(newimgname);
			Util.saveFile(book.getMf());
		}
		try {
			biz.modify(book);
			System.out.println("Update ok");
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 변경: bookdetail -> bookdetail_search
		return "redirect:bookdetail_search.mc?id=" + book.getId();
	}
	
	// 채희진
	// 책 삭제페이지
	// 최종 수정일:2020.09.08
	@RequestMapping("/bookdelete.mc")
	public ModelAndView bookdelete(ModelAndView mv) {
		mv.addObject("centerpage", "book/remove");
		mv.setViewName("main/main");
		return mv;
	}
	
	// 채희진
	// 책 삭제하기
	// 최종 수정일:2020.09.08
	@RequestMapping("/bookdeleteimpl.mc")
	public String bookdeleteimpl(String id) {
		try {
			biz.remove(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:bookselectall.mc";
	}
	
	// 채희진
	// 책 반납하기
	// 최종수정: 2020.09.09
	@RequestMapping("/bookreturnimpl.mc")
	public String bookreturnimpl(ModelAndView mv,String bid, String rid, String uid) {
		// 대출 db에서 객체를 false(소장 중)으로 바꾼다.
		ResBookVO rbook = null;
		BookVO book = null;
		try {
			rbook = resbbiz.get(rid);
			rbook.setState("f");
			resbbiz.modify(rbook);
			if(rbook.getUserid()!=uid) {
				uid = rbook.getBookid();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 북 db에 수량을 더한다(1권으로만)
		try {
			book = biz.get(bid);
			book.setQt(book.getQt()+1);
			biz.modify(book);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//mybook 페이지로 이동한다.
		return "redirect:bookreturnok.mc?bid="+bid+"&id="+uid;
	}
	
	// 채희진
	// 책 반납 성공 후 페이지
	// 최종수정: 2020.09.08
	@RequestMapping("/bookreturnok.mc")
	public ModelAndView bookreturnok(ModelAndView mv, String bid, String uid) {
		// 페이지를 이동한다.
		try {
			BookVO book = biz.get(bid);
			mv.addObject("book", book);
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		
		mv.addObject("centerpage", "book/bookreturnok");
		mv.setViewName("main/main");
		//mybook 페이지로 이동한다.
		return mv;
	}

		
		//////////////////////////////////////////////////////////////////
		
	//bookdetail1
	@RequestMapping("/bookdetail1.mc")
	public ModelAndView bookdetail1(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("3");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail1", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail1");
		mv.setViewName("main/main");
		return mv;
	}
	
	// bookdetail2
	@RequestMapping("/bookdetail2.mc")
	public ModelAndView bookdetail2(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("21");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail2", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail2");
		mv.setViewName("main/main");
		return mv;
	}

	// bookdetail3
	@RequestMapping("/bookdetail3.mc")
	public ModelAndView bookdetail3(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("41");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail3", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail3");
		mv.setViewName("main/main");
		return mv;
	}
	// bookdetail4
	@RequestMapping("/bookdetail4.mc")
	public ModelAndView bookdetail4(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("43");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail4", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail4");
		mv.setViewName("main/main");
		return mv;
	}
	
	// bookdetail5
	@RequestMapping("/bookdetail5.mc")
	public ModelAndView bookdetail5(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("45");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail5", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail5");
		mv.setViewName("main/main");
		return mv;
	}

	// bookdetail6
	@RequestMapping("/bookdetail6.mc")
	public ModelAndView bookdetail6(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("1");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail6", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail6");
		mv.setViewName("main/main");
		return mv;
	}
	// bookdetail7
	@RequestMapping("/bookdetail7.mc")
	public ModelAndView bookdetail7(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("4");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail7", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail7");
		mv.setViewName("main/main");
		return mv;
	}
	// bookdetail8
	@RequestMapping("/bookdetail8.mc")
	public ModelAndView bookdetail8(ModelAndView mv, String id) {
		BookVO dbbook = null;
		
		try {
			dbbook=biz.get("49");
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		mv.addObject("bookdetail8", dbbook);
		mv.addObject("centerpage", "bookfolder/bookdetail8");
		mv.setViewName("main/main");
		return mv;
	}
		
	/////////////////09-08 추가/////////////////
	@RequestMapping("/booklendimpl.mc")
    public void booklendimpl(ModelAndView mv, HttpServletResponse res, HttpServletRequest request) throws Exception {
          
          String id = request.getParameter("bookid");           
          String uid = request.getParameter("userid");
          System.out.println(id);
          System.out.println(uid);
         
          if(uid == " " || uid == null) {
             throw new Exception();
          }
          
         BookVO dbbook = null;
          try {
            
             dbbook = biz.get(id);
             if(dbbook.getQt()==0) {
                throw new Exception();
             }
             
          
             dbbook.setQt(dbbook.getQt()-1);
             biz.modify(dbbook);
             
            
             ResBookVO rvo = new ResBookVO(uid,dbbook.getId(),"t");
             
             resbbiz.register(rvo);
            
          } catch (Exception e1) {
             e1.printStackTrace();
          }
          PrintWriter out = res.getWriter();
          out.print(id);
          out.close();
                                  
       }

}