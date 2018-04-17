/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.domain.model.entity.sys;

import cn.doublepoint.commonutil.domain.model.entity.BaseEntity;

public class MySQLTables extends BaseEntity{
	private String TABLE_CATALOG;
	private String TABLE_SCHEMA;
	private String TABLE_NAME;
	private String TABLE_TYPE;
	private String ENGINE;
	private String VERSION;
	private String ROW_FORMAT;
	private String TABLE_ROWS;
	private String AVG_ROW_LENGTH;
	private String DATA_LENGTH;
	private String MAX_DATA_LENGTH;
	private String INDEX_LENGTH;
	private String DATA_FREE;
	private String AUTO_INCREMENT;
	private String CREATE_TIME;
	private String UPDATE_TIME;
	private String CHECK_TIME;
	private String TABLE_COLLATION;
	private String CHECKSUM;
	private String CREATE_OPTIONS;
	private String TABLE_COMMENT;
	public String getTABLE_CATALOG() {
		return TABLE_CATALOG;
	}
	public void setTABLE_CATALOG(String tABLE_CATALOG) {
		TABLE_CATALOG = tABLE_CATALOG;
	}
	public String getTABLE_SCHEMA() {
		return TABLE_SCHEMA;
	}
	public void setTABLE_SCHEMA(String tABLE_SCHEMA) {
		TABLE_SCHEMA = tABLE_SCHEMA;
	}
	public String getTABLE_NAME() {
		return TABLE_NAME;
	}
	public void setTABLE_NAME(String tABLE_NAME) {
		TABLE_NAME = tABLE_NAME;
	}
	public String getTABLE_TYPE() {
		return TABLE_TYPE;
	}
	public void setTABLE_TYPE(String tABLE_TYPE) {
		TABLE_TYPE = tABLE_TYPE;
	}
	public String getENGINE() {
		return ENGINE;
	}
	public void setENGINE(String eNGINE) {
		ENGINE = eNGINE;
	}
	public String getVERSION() {
		return VERSION;
	}
	public void setVERSION(String vERSION) {
		VERSION = vERSION;
	}
	public String getROW_FORMAT() {
		return ROW_FORMAT;
	}
	public void setROW_FORMAT(String rOW_FORMAT) {
		ROW_FORMAT = rOW_FORMAT;
	}
	public String getTABLE_ROWS() {
		return TABLE_ROWS;
	}
	public void setTABLE_ROWS(String tABLE_ROWS) {
		TABLE_ROWS = tABLE_ROWS;
	}
	public String getAVG_ROW_LENGTH() {
		return AVG_ROW_LENGTH;
	}
	public void setAVG_ROW_LENGTH(String aVG_ROW_LENGTH) {
		AVG_ROW_LENGTH = aVG_ROW_LENGTH;
	}
	public String getDATA_LENGTH() {
		return DATA_LENGTH;
	}
	public void setDATA_LENGTH(String dATA_LENGTH) {
		DATA_LENGTH = dATA_LENGTH;
	}
	public String getMAX_DATA_LENGTH() {
		return MAX_DATA_LENGTH;
	}
	public void setMAX_DATA_LENGTH(String mAX_DATA_LENGTH) {
		MAX_DATA_LENGTH = mAX_DATA_LENGTH;
	}
	public String getINDEX_LENGTH() {
		return INDEX_LENGTH;
	}
	public void setINDEX_LENGTH(String iNDEX_LENGTH) {
		INDEX_LENGTH = iNDEX_LENGTH;
	}
	public String getDATA_FREE() {
		return DATA_FREE;
	}
	public void setDATA_FREE(String dATA_FREE) {
		DATA_FREE = dATA_FREE;
	}
	public String getAUTO_INCREMENT() {
		return AUTO_INCREMENT;
	}
	public void setAUTO_INCREMENT(String aUTO_INCREMENT) {
		AUTO_INCREMENT = aUTO_INCREMENT;
	}
	public String getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(String cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public String getUPDATE_TIME() {
		return UPDATE_TIME;
	}
	public void setUPDATE_TIME(String uPDATE_TIME) {
		UPDATE_TIME = uPDATE_TIME;
	}
	public String getCHECK_TIME() {
		return CHECK_TIME;
	}
	public void setCHECK_TIME(String cHECK_TIME) {
		CHECK_TIME = cHECK_TIME;
	}
	public String getTABLE_COLLATION() {
		return TABLE_COLLATION;
	}
	public void setTABLE_COLLATION(String tABLE_COLLATION) {
		TABLE_COLLATION = tABLE_COLLATION;
	}
	public String getCHECKSUM() {
		return CHECKSUM;
	}
	public void setCHECKSUM(String cHECKSUM) {
		CHECKSUM = cHECKSUM;
	}
	public String getCREATE_OPTIONS() {
		return CREATE_OPTIONS;
	}
	public void setCREATE_OPTIONS(String cREATE_OPTIONS) {
		CREATE_OPTIONS = cREATE_OPTIONS;
	}
	public String getTABLE_COMMENT() {
		return TABLE_COMMENT;
	}
	public void setTABLE_COMMENT(String tABLE_COMMENT) {
		TABLE_COMMENT = tABLE_COMMENT;
	}
	
	
}
