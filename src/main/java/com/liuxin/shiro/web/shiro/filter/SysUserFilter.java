package com.liuxin.shiro.web.shiro.filter;

import com.liuxin.shiro.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.PathMatchingFilter;
import org.apache.shiro.web.servlet.ShiroHttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class SysUserFilter extends PathMatchingFilter {

    private Logger logger = LoggerFactory.getLogger(SysUserFilter.class);

    @Autowired
    private UserService userService;

    @Override
    protected boolean onPreHandle(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
        Subject subject = SecurityUtils.getSubject();
        String username = (String)subject.getPrincipal();
        request.setAttribute("user", userService.findByUsername(username));
        ShiroHttpServletRequest servletRequest = (ShiroHttpServletRequest)request;
        logger.info(resolveReqPermission(servletRequest.getRequestURI()));
        return true;
    }

    private String resolveReqPermission(String requestURI) throws Exception{
        int splitCharNum = requestURI.length() -
                requestURI.replace("\\/","").length();
        String permission = null;
        if(splitCharNum == 1) {
            permission = requestURI.replace("\\/","");
            permission += ":*";
        }
        if(splitCharNum == 2) {
            String[] uriArray = requestURI.split("\\/");
            for(int i = 0; i<uriArray.length; i++){
                String var1 = uriArray[i];
                if(!StringUtils.isEmpty(var1) && !"/".equals(var1)) {
                    permission += uriArray[i] + (i == (uriArray.length - 1) ? "" : ":");
                }
            }
        }
        if(StringUtils.isEmpty(permission)) {
            throw new Exception("不能被授权解析的请求地址！");
        }
        return permission;
    }
}
