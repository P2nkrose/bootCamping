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
public class Report {
    private int reportid;
    private int boardid;
    private int customerid;
    private String reason;
    private boolean islogin;
    private Date regdate;
}