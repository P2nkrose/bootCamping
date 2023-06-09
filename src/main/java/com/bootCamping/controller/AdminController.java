package com.bootCamping.controller;

import com.bootCamping.domain.Customer;
import com.bootCamping.domain.DTO.AdminDTO;
import com.bootCamping.mapperService.CustomerService;
import com.bootCamping.mapperService.LoginService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/admin")
@Log4j2
public class AdminController {

    @Autowired
    private LoginService loginService;
    @Autowired
    private CustomerService customerService;

    @GetMapping("/login")
    public String AdminLoginController() {
        return "admin/login";
    }

    @PostMapping("/login")
    public String AdminPostLoginController(@Valid AdminDTO adminDTO,
                                           HttpServletRequest request,
                                           BindingResult bindingResult,
                                           RedirectAttributes redirectAttributes) {
        log.info("Login().....");
        log.info("LoginInformation : " + loginService.loginAdminInformation(adminDTO));
        if (bindingResult.hasErrors() || loginService.loginAdminInformation(adminDTO) == null) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/";
        } else {
            HttpSession session = request.getSession();
            session.setAttribute("admin", loginService.loginAdminInformation(adminDTO));
            return "admin/index";
        }
    }

    @GetMapping("/index")
    public String AdminIndexController(HttpSession session) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }
        return "/admin/index";
    }


    @GetMapping("/listCustomer")
    public String listCustomer(HttpSession session, Model model) {
        if (session.getAttribute("admin") == null) {
            return "redirect:/admin/login";
        }

        List<Customer> customerList = customerService.getListCustomer(new Customer());
        model.addAttribute("customerList", customerList);

        return "/admin/listCustomer";
    }

}