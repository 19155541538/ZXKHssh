package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HibernateUtil {
    private static final SessionFactory sessionFactory = buildSessionFactory();

    private static SessionFactory buildSessionFactory() {
        try {
            // 创建SessionFactory从hibernate.cfg.xml配置文件
            return new Configuration().configure().buildSessionFactory();
        } catch (Throwable ex) {
            // 记录异常，实际生产中应该使用日志框架如Log4j
            System.err.println("Initial SessionFactory creation failed." + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }
}

