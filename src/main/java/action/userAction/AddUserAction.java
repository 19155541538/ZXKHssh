package action.userAction;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import pojo.User;

import static service.Impl.UserServiceImpl.sessionFactory;

public class AddUserAction extends ActionSupport {

    private User user;
    private  UserDAO userDAO;

    public AddUserAction() {
        this.userDAO = new UserDAO(sessionFactory);
    }

    public String execute() {
        System.out.println("进入到了新增用户的Action里面");
        System.out.println("新增用户信息"+ user.toString());
        User userAdd = userDAO.saveOrUpdate(user);
        if (userAdd.getUserId() != null) {
            // 用户添加成功，重定向到一个成功页面
            return SUCCESS;
        } else {
            // 用户添加失败，重定向到一个错误页面
            return ERROR;
        }
    }

    // Getter and Setter for user
    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
