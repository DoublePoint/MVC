package cn.doublepoint.domain.model;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QT_XT_CD is a Querydsl query type for T_XT_CD
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QT_XT_CD extends EntityPathBase<T_XT_CD> {

    private static final long serialVersionUID = 509689532L;

    public static final QT_XT_CD t_XT_CD = new QT_XT_CD("t_XT_CD");

    public final StringPath cdbs = createString("cdbs");

    public final NumberPath<Integer> cdcj = createNumber("cdcj", Integer.class);

    public final StringPath cdlj = createString("cdlj");

    public final StringPath cdmc = createString("cdmc");

    public final NumberPath<Integer> cdpx = createNumber("cdpx", Integer.class);

    public final DateTimePath<java.util.Date> cjsj = createDateTime("cjsj", java.util.Date.class);

    public final DateTimePath<java.util.Date> gxsj = createDateTime("gxsj", java.util.Date.class);

    public final StringPath sjcdbs = createString("sjcdbs");

    public QT_XT_CD(String variable) {
        super(T_XT_CD.class, forVariable(variable));
    }

    public QT_XT_CD(Path<? extends T_XT_CD> path) {
        super(path.getType(), path.getMetadata());
    }

    public QT_XT_CD(PathMetadata metadata) {
        super(T_XT_CD.class, metadata);
    }

}

