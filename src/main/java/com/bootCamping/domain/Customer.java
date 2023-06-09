package com.bootCamping.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Customer {
    private int cid;
    private String name;
    private String id;
    private String passwd;
    private String phone;
    private String zipcode;
    private String address1;
    private String address2;
    private Date birth;
    private String rememberme;
    private String snslogin;
    private Date regdate;
}
