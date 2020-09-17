package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.ResBookVO;
@Service("resbookbiz")
public class ResBookBiz implements Biz<String, ResBookVO> {
	@Resource(name="resbookdao")
	Dao<String, ResBookVO> dao;
	
	@Override
	public void register(ResBookVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(String k) throws Exception {
		int result = 0;
		result = dao.delete(k);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public void modify(ResBookVO v) throws Exception {
		int result = 0;
		result = dao.update(v);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public ResBookVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<ResBookVO> get() throws Exception {
		return dao.selectall();
	}

	@Override
	public ArrayList<ResBookVO> search(Object obj) throws Exception {
		return dao.search(obj);
	}


}
