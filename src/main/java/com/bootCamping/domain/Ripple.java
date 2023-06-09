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
public class Ripple {
    private int rippleid;
    private int boardnum;
    private int customerid;
    private String content;
    private Date regdate;

}