package com.easytoolsoft.easyreport.data.metadata.po;

import java.io.Serializable;
import java.util.Date;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 报表数据源(ezrpt_meta_datasource表)持久化类
 *
 * @author Tom Deng
 */
@SuppressWarnings("serial")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class DataSource implements Serializable {
	/**
	 * 数据源ID
	 */
	private Integer id;
	/**
	 * 数据源唯一ID,由调接口方传入
	 */
	private String uid;
	/**
	 * 数据源名称
	 */
	private String name;
	/**
	 * 数据源驱动类
	 */
	private String driverClass;
	/**
	 * 数据源连接字符串(JDBC)
	 */
	private String jdbcUrl;
	/**
	 * 数据源登录用户名
	 */
	private String user;
	/**
	 * 数据源登录密码
	 */
	private String password;
	/**
	 * 数据源配置选项(JSON格式）
	 */
	private String options;
	/**
	 * 说明备注
	 */
	private String comment;
	/**
	 * 记录创建时间
	 */
	private Date gmtCreated;
	/**
	 * 记录修改时间
	 */
	private Date gmtModified;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDriverClass() {
		return driverClass;
	}

	public void setDriverClass(String driverClass) {
		this.driverClass = driverClass;
	}

	public String getJdbcUrl() {
		return jdbcUrl;
	}

	public void setJdbcUrl(String jdbcUrl) {
		this.jdbcUrl = jdbcUrl;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Date getGmtCreated() {
		return gmtCreated;
	}

	public void setGmtCreated(Date gmtCreated) {
		this.gmtCreated = gmtCreated;
	}

	public Date getGmtModified() {
		return gmtModified;
	}

	public void setGmtModified(Date gmtModified) {
		this.gmtModified = gmtModified;
	}

}
