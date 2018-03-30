package com.szw.pojo;

import java.io.Serializable;
import java.util.Date;
public class BussElement implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
    private Integer id;
	/**
	 * @JsonIgnore
	 */
	private int version;
	/**
	 * @JsonIgnore
	 */
	private Date createTime;
	/**
	 * @JsonIgnore
	 */
	private Date editTime;
	/**
	 * 
	 */
	private String createUser;

	/**
	 * 
	 */
	private String editUser;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 别名
	 */
	private String aliasName;
	/**
	 * comments 备注
	 */
	private String comments1;
	/**
	 * comments 备注
	 */
	private String comments2;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public int getVersion() {
		return version;
	}
	public void setVersion(int version) {
		this.version = version;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getEditTime() {
		return editTime;
	}
	public void setEditTime(Date editTime) {
		this.editTime = editTime;
	}
	public String getCreateUser() {
		return createUser;
	}
	public void setCreateUser(String createUser) {
		this.createUser = createUser;
	}
	public String getEditUser() {
		return editUser;
	}
	public void setEditUser(String editUser) {
		this.editUser = editUser;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAliasName() {
		return aliasName;
	}
	public void setAliasName(String aliasName) {
		this.aliasName = aliasName;
	}
	public String getComments1() {
		return comments1;
	}
	public void setComments1(String comments1) {
		this.comments1 = comments1;
	}
	public String getComments2() {
		return comments2;
	}
	public void setComments2(String comments2) {
		this.comments2 = comments2;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "id=" + id + ", version=" + version + ", createTime=" + createTime + ", editTime="
				+ editTime + ", createUser=" + createUser + ", editUser=" + editUser + ", name=" + name + ", aliasName="
				+ aliasName + ", comments1=" + comments1 + ", comments2=" + comments2;
	}
	
	
}
