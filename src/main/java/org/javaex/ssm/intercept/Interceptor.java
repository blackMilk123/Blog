package org.javaex.ssm.intercept;

import org.javaex.ssm.view.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*拦截器,
拦截登录请求,
登录了才能访问后台,
否则非法访问
*
*
* */
public class Interceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {

        //获取请求的url
        String URI = httpServletRequest.getRequestURI();

        //对登录的url放行,不拦截.其他要进入后台的请求全部拦截
        if (URI.indexOf("login")>=0 || URI.indexOf("portal")>=0 || URI.indexOf("Ajax")>=0) {
            return true;
        }
        //判断session是否存在,存在就允许登录后台
        User user = (User) httpServletRequest.getSession().getAttribute("user");
        if (user != null){
            return true;
        }
        //如果不存在就跳转到登录页面
        httpServletRequest.getRequestDispatcher("/WEB-INF/page/admin/login.jsp").
                forward(httpServletRequest,httpServletResponse);
        return false;

    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
