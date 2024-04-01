package action.MenuAction1;

import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import pojo.Menu;

import static service.Impl.UserServiceImpl.sessionFactory;

public class AddMenuAction implements Action {

    private Menu menu;

    private MenuDAO menuDAO;

    public AddMenuAction() {
        menuDAO = new MenuDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        System.out.println("进入到了新增按钮的里面");
        System.out.println(menu.toString());
        Menu menu1 = menuDAO.saveOrUpdate(menu);
        if (menu1.getMenuId() != null){
            // 如果成功删除，返回成功
            return SUCCESS;
        } else {
            // 如果删除失败，返回错误
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
