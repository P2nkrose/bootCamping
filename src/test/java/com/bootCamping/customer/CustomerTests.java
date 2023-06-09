package com.bootCamping.customer;



import com.bootCamping.domain.Customer;
import com.bootCamping.domain.VO.CustomerVO;
import com.bootCamping.mapper.CustomerMapper;
import com.bootCamping.mapperService.CustomerService;
import lombok.extern.log4j.Log4j2;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import java.util.Optional;


@Log4j2
@ExtendWith(SpringExtension.class)
@SpringBootTest
public class CustomerTests {
    @Autowired(required = false)
    private  CustomerMapper customerMapper;

    @Autowired
    private CustomerService customerService;
    @Test
    public void testGetOneCustomer() {
        log.info(customerMapper.getOneCustomer(1));

    }

    @Test
    public void testDeleteCustomer() {
        Long cid = 2L;
        customerService.deleteCustomer(cid);
    }

    @Test
    public void testUpdateCustomer(){
        Long cid = 1L;
    }

    @Test
    public void testGetOneCustomerById() {
        log.info(customerMapper.getOneCustomer(1));
    }
}
