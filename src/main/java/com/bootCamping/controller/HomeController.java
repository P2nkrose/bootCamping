package com.bootCamping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class HomeController {

    @GetMapping("/")
    public String HomeController(HttpSession httpSession) {
        httpSession.getAttribute("customer");
        return "index";
    }
}
