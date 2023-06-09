package com.bootCamping.mapperService;

import com.bootCamping.domain.DTO.AdminDTO;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.CustomerVO;
import org.springframework.stereotype.Service;

@Service
public interface LoginService {

    CustomerDTO loginInformation(CustomerDTO customerDTO);
    AdminDTO loginAdminInformation(AdminDTO adminDTO);
}
