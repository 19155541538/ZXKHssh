package dao;

import dao.base.GenericDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
import org.hibernate.query.QueryProducer;
import pojo.Menu;
import pojo.User;
import service.UserService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static service.Impl.UserServiceImpl.sessionFactory;

public class UserDAO extends GenericDAO<User> {



    public UserDAO(SessionFactory sessionFactory, Class<User> type) {
        super(sessionFactory, type);
    }

    public UserDAO(SessionFactory sessionFactory) {
        super(sessionFactory , User.class);
    }

    /*
    *登陆（判断账号密码是否正确）
    * */
    public User getUserByUsernameAndPassword(String username, String password) {
        String hql = "FROM User WHERE userName = :username AND passWord = :password";
        Map<String, Object> parameters = new HashMap<>();
        parameters.put("username", username);
        parameters.put("password", password);
        return findOne(hql, parameters);
    }


    /*
    * 查询所有用户
    * */

    public List<User> selectAllUser() {
        return findAll();
    }

    /*
     * 计算用户总数
     */
    public int countUsers() {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = null;
        int count = 0;

        try {
            transaction = session.beginTransaction();
            String hql = "SELECT COUNT(u) FROM User u";
            Long result = (Long) session.createQuery(hql).uniqueResult();
            count = result.intValue();
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction != null) transaction.rollback();
            throw e; // 或者处理异常
        }

        return count;
    }



    /*
     * 分页查询用户
     */
    public List<User> selectUsersByPage(int page, int size) {
        Session session = sessionFactory.getCurrentSession();
        Transaction tx = null;
        List<User> users = null;

        try {
            tx = session.beginTransaction(); // 开始事务

            // 计算起始索引，页码从1开始
            int firstResult = (page - 1) * size;
            String hql = "FROM User ORDER BY id"; // 或者按需要排序的字段

            users = session.createQuery(hql, User.class)
                    .setFirstResult(firstResult)
                    .setMaxResults(size)
                    .getResultList();

            tx.commit(); // 提交事务
        } catch (RuntimeException e) {
            if (tx != null) tx.rollback(); // 发生异常，回滚事务
            throw e;
        }

        return users;
    }

}

