package cn.doublepoint.commonutil.persitence.jpa;

import java.util.Collections;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.engine.spi.SessionFactoryImplementor;
import org.hibernate.hql.internal.classic.QueryTranslatorImpl;

public class JPQLConverterUtil {

	/**
	 * JPQL转SQL
	 * @param jpql
	 * @param em
	 * @return
	 */
	public static String convertJPQLToSQL(String jpql,EntityManager em){
		jpql=replaceEnMaoHao(jpql); 
		Session session = (Session)em.getDelegate();
		SessionFactory factory = session.getSessionFactory();
		QueryTranslatorImpl queryTranslator=new QueryTranslatorImpl(jpql, Collections.EMPTY_MAP, (SessionFactoryImplementor)factory);
		queryTranslator.compile(Collections.EMPTY_MAP, false);
		String sql = queryTranslator.getSQLString();
		return replaceChMaoHao(sql);
	}
	
	/**
	 * 将英文冒号转成中文冒号 以防被解析成顺序参数
	 * @param jpql
	 * @return
	 */
	private static String  replaceEnMaoHao(String jpql){
		return jpql.replace(":", "LL：");
	}
	
	/**
	 * 将中文冒号还原成英文，以恢复具名参数
	 * @param jpql
	 * @return
	 */
	private static String replaceChMaoHao(String jpql){
		return jpql.replace("LL：", ":");
	}
}
