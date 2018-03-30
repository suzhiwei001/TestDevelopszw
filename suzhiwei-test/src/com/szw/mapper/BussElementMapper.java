package com.szw.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.szw.pojo.BussElement;

public interface BussElementMapper {
	/**
	 * 要素展示
	 * @return BussElement集
	 */
	List<BussElement> findByBussElement();
	List<BussElement> searchForQuote(@Param("idsList")List<List<Integer>> idsList);
}
