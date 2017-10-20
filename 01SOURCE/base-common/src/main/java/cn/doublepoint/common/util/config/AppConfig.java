/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2017年10月20日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/ 
package cn.doublepoint.common.util.config;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.logging.Log;

import cn.doublepoint.common.util.ApplicationUtil;

public class AppConfig {
	private static final long serialVersionUID = 1L;
	  private static Log logger = null;
	  private String enterpriseName = "刘先森 框架基础代码";
	  private String applicationCode = "APPLICATION";
	  
	  public String getApplicationCode()
	  {
	    return this.applicationCode;
	  }
	  
	  public void setApplicationCode(String applicationCode)
	  {
	    this.applicationCode = applicationCode;
	  }
	  
	  private String applicationName = "刘先森 框架基础代码";
	  protected String databaseType = "ORACLE";
	  private boolean runInDebugMode = true;
	  private String rightPolicyMappingFile = "/WEB-INF/config/rightPolicyMapping.xml";
	  private String excelTempDirectory;
	  private int genExcelRowsLimit = 10000;
	  private Map<String, String> extProp = new HashMap();
	  private Map rightPolicyMapping = new HashMap();
	  private boolean runInCluster = false;
	  private boolean performLoginControl = false;
	  private long sessionValidCheckPeriod = 10000L;
	  protected long sessionValidTimeOut = 60000L;
	  private boolean performDistinctSignin = false;
	  private boolean collectPerformance = false;
	  private String webHelpIndexPath = "d:\\help_index";
	  private boolean useSessionIdAsKey = true;
	  private String frameworkTaskMode = "SINGLE_TASK";
	  private boolean permitFlexToServerLog = true;
	  private String homePageUrl;
	  private boolean performSafetyMethodIntercept = true;
	  private int maxMultiTaskNumber = 5;
	  private boolean widgetCloseable = true;
	  private boolean widgetResizable = true;
	  private String uploadPath = "d:\\";
	  private int maxPostSize = 104857600;
	  private boolean suportRemoteMonitor = false;
	  private int showFuncNum = 10;
	  private String theme = "haiyisoft";
	  private boolean isMultitask = true;
	  private String loginBeanName = "flexExLoginImpl";
	  private boolean useloginValidateCode = false;
	  private boolean taskDirectClosable = false;
	  
	  public boolean isTaskDirectClosable()
	  {
	    return this.taskDirectClosable;
	  }
	  
	  public void setTaskDirectClosable(boolean taskDirectClosable)
	  {
	    this.taskDirectClosable = taskDirectClosable;
	  }
	  
	  private boolean usePki = false;
	  private String pkiKey;
	  
	  public boolean isUsePki()
	  {
	    return this.usePki;
	  }
	  
	  public void setUsePki(boolean usePki)
	  {
	    this.usePki = usePki;
	  }
	  
	  public String getPkiKey()
	  {
	    return this.pkiKey;
	  }
	  
	  public void setPkiKey(String pkiKey)
	  {
	    this.pkiKey = pkiKey;
	  }
	  
	  private String remoteMonitorDestination = "FlexADPTopic";
	  private boolean useSpringSecurity = false;
	  private boolean sequenceTransaction = true;
	  private boolean rightItemUseCache = true;
	  private Map appExtProp;
	  
	  public Map getAppExtProp()
	  {
	    return this.appExtProp;
	  }
	  
	  public void setAppExtProp(Map appExtProp)
	  {
	    this.appExtProp = appExtProp;
	  }
	  
	  public boolean isUseSpringSecurity()
	  {
	    return this.useSpringSecurity;
	  }
	  
	  public void setUseSpringSecurity(boolean useSpringSecurity)
	  {
	    this.useSpringSecurity = useSpringSecurity;
	  }
	  
	  public String getRemoteMonitorDestination()
	  {
	    return this.remoteMonitorDestination;
	  }
	  
	  public void setRemoteMonitorDestination(String remoteMonitorDestination)
	  {
	    this.remoteMonitorDestination = remoteMonitorDestination;
	  }
	  
	  public boolean isSuportRemoteMonitor()
	  {
	    return this.suportRemoteMonitor;
	  }
	  
	  public void setSuportRemoteMonitor(boolean suportRemoteMonitor)
	  {
	    this.suportRemoteMonitor = suportRemoteMonitor;
	  }
	  
	  public boolean isPerformSafetyMethodIntercept()
	  {
	    return this.performSafetyMethodIntercept;
	  }
	  
	  public void setPerformSafetyMethodIntercept(boolean performMethodIntercept)
	  {
	    this.performSafetyMethodIntercept = performMethodIntercept;
	  }
	  
	  public String getHomePageUrl()
	  {
	    return this.homePageUrl;
	  }
	  
	  public void setHomePageUrl(String homePageUrl)
	  {
	    this.homePageUrl = homePageUrl;
	  }
	  
	  public AppConfig()
	    throws Exception
	  {}
	  
	  public String getApplicationName()
	  {
	    return this.applicationName;
	  }
	  
	  public void setApplicationName(String applicationName)
	  {
	    this.applicationName = applicationName;
	  }
	  
	  public String getExtProp(String key)
	  {
	    String value = (String)this.extProp.get(key);
	    if (value == null) {
	      logger.warn("LL：没有配置执行的应用参数：" + key + "，将使用默认配置");
	    }
	    return value;
	  }
	  
	  public void setExtProp(String key, String value)
	  {
	    if (this.extProp.containsKey(key)) {
	      logger.warn("LL：应用系统配置中已经包含了参数：" + key + "，将对该参数值进行覆盖");
	    }
	    this.extProp.put(key, value);
	  }
	  
	  public String getEnterpriseName()
	  {
	    return this.enterpriseName;
	  }
	  
	  public void setEnterpriseName(String enterpriseName)
	  {
	    this.enterpriseName = enterpriseName;
	  }
	  
	  public String getExcelTempDirectory()
	  {
	    return this.excelTempDirectory;
	  }
	  
	  public void setExcelTempDirectory(String excelTempDirectory)
	  {
	    this.excelTempDirectory = excelTempDirectory;
	  }
	  
	  public Map<String, String> getExtProp()
	  {
	    return this.extProp;
	  }
	  
	  public void setExtProp(Map<String, String> extProp)
	  {
	    this.extProp = extProp;
	  }
	  
	  public String getFrameworkTaskMode()
	  {
	    return this.frameworkTaskMode;
	  }
	  
	  public void setFrameworkTaskMode(String frameworkTaskMode)
	  {
	    this.frameworkTaskMode = frameworkTaskMode;
	  }
	  
	  public int getGenExcelRowsLimit()
	  {
	    return this.genExcelRowsLimit;
	  }
	  
	  public void setGenExcelRowsLimit(int genExcelRowsLimit)
	  {
	    this.genExcelRowsLimit = genExcelRowsLimit;
	  }
	  
	  public boolean isCollectPerformance()
	  {
	    return this.collectPerformance;
	  }
	  
	  public void setCollectPerformance(boolean performActionExecInfoCollect)
	  {
	    this.collectPerformance = performActionExecInfoCollect;
	  }
	  
	  public boolean isPerformDistinctSignin()
	  {
	    return this.performDistinctSignin;
	  }
	  
	  public void setPerformDistinctSignin(boolean performDistinctSignin)
	  {
	    this.performDistinctSignin = performDistinctSignin;
	  }
	  
	  public boolean isPerformLoginControl()
	  {
	    return this.performLoginControl;
	  }
	  
	  public void setPerformLoginControl(boolean performLoginControl)
	  {
	    this.performLoginControl = performLoginControl;
	  }
	  
	  public Map getRightPolicyMapping()
	  {
	    return this.rightPolicyMapping;
	  }
	  
	  public void setRightPolicyMapping(Map rightPolicyMapping)
	  {
	    this.rightPolicyMapping = rightPolicyMapping;
	  }
	  
	  public String getRightPolicyMappingFile()
	  {
	    return this.rightPolicyMappingFile;
	  }
	  
	  public void setRightPolicyMappingFile(String rightPolicyMappingFile)
	  {
	    this.rightPolicyMappingFile = rightPolicyMappingFile;
	  }
	  
	  public boolean isRunInCluster()
	  {
	    return this.runInCluster;
	  }
	  
	  public void setRunInCluster(boolean runInCluster)
	  {
	    this.runInCluster = runInCluster;
	  }
	  
	  public boolean isRunInDebugMode()
	  {
	    return this.runInDebugMode;
	  }
	  
	  public void setRunInDebugMode(boolean runInDebugMode)
	  {
	    this.runInDebugMode = runInDebugMode;
	  }
	  
	  public boolean isUseSessionIdAsKey()
	  {
	    return this.useSessionIdAsKey;
	  }
	  
	  public void setUseSessionIdAsKey(boolean useSessionIdAsKey)
	  {
	    this.useSessionIdAsKey = useSessionIdAsKey;
	  }
	  
	  public String getWebHelpIndexPath()
	  {
	    return this.webHelpIndexPath;
	  }
	  
	  public void setWebHelpIndexPath(String webHelpIndexPath)
	  {
	    this.webHelpIndexPath = webHelpIndexPath;
	  }
	  
	  public String getDatabaseType()
	  {
	    return this.databaseType;
	  }
	  
	  public void setDatabaseType(String databaseType)
	  {
	    this.databaseType = databaseType;
	  }
	  
	  public boolean isPermitFlexToServerLog()
	  {
	    return this.permitFlexToServerLog;
	  }
	  
	  public void setPermitFlexToServerLog(boolean permitFlexToServerLog)
	  {
	    this.permitFlexToServerLog = permitFlexToServerLog;
	  }
	  
	  public int getMaxMultiTaskNumber()
	  {
	    return this.maxMultiTaskNumber;
	  }
	  
	  public void setMaxMultiTaskNumber(int maxMultiTaskNumber)
	  {
	    this.maxMultiTaskNumber = maxMultiTaskNumber;
	  }
	  
	  public long getSessionValidCheckPeriod()
	  {
	    return this.sessionValidCheckPeriod;
	  }
	  
	  public void setSessionValidCheckPeriod(long sessionValidCheckPeriod)
	  {
	    this.sessionValidCheckPeriod = sessionValidCheckPeriod;
	  }
	  
	  public long getSessionValidTimeOut()
	  {
	    return this.sessionValidTimeOut;
	  }
	  
	  public void setSessionValidTimeOut(long sessionValidTimeOut)
	  {
	    this.sessionValidTimeOut = sessionValidTimeOut;
	  }
	  
	  public int getMaxPostSize()
	  {
	    return this.maxPostSize;
	  }
	  
	  public void setMaxPostSize(int maxPostSize)
	  {
	    this.maxPostSize = maxPostSize;
	  }
	  
	  public String getUploadPath()
	  {
	    return this.uploadPath;
	  }
	  
	  public void setUploadPath(String uploadPath)
	  {
	    this.uploadPath = uploadPath;
	  }
	  
	  public int getShowFuncNum()
	  {
	    return this.showFuncNum;
	  }
	  
	  public void setShowFuncNum(int showFuncNum)
	  {
	    this.showFuncNum = showFuncNum;
	  }
	  
	  public String getLoginBeanName()
	  {
	    return this.loginBeanName;
	  }
	  
	  public void setLoginBeanName(String loginBeanName)
	  {
	    this.loginBeanName = loginBeanName;
	  }
	  
	  public boolean isUseloginValidateCode()
	  {
	    return this.useloginValidateCode;
	  }
	  
	  public void setUseloginValidateCode(boolean useloginValidateCode)
	  {
	    this.useloginValidateCode = useloginValidateCode;
	  }
	  
	  public boolean isSequenceTransaction()
	  {
	    return this.sequenceTransaction;
	  }
	  
	  public void setSequenceTransaction(boolean sequenceTransaction)
	  {
	    this.sequenceTransaction = sequenceTransaction;
	  }
	  
	  public boolean isRightItemUseCache()
	  {
	    return this.rightItemUseCache;
	  }
	  
	  public void setRightItemUseCache(boolean rightItemUseCache)
	  {
	    this.rightItemUseCache = rightItemUseCache;
	  }
	  
	  public boolean isWidgetCloseable()
	  {
	    return this.widgetCloseable;
	  }
	  
	  public void setWidgetCloseable(boolean widgetCloseable)
	  {
	    this.widgetCloseable = widgetCloseable;
	  }
	  
	  public boolean isWidgetResizable()
	  {
	    return this.widgetResizable;
	  }
	  
	  public void setWidgetResizable(boolean widgetResizable)
	  {
	    this.widgetResizable = widgetResizable;
	  }
	  
	  public String getTheme()
	  {
	    String strTheme = "";
	    Map<String, String> typeMap = ApplicationUtil.getAppConfig().getAppExtProp();
	    if ((typeMap.get("theme") != null) && (!"".equals(typeMap.get("theme")))) {
	      strTheme = (String)typeMap.get("theme");
	    } else {
	      strTheme = this.theme;
	    }
	    return strTheme;
	  }
	  
	  public void setTheme(String theme)
	  {
	    this.theme = theme;
	  }
	  
	  public boolean isMultitask()
	  {
	    return this.isMultitask;
	  }
	  
	  public void setMultitask(boolean isMultitask)
	  {
	    this.isMultitask = isMultitask;
	  }
}
