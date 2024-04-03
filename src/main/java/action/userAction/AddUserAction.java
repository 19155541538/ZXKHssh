package action.userAction;

import com.opensymphony.xwork2.Action;
import dao.UserDAO;
import pojo.User;

import static service.Impl.UserServiceImpl.sessionFactory;

public class AddUserAction implements Action {

    private User user;
    private  UserDAO userDAO;

    private String errorMessage;

    public AddUserAction() {
        this.userDAO = new UserDAO(sessionFactory);
    }

    public String execute() {
        try {
            System.out.println("进入到了新增用户的Action里面");
            System.out.println("新增用户信息" + user.toString());
            User userAdd = userDAO.saveOrUpdate(user);
            if (userAdd.getUserId() != null) {
                return SUCCESS;
            } else {
                this.setErrorMessage("用户添加失败，无法获取用户ID。");
                return ERROR;
            }
        } catch (Exception e) {
            this.setErrorMessage("用户添加异常：" + e.getMessage());
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

    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }
}
