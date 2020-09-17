package com.dao;

import org.springframework.stereotype.Repository;

import com.frame.Dao;
import com.vo.BookVO;
@Repository("bdao")
public interface BookDao extends Dao<String, BookVO> {

}