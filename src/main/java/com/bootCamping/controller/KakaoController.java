package com.bootCamping.controller;

import com.bootCamping.domain.Customer;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.mapperService.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.text.ParseException;

@Controller
@Log4j2
@RequiredArgsConstructor
@RequestMapping("/auth/kakao/")
public class KakaoController {

    private final CustomerService customerService;

    @Value("${myapp.custom.snsLogin.kakao.clientId}")
    private String kakaoClientId;

    @Value("${myapp.custom.snsLogin.kakao.redirectUri}")
    private String kakaoRedirectUri;


    @GetMapping("/callback")
    public String kakaoLogin(String code, HttpSession session) throws IOException, ParseException, org.json.simple.parser.ParseException {
        log.info(code);

        String urlKakao = "https://kauth.kakao.com/oauth/token?" +
                "grant_type=authorization_code&" +
                "client_id=" + kakaoClientId + "&" +
                "redirect_uri=" + kakaoRedirectUri + "&" +
                "code=" + code;

        URL url = new URL(urlKakao);
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
        connection.setRequestMethod("POST");
        connection.setDoOutput(true);
        OutputStream outputStream = connection.getOutputStream();
        InputStream responseStream = connection.getInputStream();

        Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
        JSONParser parser = new JSONParser();
        JSONObject jsonObject = (JSONObject) parser.parse(reader);
        responseStream.close();

        log.info(jsonObject);

        String accessToken = (String) jsonObject.get("access_token");
        String urlKakaoProfile = "https://kapi.kakao.com/v2/user/me";
        url = new URL(urlKakaoProfile);
        HttpURLConnection connection2nd = (HttpURLConnection) url.openConnection();
        connection2nd.setRequestProperty("Authorization", "Bearer " + accessToken);

        connection2nd.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");

        InputStream responseStream2nd = connection2nd.getInputStream();

        Reader reader2nd = new InputStreamReader(responseStream2nd, StandardCharsets.UTF_8);
        JSONParser parser2nd = new JSONParser();
        JSONObject jsonObject2nd = (JSONObject) parser2nd.parse(reader2nd);
        responseStream2nd.close();

        log.info(jsonObject2nd);

        log.info(jsonObject2nd.get("id"));
        long id = (long) jsonObject2nd.get("id");
        String email = (String) ((JSONObject) jsonObject2nd.get("kakao_account")).get("email");
        CustomerDTO customer = customerService.getOneCustomerById(CustomerDTO.builder().id(email).build());

        if (customer != null){
            session.setAttribute("customer", customer);
            return "redirect:/";
        }
        session.setAttribute("kakaoEmail", email);
        session.setAttribute("kakaoId", id);
        session.setAttribute("nickName", ((JSONObject) ((JSONObject) jsonObject2nd.get("kakao_account")).get("profile")).get("nickname"));

        log.info(id);
        log.info(session.getAttribute("nickName"));
        return "redirect:/auth/kakao/kakaoAddCustomer";
    }

    @GetMapping("/kakaoAddCustomer")
    public String kakaoAddCustomer() {
        return "kakaoAddCustomer";
    }

    @PostMapping("/kakaoAddCustomer")
    public String kakaoAddCustomer(CustomerDTO customer, HttpSession session) {


        customerService.addCustomer(customer);


        session.setAttribute("kakaoId", customer.getId());
        session.setAttribute("nickName", customer.getName());

        // 인덱스 페이지로 리디렉션합니다.
        return "redirect:/";
    }
}