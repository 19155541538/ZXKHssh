package action.userAction;

import com.opensymphony.xwork2.ActionSupport;
import dao.UserDAO;
import pojo.User;

import static service.Impl.UserServiceImpl.sessionFactory;

public class DelUserAction extends ActionSupport {
    private Integer userId;  // 用户ID

    private UserDAO userDAO;

    public DelUserAction() {
       userDAO = new UserDAO(sessionFactory);
    }

    public String execute() {
        System.out.println(userId);
        User user = new User();
        user.setUserId(userId);

        boolean deleted = userDAO.delete(user);

        if (deleted) {
            // 如果成功删除用户，返回成功
            return SUCCESS;
        } else {
            // 如果删除用户失败，返回错误
            return ERROR;
        }
    }

    // Getter and setter for userId

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
