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
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CustomerDTO {
    private int cid;
    @NotEmpty
    private String name;
    @NotEmpty
    private String id;
    @NotEmpty
    private String passwd;
    @NotEmpty
    private String phone;
    @NotEmpty
    private String zipcode;
    @NotEmpty
    private String address1;
    @NotEmpty
    private String address2;
    @NotNull
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date birth;

    private String rememberme;
    private String snslogin;
    private Date regdate;


}
