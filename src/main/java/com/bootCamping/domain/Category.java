package com.bootCamping.domain;

import lombok.*;
import lombok.extern.log4j.Log4j2;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class Category {

    private int categoryid;
    private String categorytype;

}
