package com.bootCamping.domain.VO;

import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class BoardVO {
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
