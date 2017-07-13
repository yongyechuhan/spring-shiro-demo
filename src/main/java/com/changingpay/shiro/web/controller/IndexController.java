package com.changingpay.shiro.web.controller;

import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.changingpay.shiro.entity.Resource;
import com.changingpay.shiro.entity.User;
import com.changingpay.shiro.service.ResourceService;
import com.changingpay.shiro.service.UserService;
import com.changingpay.shiro.web.bind.annotation.CurrentUser;

@Controller
public class IndexController {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String index(@CurrentUser User loginUser, Model model) {
    	String username = (String) SecurityUtils.getSubject().getPrincipal();
        Set<String> permissions = userService.findPermissions(username);
        List<Resource> menus = resourceService.findMenus(permissions);
        model.addAttribute("menus", menus);
        return "index";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }
}
