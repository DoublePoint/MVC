package cn.doublepoint.commonutil.persitence.jpa;

import java.util.Collections;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.hql.internal.classic.QueryTranslatorImpl;

public class JPQLConverterUtil {

	public static String convertJPQLToSQL(String jpql,EntityManager em){
		jpql=jpql.replace(":", "："); 
		Session session = (Session)em.getDelegate();
		SessionFactory factory = session.getSessionFactory();
		QueryTranslatorImpl queryTranslator=new QueryTranslatorImpl(jpql, Collections.EMPTY_MAP, (SessionFactoryImplementor)factory);
		queryTranslator.compile(Collections.EMPTY_MAP, false);
		String sql = queryTranslator.getSQLString();
		return sql;
	}
	
}
