/** 
* 创建人： 刘磊
* 创建时间：2017-9-25 下午11:16:41 
* 类说明 ：
* 修改人：          修改日期：
*/
package cn.doublepoint.common.util.domain.model.entity;

import static java.util.stream.Collectors.toList;

import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;

import cn.doublepoint.common.util.StringUtil;
import cn.doublepoint.common.util.domain.model.BaseModel;

public class BaseEntity extends BaseModel {

	private List<Field> realFieldList;

	/**
	 * 获取批量更新sql
	 * 
	 * @return
	 */
	@Override
	public String getSelectSql() {
		realFieldList = new ArrayList<Field>();
		final StringBuilder sb = new StringBuilder("select ");
		Field[] allFields = this.getClass().getDeclaredFields();
		for (int i = 0; i < allFields.length; i++) {
			Field field = allFields[i];
			Column columnAnnotation = field.getAnnotation(Column.class);
			if (columnAnnotation != null) {
				String fieldName = columnAnnotation.name();
				if (StringUtil.isNullOrEmpty(fieldName))
					fieldName = field.getName();
				sb.append(fieldName).append(",");
				realFieldList.add(field);
			}
		}
		if (',' != sb.charAt(sb.length() - 1))
			return "";

		// 如果最后一个为,则删除
		sb.deleteCharAt(sb.length() - 1);
		sb.append(" from ").append(getTableName());
		return sb.toString();
	}

	/**
	 * 获取批量更新sql
	 * 
	 * @return
	 */
	@Override
	public String getUpdateSql() {
		realFieldList = new ArrayList<Field>();
		final StringBuilder sb = new StringBuilder("update ");
		sb.append(getTableName());
		sb.append(" set ");
		String idFieldName = null;
		Field idField = null;
		Field[] allFields = this.getClass().getDeclaredFields();
		for (int i = 0; i < allFields.length; i++) {
			Field field = allFields[i];
			Id idAnnotation = field.getAnnotation(Id.class);

			Column columnAnnotation = field.getAnnotation(Column.class);
			if (columnAnnotation != null) {
				String fieldName = columnAnnotation.name();
				if (StringUtil.isNullOrEmpty(fieldName))
					fieldName = field.getName();
				if (idAnnotation != null) {
					idFieldName = fieldName;
					idField = field;
					continue;
				}
				sb.append(fieldName).append("=?,");
				realFieldList.add(field);
			}
		}
		if (',' != sb.charAt(sb.length() - 1))
			return "";

		// 如果最后一个为,则删除
		sb.deleteCharAt(sb.length() - 1);
		if (idField != null) {
			sb.append(" where ").append(idFieldName).append("=?");
			realFieldList.add(idField);
		}
		return sb.toString();
	}

	/**
	 * 获取批量插入Sql
	 * 
	 * @return
	 */
	public String getInsertSql() {
		realFieldList = new ArrayList<Field>();
		final StringBuilder sb = new StringBuilder("INSERT INTO  ");
		sb.append(getTableName()).append("(");
		final StringBuilder sbVal = new StringBuilder("( ");
		Field[] allFields = getAllField();
		for (int i = 0; i < allFields.length; i++) {
			Field field = allFields[i];
			Column columnAnnotation = field.getAnnotation(Column.class);
			if (columnAnnotation != null) {
				String fieldName = columnAnnotation.name();
				if (StringUtil.isNullOrEmpty(fieldName))
					fieldName = field.getName();
				sb.append(fieldName).append(",");
				sbVal.append("?,");
				realFieldList.add(field);
			}
		}

		if (',' != sb.charAt(sb.length() - 1))
			return "";
		// 如果最后一个为","则删除
		sb.deleteCharAt(sb.length() - 1);
		sbVal.deleteCharAt(sbVal.length() - 1);
		sb.append(") ").append(" VALUES ");
		sbVal.append(") ");
		sb.append(sbVal);
		return sb.toString();
	}

	/**
	 * 获取参数
	 * 
	 * @param queryModelList
	 * @return
	 */
	public <T> List<Object[]> getQueryParamList(List<T> queryModelList) {
		List<Object[]> queryParamsList = queryModelList.stream().map(queryModel -> {
			return realFieldList.stream().map(fieldItem -> {
				try {
					fieldItem.setAccessible(true);
					return fieldItem.get(queryModel);
				} catch (Exception e) {
					e.printStackTrace();
				}
				return queryModel;
			}).toArray(Object[]::new);
		}).collect(toList());
		return queryParamsList;
	}

	private String getTableName() {
		Annotation annotation = this.getClass().getAnnotation(Table.class);
		String tableName = "";
		if (annotation != null)
			tableName = ((Table) annotation).name();
		return tableName;
	}

	private Field[] getAllField() {
		Field[] allFields = this.getClass().getDeclaredFields();
		return allFields;
	}
}
