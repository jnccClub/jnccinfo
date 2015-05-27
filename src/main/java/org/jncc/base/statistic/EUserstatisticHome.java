package org.jncc.base.statistic;
// default package
// Generated 2015-5-8 20:38:58 by Hibernate Tools 3.4.0.CR1

import java.util.List;
import javax.naming.InitialContext;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;

/**
 * Home object for domain model class EUserstatistic.
 * @see .EUserstatistic
 * @author Hibernate Tools
 */
public class EUserstatisticHome {

	private static final Log log = LogFactory.getLog(EUserstatisticHome.class);

	private final SessionFactory sessionFactory = getSessionFactory();

	protected SessionFactory getSessionFactory() {
		try {
			return (SessionFactory) new InitialContext()
					.lookup("SessionFactory");
		} catch (Exception e) {
			log.error("Could not locate SessionFactory in JNDI", e);
			throw new IllegalStateException(
					"Could not locate SessionFactory in JNDI");
		}
	}

	public void persist(EUserstatistic transientInstance) {
		log.debug("persisting EUserstatistic instance");
		try {
			sessionFactory.getCurrentSession().persist(transientInstance);
			log.debug("persist successful");
		} catch (RuntimeException re) {
			log.error("persist failed", re);
			throw re;
		}
	}

	public void attachDirty(EUserstatistic instance) {
		log.debug("attaching dirty EUserstatistic instance");
		try {
			sessionFactory.getCurrentSession().saveOrUpdate(instance);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void attachClean(EUserstatistic instance) {
		log.debug("attaching clean EUserstatistic instance");
		try {
			sessionFactory.getCurrentSession().lock(instance, LockMode.NONE);
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			throw re;
		}
	}

	public void delete(EUserstatistic persistentInstance) {
		log.debug("deleting EUserstatistic instance");
		try {
			sessionFactory.getCurrentSession().delete(persistentInstance);
			log.debug("delete successful");
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			throw re;
		}
	}

	public EUserstatistic merge(EUserstatistic detachedInstance) {
		log.debug("merging EUserstatistic instance");
		try {
			EUserstatistic result = (EUserstatistic) sessionFactory
					.getCurrentSession().merge(detachedInstance);
			log.debug("merge successful");
			return result;
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			throw re;
		}
	}

	public EUserstatistic findById(java.lang.Integer id) {
		log.debug("getting EUserstatistic instance with id: " + id);
		try {
			EUserstatistic instance = (EUserstatistic) sessionFactory
					.getCurrentSession().get("EUserstatistic", id);
			if (instance == null) {
				log.debug("get successful, no instance found");
			} else {
				log.debug("get successful, instance found");
			}
			return instance;
		} catch (RuntimeException re) {
			log.error("get failed", re);
			throw re;
		}
	}

	public List findByExample(EUserstatistic instance) {
		log.debug("finding EUserstatistic instance by example");
		try {
			List results = sessionFactory.getCurrentSession()
					.createCriteria("EUserstatistic")
					.add(Example.create(instance)).list();
			log.debug("find by example successful, result size: "
					+ results.size());
			return results;
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
			throw re;
		}
	}
}
