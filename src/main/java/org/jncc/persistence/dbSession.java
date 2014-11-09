package org.jncc.persistence;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.hibernate.service.ServiceRegistryBuilder;
import org.jncc.base.user.UserInfo;

@SuppressWarnings("deprecation")
public class dbSession {

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

	// 读取
//	public static Object select(Object obj,String keyword) {
//		init();
//		obj = (Object) session.load(Object.class, keyword);
//		return obj;
//	}
	
	// 根据主键获取唯一数据
	public static Object load(Class clazz,String keyword) {
		init();
		Object obj = null;
		try{
			obj =  session.load(clazz, keyword);
		}
		catch(Exception e)
		{
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

	static SessionFactory sessionFactory;
	static Session session;
	static Transaction tx;
	static ServiceRegistry serviceRegistry = null;
	static Configuration configuration = null;
	public static void init() {
		// sessionFactory = new
		// Configuration().configure().buildSessionFactory();
		// session = sessionFactory.openSession();
		if(serviceRegistry == null){
			configuration = new Configuration().configure();
			serviceRegistry = new ServiceRegistryBuilder()
					.applySettings(configuration.getProperties())
					.buildServiceRegistry();
		}
		session = configuration.buildSessionFactory(serviceRegistry)
				.openSession();
		tx = session.beginTransaction();
	}

	public static void close() {
		tx.commit();
		session.close();
	}

	public static void main(String[] args) {
		init();
		// update();
		close();
	}
}
