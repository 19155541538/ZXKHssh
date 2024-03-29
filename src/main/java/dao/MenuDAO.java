package dao;

import dao.base.GenericDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import pojo.Menu;

import java.util.List;

public class MenuDAO extends GenericDAO<Menu> {

    public MenuDAO(SessionFactory sessionFactory) {
        super(sessionFactory, Menu.class);
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
}
