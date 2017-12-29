package cn.doublepoint.base.commonutil.persistence.repository.custom;

import java.util.List;

import javax.persistence.Tuple;
import javax.persistence.criteria.Predicate;

import org.springframework.data.domain.Pageable;

import cn.doublepoint.base.commonutil.persistence.repository.BaseRepository;


public class TCityRepositoryImpl extends BaseRepository implements TCityRepositoryCustom {

    @Override
    public List<Tuple> findCityAndHotel(Predicate predicate) {
        JPAQueryFactory queryFactory = new JPAQueryFactory(em);
        JPAQuery<Tuple> jpaQuery = queryFactory.select(QTCity.tCity,QTHotel.tHotel)
                                        .from(QTCity.tCity)
                                        .leftJoin(QTHotel.tHotel)
                                               .on(QTHotel.tHotel.city.longValue().eq(QTCity.tCity.id.longValue()));
        jpaQuery.where(predicate);
        return jpaQuery.fetch();
    }

    @Override
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
