import com.opensymphony.xwork2.Action;

public class HelloAction implements Action {
    // 与前端页面input中的name保持一致，并提供get和set方法，可以接收参数
    private String userName;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("前端传过来的名字：" + userName);
        return "success";
    }

}
