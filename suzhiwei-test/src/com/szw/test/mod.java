package com.szw.test;
/** 
 * @Description
 * @author  SuZhiWei
 * @date 2018年2月8日 下午3:26:02 
 */
public enum mod {
	ss("枚举测试1",""),dd("dd",""),女("女","");
	private String ff;
	private String jj;
	
	/**
	 * @param ff
	 * @param jj
	 */
	private mod(String ff, String jj) {
		this.ff = ff;
		this.jj = jj;
	}

	/**
	 * @return the ff
	 */
	public String getFf() {
		return ff;
	}
	/**
	 * @param ff the ff to set
	 */
	public void setFf(String ff) {
		this.ff = ff;
	}
	/**
	 * @return the jj
	 */
	public String getJj() {
		return jj;
	}
	/**
	 * @param jj the jj to set
	 */
	public void setJj(String jj) {
		this.jj = jj;
	}

}
