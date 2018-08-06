package org.javaex.ssm.view;

import java.util.HashMap;
import java.util.Map;

public class Result {

    //响应的状态消息
    private String msg;
    //响应的状态码 200是成功 500是失败
    private Integer status;
    //数据对象
    private Map<String, Object> data = new HashMap<String, Object>();

    public Map<String, Object> getData() {
        return data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public static  Result success(String msg){
        Result result = new Result();
        result.setStatus(200);
        result.setMsg(msg);
        return result;
    }
    public Result add(String key, Object value) {
        this.getData().put(key, value);
        return this;
    }
    public static  Result success(){
        Result result = new Result();
        result.setStatus(200);
        return result;
    }
    public  static  Result error(String msg){
        Result result = new Result();
        result.setStatus(500);
        result.setMsg(msg);
        return result;
    }

    public Result(String msg, Integer status) {
        this.msg = msg;
        this.status = status;
    }

    public Result(String msg, Integer status, Map<String, Object> data) {
        this.msg = msg;
        this.status = status;
        this.data = data;
    }

    public Result(){}
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }




}
