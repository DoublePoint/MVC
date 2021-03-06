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

import cn.doublepoint.commonutil.file.FileUtil;
import cn.doublepoint.generate.domain.model.helper.BaseTemplate;
import freemarker.template.TemplateException;

public class GenerateServiceTemplateUtil extends GenerateTemplateUtil {
	public final static String SERVICVE_TPL_NAME = "Service.java.ftl";
	
	Map<String, String> mapService;
	public void generateFile(List<BaseTemplate> models,String generateDirPath){
		try {
			mapService = buildServiceTemplate(models);
			generateServiceFile(generateDirPath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 生成仓库文件
	 * @param mapEntity
	 * @param generateDirPath
	 */
	private void generateServiceFile(String generateDirPath){
		mapService.entrySet().stream().forEach(e -> {
			try {
				generateServiceFile(generateDirPath, e.getKey(), e.getValue());
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		});
	}

	/**
	 * 生成仓库文件
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
	private static void generateServiceFile(String generateDirPath, String fileName, String fileContent)
			throws IOException {
		generateDirPath = generateDirPath + "/service";
		String filePath = generateDirPath + "/"
				+ GenerateTemplateUtil.getFileNameContainExt(fileName, EGenerateType.Service);
		FileUtil.createFile(generateDirPath, filePath, fileContent);
	}

	/**
	 * 分别获取 某个表对应的某个文件内容
	 * 
	 * @param file
	 * @param tableNameLlist
	 * @return
	 * @throws TemplateException
	 * @throws IOException
	 */
	public static Map<String, String> buildServiceTemplate(List<BaseTemplate> baseModelList)
			throws TemplateException, IOException {
		return buildTemplate(baseModelList, SERVICVE_TPL_NAME);
	}
}
