package com.bootCamping.controller;

import com.bootCamping.mapperService.CartService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/deletecart")
@RequiredArgsConstructor
public class DeleteCartController {

    private final CartService cartService;
    @DeleteMapping("{cartId}")
    public Map<String, String> deleteCart(@PathVariable("cartId") int cartId){
        Map<String, String> map = new HashMap<>();
        try {
            cartService.deleteCart(cartId);
            map.put("result", "삭제성공");
        }
        catch (Exception e){
            map.put("result", "삭제실패");
            e.printStackTrace();
        }
        return map;
    }
}