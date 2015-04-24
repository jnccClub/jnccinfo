package org.nuaa.mapp.servlet;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import org.jncc.base.course.ECourseService;
import org.jncc.base.coursemap.ECourseMapService;
import org.jncc.base.software.ESoftwareService;
import org.jncc.base.zone.EZoneService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

/**
 * Created by YeahO_O on 1/27/2015.
 */
public class ApplicationCtxListener implements ServletContextListener {
	private static Logger logger = LoggerFactory
			.getLogger(ApplicationCtxListener.class);
	
	private static Class clazz = ApplicationCtxListener.class;
	public static final String SESSION_FACTORY_KEY_NAME = clazz.getName()
			+ "_SESSION_FACTORY";
	public static final String SERVICE_KEY_NAME = clazz.getName()
			+ "_SOCK_SERVICE";
	public static final String SERVER_KEY_NAME = clazz.getName()
			+ "_SOCK_SERVER";
	
	private static SessionFactory factory = null;
	
	public static SessionFactory getFactory(){
		return factory;
	}
	
	public void contextInitialized(ServletContextEvent event) {
		// 初始化 Hibernate 配置
		logger.debug("Initialize hibernate...");
		Configuration config = new Configuration().configure();
		ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder()
				.applySettings(config.getProperties()).build();
		SessionFactory factory = config.buildSessionFactory(serviceRegistry);
		event.getServletContext().setAttribute(SESSION_FACTORY_KEY_NAME,
				factory);

		// 创建 TLV socket 服务
		logger.debug("Initialize socket server...");
		logger.info("初始化 Servlet 完成");
		
		//静态变量初始化
		ECourseMapService.setECourseMapList();
		ECourseService.updateEcList();
		EZoneService.getEZoneList();
		ESoftwareService.updateEswList(ESoftwareService.getEswList());
		
	}

	public void contextDestroyed(ServletContextEvent event) {
		logger.debug("Stopping socket server...");
		SessionFactory factory = (SessionFactory) event.getServletContext()
				.getAttribute(SESSION_FACTORY_KEY_NAME);
		if (factory != null) {
			logger.debug("Stopping hibernate...");
			factory.close();
		}
		logger.info("Servlet 销毁");
	}
}
