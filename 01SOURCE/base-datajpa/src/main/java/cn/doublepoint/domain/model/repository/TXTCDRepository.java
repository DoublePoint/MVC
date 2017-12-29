package cn.doublepoint.domain.model.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.domain.model.TCity;
import cn.doublepoint.domain.model.T_XT_CD;
import cn.doublepoint.domain.model.repository.custom.TCityRepositoryCustom;
import cn.doublepoint.domain.model.repository.custom.TXTCDRepositoryCustom;


public interface TXTCDRepository extends JpaRepository<T_XT_CD,String>,QueryDslPredicateExecutor<T_XT_CD>, TXTCDRepositoryCustom {
//	public interface TXTCDRepository extends TXTCDRepositoryFather {

}
