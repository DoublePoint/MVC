/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月19日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.generate;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import cn.doublepoint.commonutil.domain.model.FileUtil;
import cn.doublepoint.commonutil.domain.model.Log4jUtil;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;

public class GenerateEntityTemplateUtil extends GenerateTemplateUtil {
	public final static String ENTITY_TPL_NAME = "Entity.java.ftl";
	
	Map<String, String> mapEntity;
	
	public void generateFile(List<BaseTemplate> models,String generateDirPath){
		try {
			mapEntity = buildTemplate(models,ENTITY_TPL_NAME);
			generateEntityFile(generateDirPath);
		} catch (Exception e) {
			Log4jUtil.error(e);
		}
	}

	/**
	 * 生成实体文件
	 * @param mapEntity
	 * @param generateDirPath
	 */
	private void generateEntityFile(String generateDirPath){
		mapEntity.entrySet().stream().forEach(e -> {
			try {
				generateEntityFile(generateDirPath, e.getKey(), e.getValue());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		});
	}
	
	/**
	 * 生成实体文件
	 * 
	 * @param generateDirPath
	 *            生成文件夹根路径 在此基础上添加/entity/entity.java
	 * @param fileName
	 *            文件名称
	 * @param fileContent
	 *            文件内容
	 * @throws IOException
	 *             异常
	 */
	private static void generateEntityFile(String generateDirPath, String fileName, String fileContent) throws IOException {
		generateDirPath = generateDirPath + "/entity";

		String entityFilePath = generateDirPath + "/"
				+ GenerateTemplateUtil.getFileNameContainExt(fileName, EGenerateType.Entity);
		
		FileUtil.createFile(generateDirPath, entityFilePath, fileContent);
	}

//	/**
//	 * 
//	 * @param baseModel
//	 * @param tableName
//	 * @return
//	 */
//	public static String buildEntityByTableName(BaseTemplate baseModel) {
//		String template = "";
//		try {
//			Map<String, Object> data = new HashMap<String, Object>();
//			Date date = new Date();
//			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:SS");
//			data.put("datetime", formatter.format(date));
//			data.put(TEMPLATE_ENTITY_KEY_NAME, baseModel.getEntityModel().getTableName());
//			template = createFileByTemplate(GENERATE_FILE_ENTITY_TPL_NAME, data);
//		} catch (Exception e) {
//			Log4jUtil.error(e);
//		}
//		return template;
//	}
}
