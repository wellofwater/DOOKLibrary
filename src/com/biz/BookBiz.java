package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.BookVO;

@Service("bbiz")
public class BookBiz implements Biz<String, BookVO>{

	@Resource(name="bdao")
	Dao<String, BookVO> dao;
	
	
	@Override
	public void register(BookVO v) throws Exception {	
		int result = dao.insert(v);
		if(result==0) {
			throw new Exception();
		}
	}

	@Override
	public void modify(BookVO v) throws Exception {
		int result = dao.update(v);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public void remove(String k) throws Exception {
		int result = dao.delete(k);
		if(result == 0) {
			throw new Exception();
		}
		
	}

	@Override
	public BookVO get(String k) throws Exception {
		if (dao.select(k)==null)
		{
			throw new Exception();
		}
		return dao.select(k);
	}

	@Override
	public ArrayList<BookVO> get() throws Exception {
		if(dao.selectall()==null) {
			throw new Exception();
		}
		return dao.selectall();
	}

	@Override
	public ArrayList<BookVO> search(Object obj) throws Exception {
		return dao.search(obj);
	}

}
