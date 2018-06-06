package cn.doublepoint.common.port.adapter.template.persistence.sys.droplist;

import static java.util.stream.Collectors.toList;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.doublepoint.common.domain.model.entity.sys.ExtendProperty;
import cn.doublepoint.commonutil.ajaxmodel.DropBean;
import cn.doublepoint.commonutil.persitence.jpa.JPAUtil;

@Service("commonDropBeanListService")
public class CommonDropBeanListServiceImpl implements CommonDropBeanListService {

	@Autowired
	ExtendPropertyService extendPropertyService;
	/**
	 * 根据查询语句查询下拉
	 * 
	 * @param query
	 * @return
	 */
	public List<DropBean> findDropList(String dropName) {
		ExtendProperty extPro =extendPropertyService.findByCode(dropName);
		if(extPro==null)
			return null;
		try {
			List<Object> mapList=JPAUtil.executeNativeQuery(extPro.getQuery());
			List<DropBean> list=mapList.stream().map(m->{
				Object[] obj = (Object[]) m;   
				DropBean dropBean=new DropBean();
				dropBean.setKey(String.valueOf(obj[0]));
				dropBean.setValue(String.valueOf(obj[1]));
				dropBean.setFilter(String.valueOf(obj[2]));
				return dropBean;
			}).collect(toList());
			
			return list;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}

}