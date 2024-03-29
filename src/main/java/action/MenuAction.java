package action;

import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import dao.base.GenericDAO;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import pojo.Menu;

import java.util.List;

public class MenuAction  implements Action{

    private MenuDAO menuDAO;

    public MenuAction(SessionFactory sessionFactory) {
        this.menuDAO = new MenuDAO(sessionFactory);
    }


    @Override
    public String execute() throws Exception {
        return null;
    }
}
