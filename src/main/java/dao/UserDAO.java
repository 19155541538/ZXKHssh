package dao;

import dao.base.GenericDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
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
}

