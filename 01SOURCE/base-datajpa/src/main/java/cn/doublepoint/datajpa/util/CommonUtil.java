/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年12月29日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.datajpa.util;

import java.lang.reflect.Field;
import java.util.Arrays;

import javax.persistence.Column;

import org.apache.commons.lang.ObjectUtils.Null;

import com.querydsl.core.types.Expression;
import com.querydsl.core.types.Predicate;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.SimpleExpression;
import com.querydsl.core.types.dsl.StringPath;

import cn.doublepoint.commonutil.domain.model.StringUtil;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParam;
import cn.doublepoint.commonutil.port.adapter.persistence.QueryParamList;

public class CommonUtil {
	@SuppressWarnings("rawtypes")
	public <T extends EntityPathBase>Predicate CopyToPredicate(Class<T> clazz,QueryParamList aQueryParamList) {
		if (aQueryParamList==null)
				return null;
		aQueryParamList.getParams().stream().map(mapper)
	}

	
	@SuppressWarnings("rawtypes")
	public <T extends EntityPathBase> Predicate CopyToPredicate(Class<T> clazz, QueryParam aQueryParam) {
		try {
			EntityPathBase queryEntity = clazz.newInstance();
			Field[] allFields = clazz.getDeclaredFields();
			Arrays.stream(allFields).map(field -> {
				// 如果参数名称与实体的某个属性名称一致则创建断言
				if (aQueryParam.getName().equals(field.getName())) {
					field.setAccessible(true);
					try {

						return field.get(queryEntity);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				return null;
			});

			// for (int i = 0; i < allFields.length; i++) {
			// Field field = allFields[i];
			// Column columnAnnotation = field.getAnnotation(Column.class);
			// if (columnAnnotation != null) {
			// String fieldName = columnAnnotation.name();
			// if (StringUtil.isNullOrEmpty(fieldName))
			// fieldName = field.getName();
			// sb.append(fieldName).append(",");
			// realFieldList.add(field);
			// }
			// }
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	private Predicate switchPredicateByQueryParamRelation(SimpleExpression aSimpleExpression, QueryParam aQueryParam) {
		switch (aQueryParam.getRelation()) {
		// public static final String RELATION_GT = ">";
		// public static final String RELATION_LT = "<";
		// public static final String RELATION_GE = ">=";
		// public static final String RELATION_LE = "<=";
		// public static final String RELATION_NOTEQUAL = "<>";
		// public static final String RELATION_LIKE = "LIKE";
		// public static final String RELATION_ISNULL = "IS NULL";
		// public static final String RELATION_NOTNULL = "IS NOT NULL";
		// public static final String RELATION_IN = "IN";
		// public static final String RELATION_NOTIN = "NOT IN";
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_GT:
			return aSimpleExpression.(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		case QueryParam.RELATION_EQUAL:
			return aSimpleExpression.eq(aQueryParam.getValue());
		default:
			break;
		}
	}
}
