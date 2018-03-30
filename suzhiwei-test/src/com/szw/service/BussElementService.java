package com.szw.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.szw.mapper.BussElementMapper;
import com.szw.pojo.BussElement;

@Service
public class BussElementService {
	@Autowired
	private BussElementMapper bussElementMapper;
	public List<BussElement> findByBussElement(){
		List<BussElement> findByBussElement = bussElementMapper.findByBussElement();
		if(findByBussElement.isEmpty()) {
			return null;
		}
		return findByBussElement;
	}
}
