package action.MenuAction1;

import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import org.apache.struts2.ServletActionContext;
import pojo.Menu;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static service.Impl.UserServiceImpl.sessionFactory;

public class SelectMenuAction implements Action {

    List<Menu> menuList;

    private int currentPage = 1; // 默认当前页为第1页
    private int size = 5; // 默认每页显示5条数据
    private int totalPages; // 总页数

    private final MenuDAO menuDAO;

    public SelectMenuAction() {
        this.menuDAO = new MenuDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();

        // 从请求中获取当前页数
        String pageStr = request.getParameter("currentPage");
        if (pageStr != null && !pageStr.isEmpty()) {
            currentPage = Integer.parseInt(pageStr);
        }

        // 计算总记录数
        int totalItems = menuDAO.countMenus(); // 假设这个方法存在，用于统计菜单总数
        totalPages = (totalItems + size - 1) / size;

        // 分页查询
        menuList = menuDAO.selectMenusByPage(currentPage, size); // 假设这个方法存在，用于按页查询菜单

        // 设置请求属性
        request.setAttribute("menuList", menuList);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalItems", totalItems);

        return "goMenuPage";
    }

    /*
     * Getters and Setters
     */
    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
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
