package com.test;

import java.util.ArrayList;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import com.frame.Biz;
import com.vo.BookVO;
import com.vo.ResBookVO;
import com.vo.SeatVO;
import com.vo.UseSeatVO;
import com.vo.UserVO;

public class App1 {

   public static void main(String[] args) {
      System.out.println("App Start .......");
      AbstractApplicationContext factory = new GenericXmlApplicationContext("myspring.xml");
      System.out.println("Spring Started .......");
      // IoC
      
      Biz<String, BookVO> bbiz = (Biz) factory.getBean("bbiz");
      Biz<Integer, ResBookVO> resbiz = (Biz) factory.getBean("resbookbiz");
      
//      ArrayList<BookVO> list = null;
//      try {
//		list = bbiz.get();
//		for(BookVO b : list) {
//			System.out.println(b);
//		}
//	} catch (Exception e) {
//		// TODO Auto-generated catch block
//		e.printStackTrace();
//	}
      
      ResBookVO resbook = new ResBookVO("id01", "21", "T");
      try {
		resbiz.register(resbook);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
      
      ArrayList<ResBookVO> list = null;
      try {
		list = resbiz.get();
		for(ResBookVO rb : list) {
			System.out.println(rb);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}

      factory.close();
      System.out.println("Spring End .......");
      System.out.println("App End .......");

   }

}