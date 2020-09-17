package com.biz;
import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.SeatVO;
@Service("seatbiz")
public class SeatBiz implements Biz<String, SeatVO> {
	
	@Resource(name="seatdao")
	Dao<String, SeatVO> dao;

	@Override
	public void register(SeatVO v) throws Exception {
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
	public void modify(SeatVO v) throws Exception {
		int result = 0;
		result = dao.update(v);
		if(result == 0) {
			throw new Exception();
		}
	}

	@Override
	public SeatVO get(String k) throws Exception {
		return dao.select(k);
	}

	@Override
	public ArrayList<SeatVO> get() throws Exception {
		return dao.selectall();
	}

	@Override
	public ArrayList<SeatVO> search(Object obj) throws Exception {
		return dao.search(obj);
	}
	
}
