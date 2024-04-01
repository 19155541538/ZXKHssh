package action.userAction;

import com.opensymphony.xwork2.Action;
import dao.UserDAO;
import pojo.User;

import static service.Impl.UserServiceImpl.sessionFactory;

public class UpdateUserAction implements Action {


    private User user;
    private UserDAO userDAO;

    public UpdateUserAction() {
        this.userDAO = new UserDAO(sessionFactory);
    }

    @Override
    public String execute() throws Exception {
        System.out.println(user);
        // 从数据库获取当前用户信息
        User existingUser = userDAO.findById(user.getUserId());


        if (existingUser == null) {
            return "error";
        }

        // 更新用户信息，如果前端提供了新值
        if (user.getName() != null) existingUser.setName(user.getName());
        if (user.getUserName() != null) existingUser.setUserName(user.getUserName());
        if (user.getPassWord() != null && !user.getPassWord().isEmpty()) existingUser.setPassWord(user.getPassWord());
        if (user.getBirthDate() != null) existingUser.setBirthDate(user.getBirthDate());
        if (user.getRoleId() != null) existingUser.setRoleId(user.getRoleId());
        if (user.getHeight() != null) existingUser.setHeight(user.getHeight());
        if (user.getGender() != null) existingUser.setGender(user.getGender());
        if (user.getAddress() != null) existingUser.setAddress(user.getAddress());
        if (user.getPhoneNumber() != null) existingUser.setPhoneNumber(user.getPhoneNumber());

        // 保存更新的用户信息
        User updatedUser = userDAO.saveOrUpdate(existingUser);
        if (updatedUser != null && updatedUser.getUserId() != null) {
            return "success";
        }

        return "error";
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
