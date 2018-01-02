package cn.doublepoint.common.domain.model.query;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;

import javax.annotation.Generated;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_QX;


/**
 * QT_XT_QX is a Querydsl query type for T_XT_QX
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QT_XT_QX extends EntityPathBase<T_XT_QX> {

    private static final long serialVersionUID = 1069352250L;

    public static final QT_XT_QX t_XT_QX = new QT_XT_QX("t_XT_QX");

    public final DateTimePath<java.util.Date> cjsj = createDateTime("cjsj", java.util.Date.class);

    public final DateTimePath<java.util.Date> gxsj = createDateTime("gxsj", java.util.Date.class);

    public final StringPath qxbs = createString("qxbs");

    public final StringPath qxmc = createString("qxmc");

    public final NumberPath<Long> qxz = createNumber("qxz", Long.class);

    public QT_XT_QX(String variable) {
        super(T_XT_QX.class, forVariable(variable));
    }

    public QT_XT_QX(Path<? extends T_XT_QX> path) {
        super(path.getType(), path.getMetadata());
    }

    public QT_XT_QX(PathMetadata metadata) {
        super(T_XT_QX.class, metadata);
    }

}

