package service.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import pojo.User;
import service.UserService;

public class UserServiceImpl implements UserService {

    public static SessionFactory sessionFactory;

    static {
        // 创建SessionFactory，实际应用中通常由依赖注入框架管理
        try {
            sessionFactory = new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            System.err.println("初始化 SessionFactory 失败." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }
    @Override
    public void login(String userName, String passWord) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();

            String hql = "FROM User WHERE userName = :userName AND passWord = :password";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("userName", userName);
            query.setParameter("password", passWord);
            User user = query.uniqueResult();

            session.getTransaction().commit();

            if (user != null) {
                System.out.println("登录成功");
                // 进一步处理，例如设置用户会话

            } else {
                System.out.println("登录失败");
            }
        } catch (Exception e) {
            if (session.getTransaction() != null) {
                session.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
    }

}
