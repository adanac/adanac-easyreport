package com.easytoolsoft.easyreport.data.metadata.po;

import java.io.Serializable;
import java.util.Date;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

/**
 * 报表(ezrpt_meta_report表)持久化类
 *
 * @author Tom Deng
 */
@SuppressWarnings("serial")
@Data
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class Report implements Serializable {
	/**
	 * 报表ID
	 */
	private Integer id;
	/**
	 * 报表唯一ID,由接口调用方传入
	 */
	private String uid;
	/**
	 * 报表分类id
	 */
	private Integer categoryId;
	/**
	 * 数据源ID
	 */
	private Integer dsId;
	/**
	 * 报表名称
	 */
	private String name;
	/**
	 * 报表SQL语句
	 */
	private String sqlText;
	/**
	 * 报表列集合元数据(JSON格式)
	 */
	private String metaColumns;
	/**
	 * 查询条件列属性集合(JSON格式)
	 */
	private String queryParams;
	/**
	 * 报表配置选项(JSON格式)
	 */
	private String options;
	/**
	 * 报表树型结构路径
	 */
	private String path;
	/**
	 * 报表状态（1表示锁定，0表示编辑)
	 */
	private Integer status;
	/**
	 * 报表节点在其父节点中的顺序
	 */
	private Integer sequence;
	/**
	 * 说明备注
	 */
	private String comment;
	/**
	 * 创建用户
	 */
	private String createUser;
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

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public Integer getDsId() {
		return dsId;
	}

	public void setDsId(Integer dsId) {
		this.dsId = dsId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSqlText() {
		return sqlText;
	}

	public void setSqlText(String sqlText) {
		this.sqlText = sqlText;
	}

	public String getMetaColumns() {
		return metaColumns;
	}

	public void setMetaColumns(String metaColumns) {
		this.metaColumns = metaColumns;
	}

	public String getQueryParams() {
		return queryParams;
	}

	public void setQueryParams(String queryParams) {
		this.queryParams = queryParams;
	}

	public String getOptions() {
		return options;
	}

	public void setOptions(String options) {
		this.options = options;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
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

	public String getCreateUser() {
		return createUser;
	}

	public void setCreateUser(String createUser) {
		this.createUser = createUser;
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
