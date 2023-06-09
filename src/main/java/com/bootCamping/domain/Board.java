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
public class Board {
    private int boardid;
    private String customerid;
    private String title;
    private String content;
    private int hit;
    private String filename;
    private int filesize;
    private int ripplecount;
    private Date regdate;
}
