package com.bootCamping.domain.VO;

import com.bootCamping.domain.DTO.BoardDTO;
import lombok.*;

import java.util.Date;

@Getter
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class RippleVO {

    private int rippleid;
    private int boardnum;
    private int customerid;
    private String content;
    private Date regdate;

}
