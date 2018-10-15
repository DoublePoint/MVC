/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月16日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.file;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;

import cn.doublepoint.commonutil.log.Log4jUtil;

public class FileUtil {
	
	/**
	 * 创建文件
	 * @param dirPath
	 * @param entityFilePath
	 * @param fileContent
	 */
	public static void createFile(String dirPath, String entityFilePath, String fileContent) {
		File dirPathFile = new File(dirPath);
		if (!dirPathFile.exists()) {
			dirPathFile.mkdir();
		}
		File entiryFile = new File(entityFilePath);
		try {
			Log4jUtil.info("临时文件所在的本地路径：" + entiryFile.getCanonicalPath());
			FileOutputStream fos = new FileOutputStream(entiryFile);
			try {
				BufferedWriter out = new BufferedWriter(new FileWriter(entiryFile));
				out.write(fileContent);
				out.close();
			} finally {
				// 关闭临时文件
				fos.flush();
				fos.close();
			}
		} catch (Exception e) {
			Log4jUtil.error(e);
		}
	}
}
