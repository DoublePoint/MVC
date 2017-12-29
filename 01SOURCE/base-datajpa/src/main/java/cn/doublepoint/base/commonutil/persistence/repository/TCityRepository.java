package cn.doublepoint.base.commonutil.persistence.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.base.commonutil.persistence.entity.TCity;
import cn.doublepoint.base.commonutil.persistence.repository.custom.TCityRepositoryCustom;



/**
 * @author Niu Li
 * @date 2017/1/7
 */
public interface TCityRepository extends JpaRepository<TCity,Long>,QueryDslPredicateExecutor<TCity>, TCityRepositoryCustom {

}
