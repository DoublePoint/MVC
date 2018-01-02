package cn.doublepoint.common.domain.model.query;

import static com.querydsl.core.types.PathMetadataFactory.forVariable;

import javax.annotation.Generated;

import com.querydsl.core.types.Path;
import com.querydsl.core.types.PathMetadata;
import com.querydsl.core.types.dsl.DateTimePath;
import com.querydsl.core.types.dsl.EntityPathBase;
import com.querydsl.core.types.dsl.StringPath;

import cn.doublepoint.common.domain.model.entity.xt.T_XT_GLY;


/**
 * QT_XT_GLY is a Querydsl query type for T_XT_GLY
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QT_XT_GLY extends EntityPathBase<T_XT_GLY> {

    private static final long serialVersionUID = -1209828511L;

    public static final QT_XT_GLY t_XT_GLY = new QT_XT_GLY("t_XT_GLY");

    public final DateTimePath<java.util.Date> cjsj = createDateTime("cjsj", java.util.Date.class);

    public final StringPath dlmm = createString("dlmm");

    public final StringPath dlzh = createString("dlzh");

    public final StringPath glybs = createString("glybs");

    public final DateTimePath<java.util.Date> gxsj = createDateTime("gxsj", java.util.Date.class);

    public QT_XT_GLY(String variable) {
        super(T_XT_GLY.class, forVariable(variable));
    }

    public QT_XT_GLY(Path<? extends T_XT_GLY> path) {
        super(path.getType(), path.getMetadata());
    }

    public QT_XT_GLY(PathMetadata metadata) {
        super(T_XT_GLY.class, metadata);
    }

}

