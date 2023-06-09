package com.bootCamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
public class RippleDTO {

    private int rippleid;
    private int boardnum;
    private int customerid;
    private String content;
    private Date regdate;

    private CustomerDTO customerDTO;
}
