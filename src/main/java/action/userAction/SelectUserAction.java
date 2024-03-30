package action.userAction;

import com.opensymphony.xwork2.Action;
import dao.UserDAO;
import org.apache.struts2.ServletActionContext;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static service.Impl.UserServiceImpl.sessionFactory;

public class SelectUserAction implements Action {


    private final UserDAO userDAO;

    public SelectUserAction() {
        this.userDAO = new UserDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        List<User> userList = userDAO.selectAllUser();
        System.out.println("查询出来用户信息有："+userList.size());
        for (int i = 0; i < userList.size(); i++) {
            System.out.println(userList.get(i).getName());

        }
        request.setAttribute("userList", userList);
        return "goUserPage";
    }
}
