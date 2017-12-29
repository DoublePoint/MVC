package cn.doublepoint.base.commonutil.persistence.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.base.commonutil.persistence.entity.TCity;
import cn.doublepoint.base.commonutil.persistence.repository.custom.TCityRepositoryCustom;




public interface TCityRepository extends JpaRepository<TCity,Long>,QueryDslPredicateExecutor<TCity>, TCityRepositoryCustom {

}
