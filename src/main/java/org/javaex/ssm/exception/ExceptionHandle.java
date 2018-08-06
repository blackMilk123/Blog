package org.javaex.ssm.exception;

import com.google.gson.Gson;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/*全局异常处理器
* */
public class ExceptionHandle implements HandlerExceptionResolver {
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest,
                                         HttpServletResponse httpServletResponse, Object handler, Exception e) {
        //先打印错误信息
        e.printStackTrace();
        //定义异常信息提示
        String message = "系统异常 请稍后重试";
        if (e instanceof  exceptionClass){
            message = ((exceptionClass)e) .getMessage();
        }
        HandlerMethod handMethod = (HandlerMethod)handler;
        ResponseBody responseBody = handMethod.getMethod().getAnnotation(ResponseBody.class);
        //判断请求类型
        if (responseBody != null){
            Map<String, Object> responseMap = new HashMap<String, Object>();
            responseMap.put("status", "500");
            responseMap.put("msg", message);
            String json = new Gson().toJson(responseMap);
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.setContentType("application/json; charset=utf-8");
            try {
                httpServletResponse.getWriter().write(json);
                httpServletResponse.getWriter().flush();
            } catch (IOException e1) {
                e1.printStackTrace();
            }
            return  new ModelAndView();
        }

        // 2.2 如果是跳转页面的请求，则跳转到错误页面
        // 页面转发（跳转至错误页面）
        ModelAndView modelAndView = new ModelAndView();
        //将错误信息传到页面
        modelAndView.addObject("message", message);
        //指向错误页面
        modelAndView.setViewName("error");

        return modelAndView;



    }
}
