package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.DTO.AdminDTO;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.AdminVO;
import com.bootCamping.domain.VO.CustomerVO;
import com.bootCamping.mapper.LoginMapper;
import com.bootCamping.mapperService.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService {
    private final LoginMapper loginMapper;
    private final ModelMapper modelMapper;

    @Override
    public CustomerDTO loginInformation(CustomerDTO customerDTO) {
        CustomerVO customerVO = modelMapper.map(customerDTO,CustomerVO.class);
        return loginMapper.loginInformation(customerVO);
    }

    @Override
    public AdminDTO loginAdminInformation(AdminDTO adminDTO) {
        AdminVO adminVO = modelMapper.map(adminDTO, AdminVO.class);
        return loginMapper.loginAdminInformation(adminVO);
    }
}
