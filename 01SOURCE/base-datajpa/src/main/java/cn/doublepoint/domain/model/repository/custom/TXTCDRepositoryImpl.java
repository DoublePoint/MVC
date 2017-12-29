package cn.doublepoint.domain.model.repository.custom;

import java.util.List;

import com.querydsl.core.Tuple;
import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import cn.doublepoint.domain.model.QTCity;
import cn.doublepoint.domain.model.QTHotel;
import cn.doublepoint.domain.model.QT_XT_CD;
import cn.doublepoint.domain.model.repository.BaseRepository;

public class TXTCDRepositoryImpl  extends BaseRepository implements TXTCDRepositoryCustom {

	public List<Tuple> findCDDetail(Predicate predicate) {
		JPAQueryFactory queryFactory = new JPAQueryFactory(em);
		JPAQuery<Tuple> jpaQuery = 
				queryFactory.select(QT_XT_CD.t_XT_CD , QT_XT_CD.t_XT_CD.cdmc )
							.from(QT_XT_CD.t_XT_CD)
							.leftJoin(QT_XT_CD.t_XT_CD)
							.on(QT_XT_CD.t_XT_CD.sjcdbs.stringValue()
									.eq(QT_XT_CD.t_XT_CD.cdbs.stringValue()));
		jpaQuery.where(predicate);
		List<Tuple> list= jpaQuery.fetch();
		return list;
	}

}
