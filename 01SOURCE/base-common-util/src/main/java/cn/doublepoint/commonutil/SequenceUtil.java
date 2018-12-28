/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.commonutil;

import java.util.ArrayList;
import java.util.List;

import cn.doublepoint.commonutil.persitence.jpa.BaseDaoService;
import cn.doublepoint.commonutil.persitence.jpa.DataBaseUtil;
import cn.doublepoint.dto.domain.model.entity.BaseModel;
import cn.doublepoint.dto.domain.model.entity.sys.SysSequence;

public class SequenceUtil extends DataBaseUtil {
	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> Integer getNextVal(Class<T> clazz) {
		return getNextVal(clazz, 1).get(0);
	}

	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> Integer getNextVal(String str) {
		return getNextVal(str, 1).get(0);
	}

	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<Integer> getNextVal(Class<T> clazz, int count) {
		String qualifiedName = clazz.getName();
		return getNextVal(qualifiedName, count);
	}

	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static List<Integer> getNextVal(String str, int count) {
		int currentSequenceNo = getCurrentVal(str);
		Integer arimSequenceNo = currentSequenceNo + count;
		SysSequence sequence = new SysSequence();
		sequence.setEntityCode(str);
		sequence.setSequenceNo(arimSequenceNo);
		BaseDaoService daoService = getDaoService();
		daoService.saveOrUpdate(sequence);

		List<Integer> seqList = new ArrayList<>();
		for (int i = 0; i < count; i++) {
			seqList.add(currentSequenceNo + i + 1);
		}
		return seqList;
	}

	public static <T extends BaseModel> Integer getCurrentVal(Class<T> clazz) {
		return getCurrentVal(getQualifiedName(clazz));
	}

	public static Integer getCurrentVal(String str) {
		BaseDaoService daoService = getDaoService();
		SysSequence obj = daoService.loadById(SysSequence.class, str);
		if (obj == null)
			return 0;
		return obj.getSequenceNo();
	}

	/**
	 * 获取全路径类名
	 * 
	 * @param clazz
	 * @return
	 */
	public static <T extends BaseModel> String getQualifiedName(Class<T> clazz) {
		String qualifiedName = clazz.getPackage().getName() + "." + clazz.getName();
		return qualifiedName;
	}
}
