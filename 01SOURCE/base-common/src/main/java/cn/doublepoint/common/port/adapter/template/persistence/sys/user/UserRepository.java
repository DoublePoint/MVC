package cn.doublepoint.common.port.adapter.template.persistence.sys.user;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;

import cn.doublepoint.common.domain.model.entity.sys.User;

public interface UserRepository extends JpaRepository<User,Long>,QueryDslPredicateExecutor<User>, UserCollectionTypeRepositoryRepositoryExtend {
}
