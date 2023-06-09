package com.bootCamping.mapper;

import com.bootCamping.domain.Customer;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.CustomerVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface CustomerMapper {
    void addCustomer(CustomerVO customerVO);
    int isExistId(CustomerVO customerVO);

    void updateCustomer(CustomerVO customer);
    void deleteCustomer(Long cid);
    List<Customer> getListCustomer(Customer customer);
    CustomerVO getOneCustomerById(String id);

    CustomerVO getOneCustomer(int cid);

}