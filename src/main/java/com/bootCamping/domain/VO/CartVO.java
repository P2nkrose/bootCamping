package com.bootCamping.domain.VO;

import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class CartVO {
    private int cartid;
    @NotNull
    @NotEmpty
    private int cid;
    @NotNull
    @NotEmpty
    private int mid;
    @NotNull
    @NotEmpty
    private int amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;

    private String name;
    private double price;
    private String filename;
}
