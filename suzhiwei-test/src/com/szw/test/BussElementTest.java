package com.szw.test;

import java.util.List;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.szw.pojo.BussElement;
import com.szw.service.BussElementService;
public class BussElementTest extends BaseJunit{
	/**
	 * loger打印输出
	 */
	Logger LOGGER = LoggerFactory.getLogger(BussElementTest.class);
	/**
	 * 要素
	 */
	@Autowired
	private BussElementService bussElementService;
	/**
	 * 要素展示
	 */
	@Test
	public void findByBussElement() {
		
		try {
			List<BussElement> findByBussElement = bussElementService.findByBussElement();
			LOGGER.debug("====================="+findByBussElement.get(0));

		} catch (Exception e) {
			LOGGER.debug("sssssss", e);
		}
	}

}
