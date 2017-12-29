package cn.doublepoint.base.datajpa.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTCity is a Querydsl query type for TCity
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTCity extends EntityPathBase<TCity> {

    private static final long serialVersionUID = -490234916L;

    public static final QTCity tCity = new QTCity("tCity");

    public final StringPath country = createString("country");

    public final NumberPath<Integer> id = createNumber("id", Integer.class);

    public final StringPath map = createString("map");

    public final StringPath name = createString("name");

    public final StringPath state = createString("state");

    public QTCity(String variable) {
        super(TCity.class, forVariable(variable));
    }

    public QTCity(Path<? extends TCity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTCity(PathMetadata metadata) {
        super(TCity.class, metadata);
    }

}

