package cn.doublepoint.datajpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.datajpa.domain.model.TCity;
import cn.doublepoint.datajpa.domain.model.T_XT_CD;
import cn.doublepoint.datajpa.repository.service.TCityRepositoryCustom;
import cn.doublepoint.datajpa.repository.service.TXTCDRepositoryCustom;


public interface TXTCDRepository extends JpaRepository<T_XT_CD,String>,QueryDslPredicateExecutor<T_XT_CD>, TXTCDRepositoryCustom {

}
