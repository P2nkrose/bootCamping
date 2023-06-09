    package com.bootCamping.domain.VO;


    import lombok.*;

    import java.util.Date;

    @Getter
    @NoArgsConstructor
    @AllArgsConstructor
    @Builder
    @ToString
    public class CustomerVO {
        private int cid;
        private String name;
        private String id;
        private String passwd;
        private String phone;
        private String zipcode;
        private String address1;
        private String address2;
        private Date birth;
        private String rememberme;
        private String snslogin;
        private Date regdate;
    
    }
