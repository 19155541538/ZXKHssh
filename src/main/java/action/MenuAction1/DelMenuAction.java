package action.MenuAction1;

import com.opensymphony.xwork2.Action;
import dao.MenuDAO;
import pojo.Menu;

import static service.Impl.UserServiceImpl.sessionFactory;

public class DelMenuAction implements Action {

    private Integer menuId;

    private MenuDAO menuDAO;

    public DelMenuAction() {
        menuDAO = new MenuDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        System.out.println("进入到了删除的方法里面");
        System.out.println(menuId);
        Menu byId = menuDAO.findById(menuId);
        boolean delete = menuDAO.delete(byId);
        if (delete) {
            // 如果成功删除，返回成功
            return SUCCESS;
        } else {
            // 如果删除失败，返回错误
            return ERROR;
        }
    }


    public Integer getMenuId() {
        return menuId;
    }

    public void setMenuId(Integer menuId) {
        this.menuId = menuId;
    }
}
