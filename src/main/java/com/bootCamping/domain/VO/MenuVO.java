package com.bootCamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class MenuVO {
    private int mid;
    private String menutype;
    private String name;
    private int amount;
    private double price;
    private String filename;
    private int filesize;
    private Date regdate;
}
