package action;



import org.apache.struts2.ServletActionContext;
import javax.servlet.http.HttpServletRequest;
import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import dao.UserDAO;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SessionFactory;
import pojo.Menu;
import pojo.User;
import util.HibernateUtil;

import java.util.List;

public class LoginAction implements Action {

    private String errorMessage;
    private List<Menu> menuList;
    private String userName;
    private String passWord;

    private UserDAO userDAO;
    private MenuDAO menuDAO;



    public LoginAction() {
        SessionFactory sessionFactory = HibernateUtil.getSessionFactory(); // 确保你有一个方法来获取SessionFactory
        this.userDAO = new UserDAO(sessionFactory);
        this.menuDAO = new MenuDAO(sessionFactory);
    }



    /*
    * 登陆
    * */
    @Override
    public String execute() {
        System.out.println("前端传过来的名字：" + userName);
        System.out.println("前端传过来的密码：" + passWord);
        User user = userDAO.getUserByUsernameAndPassword(userName, passWord);
        if (user != null) {
            menuList = menuDAO.findByRoleId(user.getRoleId());
            for (int i = 0; i < menuList.size(); i++) {
                System.out.println("菜单名为：" + menuList.get(i).getMenuName());
            }
            HttpServletRequest request = ServletActionContext.getRequest();
            request.setAttribute("menuList", menuList);
            request.setAttribute("userName",user.getName());
            // 如果需要，可以将 menuList 存储到类成员变量中，以便在视图中使用
            return "success";
        } else {
            errorMessage = "密码错误";
            return ERROR;
        }
    }


    /*
    * 退出登陆
    * */
    public String logout(){
        return SUCCESS;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public UserDAO getUserDAO() {
        return userDAO;
    }

    public void setUserDAO(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public MenuDAO getMenuDAO() {
        return menuDAO;
    }

    public void setMenuDAO(MenuDAO menuDAO) {
        this.menuDAO = menuDAO;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
