package cn.doublepoint.domain.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.domain.model.TCity;
import cn.doublepoint.domain.model.repository.custom.TCityRepositoryCustom;

/**
 * @author Niu Li
 * @date 2017/1/7
 */
public interface TCityRepository extends JpaRepository<TCity,String>,QueryDslPredicateExecutor<TCity>, TCityRepositoryCustom {

}
