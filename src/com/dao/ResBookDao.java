package com.dao;

import org.springframework.stereotype.Repository;
import com.frame.Dao;
import com.vo.ResBookVO;

@Repository("resbookdao")
public interface ResBookDao extends Dao<String, ResBookVO> {

}