package com.bootCamping.controller;

import com.bootCamping.domain.DTO.CartDTO;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.DTO.MenuDTO;
import com.bootCamping.mapperService.CartService;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller()
@Log4j2
public class CartController {

    @Autowired
    private CartService cartService;

    @GetMapping("/customer/myPage/cart")
    public ModelAndView CartController(HttpSession session,ModelAndView modelAndView){
        CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("customer");
        if(customerDTO == null){
            modelAndView.setViewName("/customer/login");
            return modelAndView;
        }

        int customerCID = customerDTO.getCid();
        log.info("customerCID : " +customerCID);

        modelAndView.addObject("cart",cartService.selectCart(customerCID));
        modelAndView.setViewName("/customer/myPage/cart");
//      회원정보를 토대로 장바구니를 가져오는 구문 작성 바람 --> return값 수정요망
        return modelAndView;
    }


    @PostMapping("/cart/addcart")
    public String addCartController(@Valid CartDTO cartDTO,
                                    BindingResult bindingResult,
                                    HttpSession session,
                                    RedirectAttributes redirectAttributes){
        if (session.getAttribute("customer") == null) {
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/customer/login";
        }
        if (bindingResult.hasErrors()) {
            log.info("has error");
            redirectAttributes.addFlashAttribute("error", bindingResult.getAllErrors());
            return "redirect:/menu/listMenu";
        }

        log.info(cartDTO);
        cartService.addCart(cartDTO);
        redirectAttributes.addFlashAttribute("registerOk", "register_ok");
        return "redirect:/customer/myPage/cart";

    }



    @PostMapping("/cart/goPurchase")
    public String purchaseController(String cartIds,HttpSession session,Model model){
        CustomerDTO customerDTO = (CustomerDTO)session.getAttribute("customer");
        if(customerDTO == null){
            return "redirect:/customer/login";
        }
        log.info(cartIds);
        log.info(cartService.purchaseCart(cartIds));
        model.addAttribute("purchase",cartService.purchaseCart(cartIds));

        return "customer/myPage/payment";
    }






}