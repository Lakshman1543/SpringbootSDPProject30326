package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.model.Curator;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.UserService;
import com.klef.jfsd.springboot.service.CuratorService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

    @Autowired
    private AdminService adminService;

    @Autowired
    private UserService userService;

    @Autowired
    private CuratorService curatorService;

    @GetMapping("/")
    public ModelAndView index() {
        return new ModelAndView("index");
    }

    @GetMapping("login")
    public ModelAndView login() {
        return new ModelAndView("login");
    }

    @PostMapping("checklogin")
    public ModelAndView checklogin(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        String identifier = request.getParameter("identifier"); // Use 'email' for User and Curator, 'username' for Admin
        String password = request.getParameter("password");

        Admin admin = adminService.checkadminlogin(identifier, password);
        User user = userService.checkuserlogin(identifier, password);
        Curator curator = curatorService.checkcuratorlogin(identifier, password);

        if (admin != null) {
        	HttpSession session = request.getSession();
			session.setAttribute("admin", admin);
            mv.setViewName("adminhome");
        } 
        else if (user != null) {
            if ("Accepted".equals(user.getAccountstatus())) {
            	HttpSession session = request.getSession();
    			session.setAttribute("user", user);
                mv.setViewName("userhome");
            } 
            else if ("pending".equals(user.getAccountstatus())) {
                mv.addObject("message", "Your account is pending approval.");
                mv.setViewName("login");
            } 
            else if ("rejected".equals(user.getAccountstatus())) {
                mv.addObject("message", "Your account has been rejected.");
                mv.setViewName("login");
            }
            else {
                mv.addObject("message", "Your account is disabled.");
                mv.setViewName("login");
            }
        } 
        else if (curator != null) {
        	HttpSession session = request.getSession();
			session.setAttribute("curator", curator);
            mv.setViewName("curatorhome");
        } 
        else {
            mv.addObject("message", "Login failed, please check your credentials.");
            mv.setViewName("login");
        }
        return mv;
    }

    @GetMapping("logout")
    public ModelAndView logout(HttpServletRequest request) {
    	HttpSession session = request.getSession();
		session.invalidate();
        return new ModelAndView("login");
    }

    @GetMapping("sessionexpired")
    public ModelAndView sessionExpired() {
        return new ModelAndView("sessionexpired");
    }
    
 
}
