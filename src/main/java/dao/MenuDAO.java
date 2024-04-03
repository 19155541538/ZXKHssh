package dao;

import dao.base.GenericDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import pojo.Menu;
import pojo.User;

import java.util.List;

public class MenuDAO extends GenericDAO<Menu> {

    public MenuDAO(SessionFactory sessionFactory) {
        super(sessionFactory, Menu.class);
    }

    public MenuDAO(SessionFactory sessionFactory, Class<Menu> type) {
        super(sessionFactory, type);
    }

    /*
    * 根据角色ID来获取一集导航栏标题
    * */
    public List<Menu> findByRoleId(int roleId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM Menu WHERE roleId = :roleId";
            Query<Menu> query = session.createQuery(hql, Menu.class);
            query.setParameter("roleId", roleId);
            return query.list();
        }
    }

    public List<Menu> selectAllMenu() {
        return findAll();
    }

    public int countMenus() {
        Session session = sessionFactory.getCurrentSession();
        Transaction transaction = null;
        int count = 0;

        try {
            transaction = session.beginTransaction();
            // 确保 Menu 是你菜单实体类的正确类名
            String hql = "SELECT COUNT(m) FROM Menu m";
            Long result = (Long) session.createQuery(hql).uniqueResult();
            count = result.intValue();
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction != null) transaction.rollback();
            throw e; // 或者处理异常
        }

        return count;
    }

    public List<Menu> selectMenusByPage(int currentPage, int size) {
        Session session = sessionFactory.getCurrentSession();
        Transaction tx = null;
        List<Menu> menus = null;

        try {
            tx = session.beginTransaction(); // 开始事务

            // 计算起始索引，页码从1开始
            int firstResult = (currentPage - 1) * size;
            String hql = "FROM Menu ORDER BY id"; // 假设Menu有一个id字段用于排序

            menus = session.createQuery(hql, Menu.class)
                    .setFirstResult(firstResult)
                    .setMaxResults(size)
                    .getResultList();

            tx.commit(); // 提交事务
        } catch (RuntimeException e) {
            if (tx != null) tx.rollback(); // 发生异常，回滚事务
            throw e;
        }

        return menus;
    }

}
