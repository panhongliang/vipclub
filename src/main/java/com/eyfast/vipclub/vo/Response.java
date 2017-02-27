package com.eyfast.vipclub.vo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.ValueFilter;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Administrator on 2017-02-21.
 */
public class Response<E> {

    private int code=0;//0成功，1：失败
    private String msg;
    private Object data;

    public static Response success(){
        Response r=new Response();
        r.setMsg("操作成功");
        r.setCode(0);
        return r;
    }
    public static Response fail(String msg){
        Response r=new Response();
        r.setMsg(msg);
        r.setCode(1);
        return r;
    }
    public static <E> Response success(E e){
        Response r=new Response();
        r.setMsg("操作成功");
        r.setCode(0);
        r.setData(JSONObject.parse(JSON.toJSONString(e,r.new MyValueFilter())));/**值会格式化**/
        return r;
    }

    /**
     * 值格式化
     * @author panhl1
     *
     */
    class MyValueFilter implements ValueFilter {

        private SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        @Override
        public Object process(Object o, String propertyName, Object propertyValue) {
            /**空值处理**/
            if(propertyValue==null){
                return "";
            }
            /**价钱格式化**/
            if(propertyName.indexOf("Price")>-1){
                if(propertyValue==null){
                    return propertyValue="0.00";
                }
                DecimalFormat df1 = new DecimalFormat("###0.00");
                return df1.format(propertyValue);
            }
            /**日期格式化**/
            if(propertyValue instanceof Date){
                return dateFormat.format(propertyValue);
            }
            return propertyValue;
        }
    }

    public Object getData() {
        return data;
    }

    public Response setData(Object data) {
        this.data = data;
        return this;
    }

    public int getCode() {
        return code;
    }

    public Response setCode(int code) {
        this.code = code;
        return this;
    }

    public String getMsg() {
        return msg;
    }

    public Response setMsg(String msg) {
        this.msg = msg;
        return this;
    }

}
