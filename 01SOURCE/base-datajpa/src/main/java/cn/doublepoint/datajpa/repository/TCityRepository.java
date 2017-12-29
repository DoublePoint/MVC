package cn.doublepoint.datajpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.datajpa.domain.model.TCity;
import cn.doublepoint.datajpa.repository.service.TCityRepositoryCustom;

/**
 * @author Niu Li
 * @date 2017/1/7
 */
public interface TCityRepository extends JpaRepository<TCity,String>,QueryDslPredicateExecutor<TCity>, TCityRepositoryCustom {

}
