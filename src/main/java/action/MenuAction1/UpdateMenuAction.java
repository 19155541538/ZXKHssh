package action.MenuAction1;

import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import pojo.Menu;

import static service.Impl.UserServiceImpl.sessionFactory;

public class UpdateMenuAction implements Action {
    private Menu menu;

    private MenuDAO menuDAO;

    public UpdateMenuAction() {
        menuDAO = new MenuDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        System.out.println("进入到了修改导航栏的方法里面");
        System.out.println(menu.toString());
        Menu updateMenu = menuDAO.saveOrUpdate(menu);
        if (updateMenu.getMenuId() != null){
            // 如果成功删除用户，返回成功
            return SUCCESS;
        } else {
            // 如果删除用户失败，返回错误
            return ERROR;
        }
    }

    public Menu getMenu() {
        return menu;
    }

    public void setMenu(Menu menu) {
        this.menu = menu;
    }
}
