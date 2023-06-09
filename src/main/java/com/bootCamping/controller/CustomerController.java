package com.bootCamping.controller;

import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.mapperService.CustomerService;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Base64;

@Controller
@Log4j2
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @GetMapping("/customer/addCustomer")
    public String addCustomer(){
        return "customer/addCustomer";
    }

    @GetMapping("/customer/ajaxIdCheck")
    public void ajaxIdCheckController(String id, HttpServletResponse response) throws IOException {
        log.info("ajaxIdCheck()..................................");
        log.info(id);
        CustomerDTO customerDTO = CustomerDTO.builder()
                .id(id)
                .build();
        log.info(customerDTO);
        boolean a = customerService.isExistId(customerDTO);
        log.info(a);
        response.getWriter().print("{\"result\":\"");
        if (a==true){
            response.getWriter().print("true");
        }else {
            response.getWriter().print("false");
        }
        response.getWriter().print("\"}");
    }


    @PostMapping("/addCustomer")
    public String addCustomerController(@Valid CustomerDTO customerDTO,
                                        BindingResult bindingResult,
                                        RedirectAttributes redirectAttributes){
        log.info("addCustomer..............");
        log.info(customerDTO);

        if(bindingResult.hasErrors()){
            log.info("has error");
            redirectAttributes.addFlashAttribute("errors",bindingResult.getAllErrors());
            return "redirect:/customer/addCustomer";
        }
        customerService.addCustomer(customerDTO);
        redirectAttributes.addFlashAttribute("registerOk","register_ok");
        return "redirect:/";

    }

    @GetMapping("/customer/myPage/detailPage")
    public String  myPage(){
        return "/customer/myPage/detailPage";
    }

    /*회원정보 수정**/
    @GetMapping("/customer/myPage/modifyCustomer")
    public String updateCustomer(){
        return "/customer/myPage/modifyCustomer";
    }

    @PostMapping("/customer/update")
    public String update(@Valid CustomerDTO customerDTO, BindingResult bindingResult,
                         RedirectAttributes redirectAttributes){
        log.info("--------update------------" +customerDTO);
        if (bindingResult.hasErrors()){
            log.info("has errors...");

        }
        customerService.updateCustomer(customerDTO);
        return "/customer/myPage/detailPage";
    }

    @GetMapping("/customer/menu/paySuccess")
    public String PaySuccess(){
        return "/customer/menu/paySuccess";
    }


    @GetMapping(value = "/success")
    public String paymentResult(
            Model model,
            @RequestParam(value = "orderId") String orderId,
            @RequestParam(value = "amount") Integer amount,
            @RequestParam(value = "paymentKey") String paymentKey) throws Exception {

        String secretKey = "test_sk_5mBZ1gQ4YVXDLKkN5X1Vl2KPoqNb:";

        Base64.Encoder encoder = Base64.getEncoder();
        byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
        String authorizations = "Basic " + new String(encodedBytes, 0, encodedBytes.length);

        URL url = new URL("https://api.tosspayments.com/v1/payments/" + paymentKey);

        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Authorization", authorizations);
        connection.setRequestProperty("Content-Type", "application/json");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        JSONObject obj = new JSONObject();
        obj.put("orderId", orderId);
        obj.put("amount", amount);

        OutputStream outputStream = connection.getOutputStream();
        outputStream.write(obj.toString().getBytes("UTF-8"));

        int code = connection.getResponseCode();
        boolean isSuccess = code == 200 ? true : false;
        model.addAttribute("isSuccess", isSuccess);

        InputStream responseStream = isSuccess ? connection.getInputStream() : connection.getErrorStream();

        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
        responseStream.close();
        model.addAttribute("responseStr", jsonObject.toJSONString());
        System.out.println(jsonObject.toJSONString());

        model.addAttribute("method", (String) jsonObject.get("method"));
        model.addAttribute("orderName", (String) jsonObject.get("orderName"));

        if (((String) jsonObject.get("method")) != null) {
            if (((String) jsonObject.get("method")).equals("카드")) {
                model.addAttribute("cardNumber", (String) ((JSONObject) jsonObject.get("card")).get("number"));
            } else if (((String) jsonObject.get("method")).equals("가상계좌")) {
                model.addAttribute("accountNumber", (String) ((JSONObject) jsonObject.get("virtualAccount")).get("accountNumber"));
            } else if (((String) jsonObject.get("method")).equals("계좌이체")) {
                model.addAttribute("bank", (String) ((JSONObject) jsonObject.get("transfer")).get("bank"));
            } else if (((String) jsonObject.get("method")).equals("휴대폰")) {
                model.addAttribute("customerMobilePhone", (String) ((JSONObject) jsonObject.get("mobilePhone")).get("customerMobilePhone"));
            }
        } else {
            model.addAttribute("code", (String) jsonObject.get("code"));
            model.addAttribute("message", (String) jsonObject.get("message"));
        }

        return "success";
    }

    @GetMapping("/fail")
    public String fail(
            Model model,
            @RequestParam(value = "message") String message,
            @RequestParam(value = "code") Integer code
    ) {
        model.addAttribute("code", code);
        model.addAttribute("message", message);
        return "fail";
    }




    @GetMapping("/customer/menu/tossPayment")
    public String tossPayment(){
        return "/customer/menu/tossPayment";
    }

    @GetMapping("/customer/delete")
    public String delete(@RequestParam("cid") Long cid, HttpSession session) {
        log.info("------------------delete---------------");
        log.info("cid: " + cid);
        customerService.deleteCustomer(cid);
        session.invalidate();
        return "redirect:/";
    }

}