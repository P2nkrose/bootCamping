package com.bootCamping.mapperService;

import com.bootCamping.domain.Customer;
import com.bootCamping.domain.DTO.CustomerDTO;

import java.util.List;


public interface CustomerService {
    void addCustomer(CustomerDTO customerDTO);

    boolean isExistId(CustomerDTO customerDTO);

    void updateCustomer(CustomerDTO customer);
    boolean deleteCustomer(Long cid);

    CustomerDTO getOneCustomerById(CustomerDTO customerDTO);
    List<Customer> getListCustomer(Customer customer);

    CustomerDTO getOneCustomer(int cid);
}