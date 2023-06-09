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
public class Menu {
    private int mid;
    private String menutype;
    private String name;
    private int amount;
    private double price;
    private Date regdate;
}