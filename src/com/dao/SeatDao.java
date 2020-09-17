package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.SeatVO;
@Repository("seatdao")
public interface SeatDao extends Dao<String, SeatVO> {

}
