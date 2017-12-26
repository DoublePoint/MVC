///** 
//* 创   建   人： 刘磊
//* 
//* 创   建   时   间 ： 2017年12月25日
//* 
//* 类   说   明 ：
//* 
//* 修   改   人：          修   改   日   期：
//*/
//package dao;
//
//import java.util.List;
//
//import javax.annotation.Resource;
//
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.jdbc.core.RowMapper;
//
//import cn.doublepoint.base.common.domain.model.commontype.Pager;
//
//public class Pagination {
//
//	@Resource
//	private JdbcTemplate jTemplate;
//
//	public Pagination() {
//
//	}
//
//	/**
//	 * 分页构造函数
//	 * 
//	 * @param sql
//	 *            根据传入的sql语句得到一些基本分页信息
//	 * @param currentPage
//	 *            当前页
//	 * @param numPerPage
//	 *            每页记录数
//	 * @param jTemplate
//	 *            JdbcTemplate实例
//	 */
//	@SuppressWarnings("unchecked")
//	public Pagination(String sql, Pager pager, JdbcTemplate jTemplate, RowMapper rowMapper) {
//		long totalElementCount=getTotalElementCount(sql);
//		pager.setTotalElementCount(totalElementCount);
//		
//		StringBuilder paginationSQL = new StringBuilder(" ");
//		paginationSQL.append(sql);
//		paginationSQL.append(" limit( " + pager.getStart() + "," + pager.getEnd() + ")");
//		// 装入结果集
//		setResultList(jTemplate.query(paginationSQL.toString(), rowMapper));
//	}
//
//	/**
//	 * @param args
//	 */
//	public int getCurrentPage() {
//		return currentPage;
//	}
//
//	public void setCurrentPage(int currentPage) {
//		this.currentPage = currentPage;
//	}
//
//	public int getNumPerPage() {
//		return numPerPage;
//	}
//
//	public void setNumPerPage(int numPerPage) {
//		this.numPerPage = numPerPage;
//	}
//
//	public int getTotalPages() {
//		return totalPages;
//	}
//
//	// 计算总页数
//	public void setTotalPages() {
//		if (totalRows % numPerPage == 0) {
//			this.totalPages = totalRows / numPerPage;
//		} else {
//			this.totalPages = (totalRows / numPerPage) + 1;
//		}
//	}
//
//	public int getTotalRows() {
//		return totalRows;
//	}
//
//	public void setTotalRows(int totalRows) {
//		this.totalRows = totalRows;
//	}
//
//	public int getStartIndex() {
//		return startIndex;
//	}
//
//	public void setStartIndex() {
//		this.startIndex = (currentPage - 1) * numPerPage;
//	}
//
//	public int getLastIndex() {
//		return lastIndex;
//	}
//
//	public JdbcTemplate getJTemplate() {
//		return jTemplate;
//	}
//
//	public void setJTemplate(JdbcTemplate template) {
//		jTemplate = template;
//	}
//	// 计算结束时候的索引
//
//	public void setLastIndex() {
//		System.out.println("totalRows=" + totalRows);// /////////
//		System.out.println("numPerPage=" + numPerPage);// /////////
//		if (totalRows < numPerPage) {
//			this.lastIndex = totalRows;
//		} else if ((totalRows % numPerPage == 0) || (totalRows % numPerPage != 0 && currentPage < totalPages)) {
//			this.lastIndex = currentPage * numPerPage;
//		} else if (totalRows % numPerPage != 0 && currentPage == totalPages) {// 最后一页
//			this.lastIndex = totalRows;
//		}
//	}
//
//	public List getResultList() {
//		return resultList;
//	}
//
//	public void setResultList(List resultList) {
//		this.resultList = resultList;
//	}
//
//	/**
//	 * 获取总条数
//	 * @param sql
//	 * @return
//	 */
//	private long getTotalElementCount(String sql) {
//		StringBuilder totalSQL = new StringBuilder(" SELECT count(*) FROM ( ");
//		totalSQL.append(sql);
//		totalSQL.append(" ) totalTable ");
//		// 总记录数
//		return jTemplate.queryForObject(totalSQL.toString(), Integer.class).intValue();
//
//	}
//}
