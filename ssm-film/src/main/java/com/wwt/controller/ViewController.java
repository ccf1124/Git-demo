package com.wwt.controller;

import com.wwt.entity.Admin;
import com.wwt.entity.FilmCategory;
import com.wwt.service.AdminService;
import com.wwt.service.FilmCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;

@Controller
public class ViewController {

    @Autowired
    private AdminService adminService;
    /**
     * 登录界面
     * @return
     */
    @RequestMapping("/adminlogin")
    public String adminLogin(){
        return "admin/login";
    }
    @RequestMapping("/loginadmin")
    @ResponseBody
    public String admin(Admin admin, HttpServletRequest request,Model model){
        Admin a= null;
        try {

            a = adminService.login(admin);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        System.out.println(a);
        if (a!=null){
            HttpSession session=request.getSession();
            session.setAttribute("admin",a);
            model.addAttribute("admin",a);
            return "ok";
        }
        return "redirect:/root/admin";
    }

}
