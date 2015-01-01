package org.jncc.persistence;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;

@SuppressWarnings("deprecation")
public class dbSession {
	// 删除
	public static void delete(Object obj) {
		init();
		session.delete(obj);
		close();
	}

	public static Criteria getCriteria(Class clazz) {
		Criteria crit = session.createCriteria(clazz);
		return crit;
	}

	// 遍历
	public static void all() {
		Query q = session
				.createQuery("select c.id,c.username from TestDb as c");

		List l = q.list();
		for (int i = 0; i < l.size(); i++) {

			// TestDb user = (TestDb)l.get(i);
			// System.out.println(user.getUsername());

			Object[] row = (Object[]) l.get(i);

			Long id = (Long) row[0];
			String name = (String) row[1];
			System.out.println(id + " " + name);
		}
	}

	public static List select(String sql) {
		Query q = session.createQuery(sql);
		List l = q.list();
		return l;
	}

	public static List getAllbbs(String hql,int maxRow){
		final Query query = session.createQuery(hql);
	    query.setMaxResults(maxRow);
	    return query.list();
		
	}

	// 根据主键获取唯一数据
	public static Object load(Class clazz, String keyword) {
		init();
		Object obj = null;
		try {
			obj = session.load(clazz, keyword);
		} catch (Exception e) {
			obj = null;
		}
		return obj;
	}

	// 更新
	public static void update(String username) {
		TestDb obj = (TestDb) session.load(dbSession.class, new Long(2));
		obj.setUsername("cg");
	}

	// 插入
	public static void insert(Object obj) {
		init();
		session.save(obj);
	}

	public static void replaceInsert(Object obj){
		session.delete(obj);
		session.save(obj);
	}
	
	static SessionFactory sessionFactory;
	static Session session;
	static Transaction tx;
	static ServiceRegistry serviceRegistry = null;
	static Configuration configuration = null;

	public static void init() {
		// sessionFactory = new
		// Configuration().configure().buildSessionFactory();
		// session = sessionFactory.openSession();
		if (serviceRegistry == null || configuration==null) {
			configuration = new Configuration().configure();
			serviceRegistry = new ServiceRegistryBuilder().applySettings(
					configuration.getProperties()).buildServiceRegistry();
		}
		session = configuration.buildSessionFactory(serviceRegistry)
				.openSession();
		tx = session.beginTransaction();
	}
	
	public static void flush(){
			session.flush();
			session.clear();
	}

	public static void close(boolean isCloseSession) {
		try {
			if (tx.isActive()) {
				tx.commit();
				session.flush();
			}
			if (isCloseSession) {
				close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static void close() {
		if (session.isOpen()) {
			try {
				if (tx.isActive()) {
					tx.commit();
				}
				session.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	

	@SuppressWarnings("unchecked")
	public static ArrayList executeQuery(String hql, String... params) {
		init();
		ArrayList list = null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery(hql);
			if (params != null && params.length > 0) {
				for (int i = 0; i < params.length; i++) {
					query.setParameter(i, params[i]);
				}
			}
			list = (ArrayList) query.list();
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			throw new RuntimeException(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
		return list;
	}

	public static void executeUpdate(String hql, Object... params) {
		init();
		try {
			Query query = session.createQuery(hql);

			if (params != null && params.length > 0) {
				for (int i = 0; i < params.length; i++) {
					query.setParameter(i, params[i]);
					// System.out.println("query influenced: "+params[i]);
				}
			}
			System.out.println("query influenced: " + query.getQueryString());
			int n = query.executeUpdate();
			System.out.println("query influence: " + n);
			tx.commit();
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			throw new RuntimeException(e.getMessage());
		} finally {
			if (session != null && session.isOpen()) {
				session.close();
			}
		}
	}

	public static void main(String[] args) {
		init();
		// update();
		close();
	}
}
