package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.UseSeatVO;
@Service("useseatbiz")
public class UseSeatBiz implements Biz<Integer, UseSeatVO> {
	@Resource(name="useseatdao")
	Dao<Integer, UseSeatVO> dao;
	
	@Override
	public void register(UseSeatVO v) throws Exception {
		dao.insert(v);
	}

	@Override
	public void remove(Integer k) throws Exception {
		int result = 0;
		result = dao.delete(k);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public void modify(UseSeatVO v) throws Exception {
		int result = 0;
		result = dao.update(v);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public UseSeatVO get(Integer k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<UseSeatVO> get() throws Exception {
		return dao.selectall();
	}

	@Override
	public ArrayList<UseSeatVO> search(Object obj) throws Exception {
		return dao.search(obj);
	}

}
