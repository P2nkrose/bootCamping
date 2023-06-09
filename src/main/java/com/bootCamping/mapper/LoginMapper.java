package com.bootCamping.mapper;

import com.bootCamping.domain.DTO.AdminDTO;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.AdminVO;
import com.bootCamping.domain.VO.CustomerVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LoginMapper {
    CustomerDTO loginInformation(CustomerVO customerVO);

    AdminDTO loginAdminInformation(AdminVO adminVO);
}
