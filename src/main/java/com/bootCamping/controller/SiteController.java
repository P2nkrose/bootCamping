package com.bootCamping.controller;

import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Log4j2
public class SiteController {

    @GetMapping("/site/site1")
    public String site1() {
        return "/site/site1";
    }

    @GetMapping("/site/site2")
    public String site2() {
        return "/site/site2";
    }

    @GetMapping("/site/site3")
    public String site3() {
        return "/site/site3";
    }

    @GetMapping("/site/site4")
    public String site4() {
        return "/site/site4";
    }

}