package action;

import com.opensymphony.xwork2.Action;


public class HelloAction implements Action {
    // 与前端页面input中的name保持一致，并提供get和set方法，可以接收参数
    private String userName;

    private String passWord;

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String execute() throws Exception {
        System.out.println("前端传过来的名字：" + userName);
        System.out.println("前端传过来的密码："+ passWord);
        return "success";
    }

}
