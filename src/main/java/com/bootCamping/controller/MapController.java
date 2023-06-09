package com.bootCamping.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MapController {
    @GetMapping("/menu")
    public String Map(){
        return "customer/menu/map";
    }
}
