package cn.doublepoint.common.port.adapter.template.persistence.xt.yh;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_YH;

public interface XTYHRepository extends JpaRepository<T_XT_YH,Long>,QueryDslPredicateExecutor<T_XT_YH>, XTYHRepositoryRepositoryExtend {
}
