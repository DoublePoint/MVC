/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年4月26日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

import cn.doublepoint.commonutil.log.Log4jUtil;

public class DownloadFileUtil {
	
	/**
	 * 下载文件
	 * @param response
	 * @param fileName 需要下载的文件全路径
	 * @param exploreFileName 浏览器中显示的下载文件名称
	 */
	public static void download(HttpServletResponse response,String fileName,String exploreFileName){
		try{
			BufferedInputStream fis = new BufferedInputStream(new FileInputStream(fileName));
			byte[] buffer = new byte[fis.available()];
			fis.read(buffer);
			fis.close();
			// 清空response
			response.reset();
			OutputStream toClient = new BufferedOutputStream(response.getOutputStream());
			response.setContentType("application/octet-stream");
			response.setHeader("Content-Disposition","attachment;filename=" + new String(exploreFileName.getBytes("UTF-8"), "ISO-8859-1"));
			toClient.write(buffer);
			toClient.flush();
			toClient.close();
		}
		catch(Exception e){
			Log4jUtil.error(e);
		}
	}
}
