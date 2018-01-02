package cn.doublepoint.common.domain.model.query;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;

import javax.annotation.Generated;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.NumberPath;
import com.querydsl.core.types.dsl.StringPath;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_YH;


/**
 * QT_XT_YH is a Querydsl query type for T_XT_YH
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QT_XT_YH extends EntityPathBase<T_XT_YH> {

    private static final long serialVersionUID = 1069352482L;

    public static final QT_XT_YH t_XT_YH = new QT_XT_YH("t_XT_YH");

    public final DateTimePath<java.util.Date> cjsj = createDateTime("cjsj", java.util.Date.class);

    public final StringPath dlzh = createString("dlzh");

    public final StringPath email = createString("email");

    public final StringPath mm = createString("mm");

    public final StringPath sjh = createString("sjh");

    public final DateTimePath<java.util.Date> xgsj = createDateTime("xgsj", java.util.Date.class);

    public final NumberPath<Long> yhbs = createNumber("yhbs", Long.class);

    public QT_XT_YH(String variable) {
        super(T_XT_YH.class, forVariable(variable));
    }

    public QT_XT_YH(Path<? extends T_XT_YH> path) {
        super(path.getType(), path.getMetadata());
    }

    public QT_XT_YH(PathMetadata metadata) {
        super(T_XT_YH.class, metadata);
    }

}

