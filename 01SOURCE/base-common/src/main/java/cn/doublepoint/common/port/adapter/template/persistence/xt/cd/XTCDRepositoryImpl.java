package cn.doublepoint.common.port.adapter.template.persistence.xt.cd;

import javax.annotation.PostConstruct;

import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQueryFactory;

public class XTCDRepositoryImpl  extends BaseRepository implements XTCDRepositoryCustom {

	private JPAQueryFactory queryFactory;  
    
    @PostConstruct  
    public void init() {  
        queryFactory = new JPAQueryFactory(entityManager);  
    }  
    
}
