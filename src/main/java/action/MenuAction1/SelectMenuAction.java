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

    private final MenuDAO menuDAO;

    public SelectMenuAction() {
        this.menuDAO = new MenuDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        menuList = menuDAO.selectAllMenu();
        System.out.println("查询出来菜单信息有：" + menuList.size());
        for (int i = 0; i < menuList.size(); i++) {
            System.out.println(menuList.get(i).getMenuName());
        }
        request.setAttribute("menuList", menuList);
        return "goMenuPage";
    }

    /*
     * get和set
     * */

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }
}
