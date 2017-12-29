package cn.doublepoint.domain.model.repository.custom;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.Predicate;

import cn.doublepoint.domain.model.TCity;


public interface TXTCDRepositoryCustom {
	/**
     * 查询菜单的详细信息 包含父菜单名称
     * @param predicate 查询条件
     * @return 查询实体
     */
    public List<Tuple> findCDDetail(Predicate predicate); 
}
