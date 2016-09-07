package com.easytoolsoft.easyreport.data.membership.po;

import java.io.Serializable;
import java.util.Date;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 系统权限(ezrpt_member_permission表)持久化类
 *
 * @author Tom Dengp
 */
@SuppressWarnings("serial")
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Permission implements Serializable {
	/**
	 * 系统操作标识
	 */
	private Integer id;
	/**
	 * 系统模块标识
	 */
	private Integer moduleId;
	/**
	 * 系统操作名称
	 */
	private String name;
	/**
	 * 系统操作唯一代号
	 */
	private String code;
	/**
	 * 系统操作的排序顺序
	 */
	private Integer sequence;
	/**
	 * 系统操作备注
	 */
	private String comment;
	/**
	 * 系统操作记录创建时间
	 */
	private Date gmtCreated;
	/**
	 * 系统操作记录更新时间戳
	 */
	private Date gmtModified;
	/**
	 * 系统操作所属模块树路径
	 */
	private String path;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getModuleId() {
		return moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
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

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
