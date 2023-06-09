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
public class Payment {
    private int paymentid;
    private String name;
    private double price;
    private int amount;
    private int customerid;
    private Date regdate;
}
