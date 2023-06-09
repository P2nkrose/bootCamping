package com.bootCamping.domain.DTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class CartDTO {
    private int cartid;
    @NotNull
    private int cid;
    @NotNull
    private int mid;
    @NotNull
    private int amount;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date regdate;


    private String name;
    private double price;
    private String filename;
}
