/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月1日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil.filter;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.nio.charset.Charset;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import cn.doublepoint.commonutil.domain.model.StringUtil;

public class BodyReaderHttpServletRequestWrapper extends HttpServletRequestWrapper {
	private final byte[] body;
	private JSONObject jsonObject;

	public BodyReaderHttpServletRequestWrapper(HttpServletRequest request) throws IOException {
		super(request);
		body = readBytes(request.getReader(), "utf-8");
	}

	@Override
	public BufferedReader getReader() throws IOException {
		ServletInputStream inputStream = getInputStream();
		if (inputStream == null)
			return null;
		return new BufferedReader(new InputStreamReader(getInputStream()));
	}

	/**
	 * 获取参数
	 */
	@Override
	public String getParameter(String parameterName){
		return this.getJSONObject().getString(parameterName);
	}
	
	/**
	 * 获取json对象
	 * 
	 * @return
	 */
	public JSONObject getJSONObject() {
		if (jsonObject != null) {
			return jsonObject;
		}
		String dataJsonString = new String(this.getBody());
		JSONObject jsonObject = JSON.parseObject(dataJsonString);
		return jsonObject;
	}

	@Override
	public ServletInputStream getInputStream() throws IOException {
		if (body == null)
			return null;
		final ByteArrayInputStream bais = new ByteArrayInputStream(body);
		return new ServletInputStream() {

			@Override
			public int read() throws IOException {
				return bais.read();
			}

			@Override
			public boolean isFinished() {
				return false;
			}

			@Override
			public boolean isReady() {
				return false;
			}

			@Override
			public void setReadListener(ReadListener readListener) {
			}
		};
	}

	public byte[] getBody() {
		return body;
	}
	
	/**
	 * 通过BufferedReader和字符编码集转换成byte数组
	 * 
	 * @param br
	 * @param encoding
	 * @return
	 * @throws IOException
	 */
	private byte[] readBytes(BufferedReader br, String encoding) throws IOException {
		String str = null, retStr = "";
		while ((str = br.readLine()) != null) {
			retStr += str;
		}
		if (!StringUtil.isNullOrEmpty(retStr)) {
			return retStr.getBytes(Charset.forName(encoding));
		}
		return null;
	}

	

}
