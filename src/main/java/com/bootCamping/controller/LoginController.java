package com.bootCamping.controller;

import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.CustomerVO;
import com.bootCamping.mapperService.LoginService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
@Log4j2
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/customer/login")
    public String login() {
        return "customer/login";
    }

    @PostMapping("/customer/login")
    public String loginFormController(CustomerDTO customerDTO,
                                      BindingResult bindingResult,
                                      HttpSession session,
                                      RedirectAttributes redirectAttributes) {
        log.info(customerDTO);
        log.info("Login().....");
        CustomerDTO customer = loginService.loginInformation(customerDTO);
        log.info("LoginInformation : " + customer);
        if (bindingResult.hasErrors() || customer == null) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/customer/login";
        } else {
            session.setAttribute("customer", customer);
            return "redirect:/";
        }
    }

    @GetMapping("/customer/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}