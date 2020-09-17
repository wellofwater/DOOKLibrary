package com.biz;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.frame.Biz;
import com.frame.Dao;
import com.vo.UserVO;

@Service("ubiz")
public class UserBiz implements Biz<String, UserVO>{

	@Resource(name="udao")
	Dao<String, UserVO> dao;
	
	
	@Override
	public void register(UserVO v) throws Exception {	
		dao.insert(v);
	}

	@Override
	public void modify(UserVO v) throws Exception {
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
	public UserVO get(String k) throws Exception {
		if (dao.select(k)==null)
		{
			throw new Exception();
		}
		return dao.select(k);
	}

	@Override
	public ArrayList<UserVO> get() throws Exception {
		if(dao.selectall()==null) {
			throw new Exception();
		}
		return dao.selectall();
	}

	@Override
	public ArrayList<UserVO> search(Object obj) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


}












