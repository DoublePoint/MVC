/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.taglib.ajaxdatagrid;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.servlet.jsp.PageContext;

public class AjaxDataGrid {
	private String width = "400px";
	  private String height = "300px";
	  private String groupField = "";
	  private String grouptitle = "";
	  private boolean showQueryBar = false;
	  private boolean showpagerbar = true;
	  private String customtooltipfunc = "";
	  private String type = "";
	  private int startyear = 1900;
	  Calendar calendar = Calendar.getInstance();
	  private int endyear = this.calendar.get(1) + 50;
	  private boolean collapseoninit = false;
	  private boolean initData = true;
	  private boolean showPager = true;
	  private boolean supportFilter = false;
	  private boolean supportOrder = false;
	  private boolean supportToExcel = false;
	  private boolean supportToExcelFull = false;
	  private boolean supportToPdf = false;
	  private boolean supportToPdfFull = false;
	  private boolean customExport = false;
	  private boolean showToolBar = true;
	  private boolean supportAdd = true;
	  private boolean supportDelete = true;
	  private boolean supportRefresh = true;
	  private String titleAlign = "center";
	  private boolean nowrap = false;
	  private int lockedRowNum = 1;
	  private int lockedColumnNum = 0;
	  private int rowOfPage = 10;
	  private int largeDataThreshold = 100;
	  private boolean clientSortable = true;
	  private boolean readonly = false;
	  private String preSubmit = "";
	  private String postSubmit = "";
	  private String onready = "";
	  private String rowStyleFunc = "";
	  private String cellStyleFunc = "";
	  private String queryFunc = "query";
	  private List<Map<String, Object>> gridColumnList = new ArrayList();
	  private String action = "";
	  private String url = "";
	  private String rowHeight = "26";
	  private String contextPath;
	  private String colModelKey;
	  private String postInit;
	  private boolean customRowNum = false;
	  private boolean showtooltip = false;
	  private boolean isPercentLayout = false;
	  private boolean escapeHtml = true;
	  private boolean showtipsonturnpage = true;
	  private boolean isexporthidecols = false;
	  private Map<String, String> tagList;
	  private PageContext pageContext;
	  private String onContextMenu;
	  
	  public void setStartyear(int startyear)
	  {
	    this.startyear = startyear;
	  }
	  
	  public void setEndyear(int endyear)
	  {
	    this.endyear = endyear;
	  }
	  
	  public void setShowpagerbar(boolean showpagerbar)
	  {
	    this.showpagerbar = showpagerbar;
	  }
	  
	  
	  public void setCollapseoninit(boolean collapseoninit)
	  {
	    this.collapseoninit = collapseoninit;
	  }
	  
	  public void setShowtipsonturnpage(boolean showtipsonturnpage)
	  {
	    this.showtipsonturnpage = showtipsonturnpage;
	  }
	  
	  public void setIsexporthidecols(boolean isexporthidecols)
	  {
	    this.isexporthidecols = isexporthidecols;
	  }
	  
	  public void setShowtooltip(boolean showtooltip)
	  {
	    this.showtooltip = showtooltip;
	  }
	  
	  public void setCustomrownum(boolean customrownum)
	  {
	    this.customRowNum = customrownum;
	  }
	  
	  public void setTagList(Map<String, String> tagList)
	  {
	    this.tagList = tagList;
	  }
	  
	  public void setPageContext(PageContext pageContext)
	  {
	    this.pageContext = pageContext;
	  }
	  
	  public void setOnContextMenu(String onContextMenu)
	  {
	    this.onContextMenu = onContextMenu;
	  }
	  
	  protected String getDefaultTemplate()
	  {
	    return "ajaxdatagrid/ajaxdatagrid";
	  }
	  
	  public void setWidth(String width)
	  {
	    this.width = width;
	  }
	  
	  public void setHeight(String height)
	  {
	    this.height = height;
	  }
	  
	  public void setGroupField(String groupField)
	  {
	    this.groupField = groupField;
	  }
	  
	  public void setShowQueryBar(boolean showQueryBar)
	  {
	    this.showQueryBar = showQueryBar;
	  }
	  
	  public void setGrouptitle(String grouptitle)
	  {
	    this.grouptitle = grouptitle;
	  }
	  
	  public void setInitData(boolean initData)
	  {
	    this.initData = initData;
	  }
	  
	  public void setShowPager(boolean showPager)
	  {
	    this.showPager = showPager;
	  }
	  
	  public void setSupportFilter(boolean supportFilter)
	  {
	    this.supportFilter = supportFilter;
	  }
	  
	  public void setSupportOrder(boolean supportOrder)
	  {
	    this.supportOrder = supportOrder;
	  }
	  
	  public void setSupportToExcel(boolean supportToExcel)
	  {
	    this.supportToExcel = supportToExcel;
	  }
	  
	  public void setSupportToExcelFull(boolean supportToExcelFull)
	  {
	    this.supportToExcelFull = supportToExcelFull;
	  }
	  
	  public void setSupportToPdf(boolean supportToPdf)
	  {
	    this.supportToPdf = supportToPdf;
	  }
	  
	  public void setSupporttopdffull(boolean supportToPdfFull)
	  {
	    this.supportToPdfFull = supportToPdfFull;
	  }
	  
	  public void setCustomExport(boolean customExport)
	  {
	    this.customExport = customExport;
	  }
	  
	  public void setShowToolBar(boolean showToolBar)
	  {
	    this.showToolBar = showToolBar;
	  }
	  
	  public void setSupportAdd(boolean supportAdd)
	  {
	    this.supportAdd = supportAdd;
	  }
	  
	  public void setPostinit(String postInit)
	  {
	    this.postInit = postInit;
	  }
	  
	  public void setSupportDelete(boolean supportDelete)
	  {
	    this.supportDelete = supportDelete;
	  }
	  
	  public void setSupportRefresh(boolean supportRefresh)
	  {
	    this.supportRefresh = supportRefresh;
	  }
	  
	  public void setNowrap(boolean nowrap)
	  {
	    this.nowrap = nowrap;
	  }
	  
	  public void setTitleAlign(String titleAlign)
	  {
	    this.titleAlign = titleAlign;
	  }
	  
	  public void setLockedRowNum(int lockedRowNum)
	  {
	    this.lockedRowNum = lockedRowNum;
	  }
	  
	  public void setLockedColumnNum(int lockedColumnNum)
	  {
	    this.lockedColumnNum = lockedColumnNum;
	  }
	  
	  public void setContextPath(String contextPath)
	  {
	    this.contextPath = contextPath;
	  }
	  
	  public void setGridColumnList(List<Map<String, Object>> gridColumnList)
	  {
	    this.gridColumnList = gridColumnList;
	  }
	  
	  public void setAction(String action)
	  {
	    this.action = action;
	  }
	  
	  public void setRowOfPage(int rowOfPage)
	  {
	    this.rowOfPage = rowOfPage;
	  }
	  
	  public void setClientSortable(boolean clientSortable)
	  {
	    this.clientSortable = clientSortable;
	  }
	  
	  public void setReadonly(boolean readonly)
	  {
	    this.readonly = readonly;
	  }
	  
	  public void setRowHeight(String rowHeight)
	  {
	    this.rowHeight = rowHeight;
	  }
	  
	  public void setPreSubmit(String preSubmit)
	  {
	    this.preSubmit = preSubmit;
	  }
	  
	  public void setPostSubmit(String postSubmit)
	  {
	    this.postSubmit = postSubmit;
	  }
	  
	  public void setOnready(String onready)
	  {
	    this.onready = onready;
	  }
	  
	  public void setRowStyleFunc(String rowStyleFunc)
	  {
	    this.rowStyleFunc = rowStyleFunc;
	  }
	  
	  public void setCellStyleFunc(String cellStyleFunc)
	  {
	    this.cellStyleFunc = cellStyleFunc;
	  }
	  
	  public void setUrl(String url)
	  {
	    this.url = url;
	  }
	  
	  public void setLargeDataThreshold(int largeDataThreshold)
	  {
	    this.largeDataThreshold = largeDataThreshold;
	  }
	  
	  public void setQueryFunc(String queryFunc)
	  {
	    this.queryFunc = queryFunc;
	  }
	  
	  public void setColModelKey(String colModelKey)
	  {
	    this.colModelKey = colModelKey;
	  }
	  
	  public void setSupportToPdfFull(boolean supportToPdfFull)
	  {
	    this.supportToPdfFull = supportToPdfFull;
	  }
	  
	  public void setPostInit(String postInit)
	  {
	    this.postInit = postInit;
	  }
	  
	  public void setCustomRowNum(boolean customRowNum)
	  {
	    this.customRowNum = customRowNum;
	  }
	  
	  public void setPercentLayout(boolean isPercentLayout)
	  {
	    this.isPercentLayout = isPercentLayout;
	  }
	  
	  public void setEscapeHtml(boolean escapeHtml)
	  {
	    this.escapeHtml = escapeHtml;
	  }
	  
	  public void setCustomtooltipfunc(String customtooltipfunc)
	  {
	    this.customtooltipfunc = customtooltipfunc;
	  }
	  
	  public String getType()
	  {
	    return this.type;
	  }
	  
	  public void setType(String type)
	  {
	    this.type = type;
	  }
}
