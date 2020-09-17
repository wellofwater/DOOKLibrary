package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.UseSeatVO;
@Repository("useseatdao")
public interface UseSeatDao extends Dao<Integer, UseSeatVO> {

}
