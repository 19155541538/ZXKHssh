package action.userAction;

import com.opensymphony.xwork2.Action;
import dao.UserDAO;
import org.apache.struts2.ServletActionContext;
import pojo.User;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static service.Impl.UserServiceImpl.sessionFactory;

public class SelectUserAction implements Action {

    List<User> userList;

    private int currentPage = 1; // 默认当前页为第1页
    private int size = 5; // 默认每页显示10条数据
    private int totalPages; // 总页数

    private final UserDAO userDAO;

    public SelectUserAction() {
        this.userDAO = new UserDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        // 从请求中获取当前页数
        String pageStr = request.getParameter("currentPage");
        if (pageStr != null && !pageStr.isEmpty()) {
            currentPage = Integer.parseInt(pageStr);
        }

        System.out.println("当前页数为：" + currentPage + "，一页展示多少行：" + size);

        // 计算总记录数
        int totalItems = userDAO.countUsers();
        totalPages = (totalItems + size - 1) / size;

        // 分页查询
        userList = userDAO.selectUsersByPage(currentPage, size);

        System.out.println("查询出来用户信息有：" + userList.size());
        for (User user : userList) {
            System.out.println(user.getName());
        }

        // 将用户列表和分页信息设置到请求属性中
        request.setAttribute("userList", userList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalItems", totalItems);

        return SUCCESS;
    }




    /*
    * get和set
    * */

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getTotalPages() {
        return totalPages;
    }

    public void setTotalPages(int totalPages) {
        this.totalPages = totalPages;
    }
}
