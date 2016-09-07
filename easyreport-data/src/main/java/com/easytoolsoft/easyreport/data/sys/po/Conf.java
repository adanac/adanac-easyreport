package com.easytoolsoft.easyreport.data.sys.po;

import java.io.Serializable;
import java.util.Date;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统配置(ezrpt_sys_conf表)持久化类
 *
 * @author Tom Deng
 */
@SuppressWarnings("serial")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Conf implements Serializable {
	/**
	 * 配置字典ID
	 */
	private Integer id;
	/**
	 * 父ID
	 */
	private Integer parentId;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 配置key
	 */
	private String key;
	/**
	 * 配置值
	 */
	private String value;
	/**
	 * 显示顺序
	 */
	private Integer sequence;
	/**
	 * 配置说明
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
	/**
	 * 是否有子配置项
	 */
	private boolean hasChild;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Integer getSequence() {
		return sequence;
	}

	public void setSequence(Integer sequence) {
		this.sequence = sequence;
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

	public boolean isHasChild() {
		return hasChild;
	}

	public void setHasChild(boolean hasChild) {
		this.hasChild = hasChild;
	}

	@Override
	public String toString() {
		return "Conf [id=" + id + ", parentId=" + parentId + ", name=" + name + ", key=" + key + ", value=" + value
				+ ", sequence=" + sequence + ", comment=" + comment + ", gmtCreated=" + gmtCreated + ", gmtModified="
				+ gmtModified + ", hasChild=" + hasChild + "]";
	}

}
