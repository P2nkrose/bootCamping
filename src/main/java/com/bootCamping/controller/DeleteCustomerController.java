package com.bootCamping.controller;

import com.bootCamping.mapperService.CustomerService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/deleteCustomer")
@RequiredArgsConstructor
public class DeleteCustomerController {

    private final CustomerService customerService;

    @DeleteMapping("/{cid}")
    public Map<String, String> deleteCustomer(@PathVariable("cid") Long cid) {
        Map<String, String> map = new HashMap<>();
        try {
            customerService.deleteCustomer(cid);
            map.put("result", "삭제 성공");
        } catch (Exception e) {
            map.put("result", "삭제 실패");
            e.printStackTrace();
        }
        return map;
    }
}