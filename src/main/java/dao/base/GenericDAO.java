package dao.base;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


import java.util.List;
import java.util.Map;


public class GenericDAO<T> {
    public SessionFactory sessionFactory;
    private Class<T> type;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public Class<T> getType() {
        return type;
    }

    public void setType(Class<T> type) {
        this.type = type;
    }

    public GenericDAO(SessionFactory sessionFactory, Class<T> type) {
        this.sessionFactory = sessionFactory;
        this.type = type;
    }

    public T findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(type, id);
        }
    }

    public T saveOrUpdate(T entity) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.saveOrUpdate(entity);
            transaction.commit();
            return entity;  // 返回操作后的实体
        } catch (RuntimeException e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }


    public boolean delete(T entity) {
        Transaction transaction = null;
        boolean deleted = false; // 默认设为删除失败
        try (Session session = sessionFactory.openSession()) {
            System.out.println("开始删除操作...");
            transaction = session.beginTransaction();
            session.delete(entity);
            transaction.commit();
            deleted = true; // 如果没有发生异常，设为删除成功
            System.out.println("删除成功");
        } catch (Exception e) {
            System.out.println("删除过程中出现异常：" + e.getMessage());
            if (transaction != null) {
                System.out.println("执行事务回滚...");
                transaction.rollback();
            }
            throw new RuntimeException("删除失败", e);
        }
        return deleted; // 返回删除操作的结果
    }



    public List<T> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from " + type.getName(), type).list();
        }
    }


    public T findOne(String hql, Map<String, Object> parameters) {
        try (Session session = sessionFactory.openSession()) {
            Query<T> query = session.createQuery(hql, type);
            parameters.forEach(query::setParameter);
            return query.uniqueResult();
        }
    }
}

