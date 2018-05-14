/** 
* 创   建   人： 刘磊
* 
* 创   建   时   间 ： 2018年5月14日
* 
* 类   说   明 ：
* 
* 修   改   人：          修   改   日   期：
*/
package cn.doublepoint.common.util;

import java.util.ArrayList;
import java.util.List;

import cn.doublepoint.common.domain.model.entity.sys.Sequence;
import cn.doublepoint.commonutil.domain.model.BaseModel;
import cn.doublepoint.commonutil.persitence.jpa.BaseDaoService;
import cn.doublepoint.commonutil.persitence.jpa.DataBaseUtil;

public class SequenceUtil extends DataBaseUtil {
	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> Long getNextVal(Class<T> clazz) {
		return getNextVal(clazz, 1).get(0);
	}

	/**
	 * 获取实体信息
	 * 
	 * @param clazz
	 * @param queryParamList
	 * @return
	 */
	public static <T extends BaseModel> List<Long> getNextVal(Class<T> clazz, int count) {
		String qualifiedName = clazz.getPackage().getName() + "." + clazz.getName();
		long currentSequenceNo = getCurrentVal(clazz);
		long arimSequenceNo = currentSequenceNo + count;
		Sequence sequence = new Sequence();
		sequence.setEntityCode(qualifiedName);
		sequence.setSequenceNo(arimSequenceNo);
		BaseDaoService daoService = getDaoService();
		daoService.saveOrUpdate(sequence);

		List<Long> seqList = new ArrayList<>();
		for (int i = 0; i < count; i++) {
			seqList.add(currentSequenceNo + i + 1);
		}
		return seqList;
	}

	public static <T extends BaseModel> Long getCurrentVal(Class<T> clazz) {
		BaseDaoService daoService = getDaoService();
		Sequence obj = daoService.loadById(Sequence.class, getQualifiedName(clazz));
		if (obj == null)
			return 0L;
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
