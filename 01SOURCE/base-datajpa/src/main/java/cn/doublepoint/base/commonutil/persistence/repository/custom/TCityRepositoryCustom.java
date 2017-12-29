package cn.doublepoint.base.commonutil.persistence.repository.custom;

import java.util.List;

import javax.persistence.Tuple;
import javax.persistence.criteria.Predicate;

import org.springframework.data.domain.Pageable;


public interface TCityRepositoryCustom {
    /**
     * 关联查询示例,查询出城市和对应的旅店
     * @param predicate 查询条件
     * @return 查询实体
     */
    public List<Tuple> findCityAndHotel(Predicate predicate);

    /**
     * 关联查询示例,查询出城市和对应的旅店
     * @param predicate 查询条件
     * @return 查询实体
     */
    public QueryResults<Tuple> findCityAndHotelPage(Predicate predicate,Pageable pageable);
}
