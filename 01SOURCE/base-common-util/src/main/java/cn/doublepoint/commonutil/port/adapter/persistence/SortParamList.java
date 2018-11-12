///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年12月26日
//* 
//* 类   说   明 ：
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package cn.doublepoint.commonutil.port.adapter.persistence;
//
//import java.util.ArrayList;
//import java.util.List;
//
//import cn.doublepoint.commonutil.StringUtil;
//
//public class SortParamList {
//	private List<SortParam> params = new ArrayList();
//
//	public void addParam(SortParam param) {
//		if ((param == null) || (param.getSortProperty() == null) || ("".equals(param.getSortProperty()))) {
//			return;
//		}
//		this.params.add(param);
//	}
//	
//	public void addParam(String property) {
//		SortParam sortParam = new SortParam(property, EnumSortParamType.ASC);
//		this.params.add(sortParam);
//	}
//
//	public void addParam(String property, EnumSortParamType sortParamType) {
//		SortParam sortParam = new SortParam(property, sortParamType);
//		this.params.add(sortParam);
//	}
//
////	public void addParam(String property, String type, String alias) {
////		SortParam sortParam = new SortParam(property, type, alias);
////		this.params.add(sortParam);
////	}
//
//	public List<SortParam> getParams() {
//		return this.params;
//	}
//
//	public void setParams(List<SortParam> params) {
//		this.params = params;
//	}
//
//	public int size() {
//		return this.params == null ? 0 : this.params.size();
//	}
//
//	public boolean hasParam(String paramName) {
//		if (this.params == null) {
//			return false;
//		}
//		return this.params.contains(paramName);
//	}
//
//	public String getSortSql() {
//		StringBuilder sb = new StringBuilder(" ORDER BY ");
//		for (int i = 0; i < params.size(); i++) {
//			SortParam param = params.get(i);
//			sb.append(param.getSortProperty()).append(" ").append(param.getSortType()).append(",");
//		}
//		if (',' != sb.charAt(sb.length() - 1))
//			return "";
//		// 如果最后一个为","则删除
//		sb.deleteCharAt(sb.length() - 1);
//		return sb.toString();
//
//	}
//	
//	public SortParam get(String paramName){
//		if (StringUtil.isNullOrEmpty(paramName)) {
//			return null;
//		}
//		for (SortParam param : this.params) {
//			if (paramName.equals(param.getSortProperty())) {
//				return param;
//			}
//		}
//		return null;
//	}
//}
