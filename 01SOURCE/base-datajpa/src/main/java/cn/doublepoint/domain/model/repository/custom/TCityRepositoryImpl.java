package cn.doublepoint.domain.model.repository.custom;

import java.util.List;

import org.springframework.data.domain.Pageable;

import com.querydsl.core.QueryResults;
import com.querydsl.core.Tuple;
import com.querydsl.core.types.Predicate;
import com.querydsl.jpa.impl.JPAQuery;
import com.querydsl.jpa.impl.JPAQueryFactory;

import cn.doublepoint.domain.model.QTCity;
import cn.doublepoint.domain.model.QTHotel;
import cn.doublepoint.domain.model.repository.BaseRepository;

/**
 * @author Niu Li
 * @date 2017/1/7
 */
public class TCityRepositoryImpl extends BaseRepository implements TCityRepositoryCustom {

    public List<Tuple> findCityAndHotel(Predicate predicate) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(em);
        JPAQuery<Tuple> jpaQuery = queryFactory.select(QTCity.tCity,QTHotel.tHotel)
                                        .from(QTCity.tCity)
                                        .leftJoin(QTHotel.tHotel)
                                               .on(QTHotel.tHotel.city.longValue().eq(QTCity.tCity.id.longValue()));
        jpaQuery.where(predicate);
        return jpaQuery.fetch();
    }

    public QueryResults<Tuple> findCityAndHotelPage(Predicate predicate,Pageable pageable) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(em);
        JPAQuery<Tuple> jpaQuery = queryFactory.select(QTCity.tCity.id,QTHotel.tHotel)
                                               .from(QTCity.tCity)
                                               .leftJoin(QTHotel.tHotel)
                                               .on(QTHotel.tHotel.city.longValue().eq(QTCity.tCity.id.longValue()))
                                               .offset(pageable.getOffset())
                                               .limit(pageable.getPageSize());
        return jpaQuery.fetchResults();
    }

}
