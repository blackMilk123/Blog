package org.javaex.ssm.action;

import org.apache.ibatis.annotations.Param;
import org.javaex.ssm.service.UserService;
import org.javaex.ssm.view.Result;
import org.javaex.ssm.view.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("admin")
public class UserAction {
    @Autowired
    private UserService userService;
    @Autowired
    private HttpServletRequest request;

    //后台首页 先检验是否登录,登录了就直接进后台,否则登录
    @RequestMapping("index.action")
    public String index(){
        User user =(User) request.getSession().getAttribute("user");
        if (user == null){
            return "admin/login";
        }
        return "admin/index";
    }
    //跳转到登录页面
    @RequestMapping("login.action")
    public String login() {
        return "admin/login";
    }

    //登录的方法
    @RequestMapping("login.json")
    @ResponseBody
    public Result login(HttpServletRequest httpRequest){

        //拿到用户名和密码
        String username = httpRequest.getParameter("username");
        String password = httpRequest.getParameter("password");
        //校验用户名和密码是否正确
        User user = userService.checkUser(username, password);
        if (user != null){
            //正确存在session里,并返回一个正确的状态码
            httpRequest.getSession().setAttribute("user",user);
            return Result.success("登录成功");
        }
        //否则返回错误
        return Result.error("用户名或密码错误");
    }

    //退出登录 先拿到session,再销毁,最后跳转到登录页面
    @RequestMapping("loginOut.action")
    public String loginOut(HttpSession session){
        session.invalidate();
        return  "admin/login";
    }
}
