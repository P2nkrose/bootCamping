package com.bootCamping.mapperServiceImpl;

import com.bootCamping.domain.Customer;
import com.bootCamping.domain.DTO.CustomerDTO;
import com.bootCamping.domain.VO.CustomerVO;
import com.bootCamping.mapper.CustomerMapper;
import com.bootCamping.mapperService.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class CustomerServiceImpl implements CustomerService {

    private final CustomerMapper customerMapper;
    private final ModelMapper modelMapper;

    @Override
    public void addCustomer(CustomerDTO customerDTO){
        CustomerVO customerVO = modelMapper.map(customerDTO,CustomerVO.class);
        customerMapper.addCustomer(customerVO);

    }
    @Override
    public boolean isExistId(CustomerDTO customerDTO){
        CustomerVO customerVO = modelMapper.map(customerDTO,CustomerVO.class);

        if (customerMapper.isExistId(customerVO)>0){
            return true;
        }else {
            return false;
        }
    }

    @Override
    public void updateCustomer(CustomerDTO customer) {
        log.info("update()...");
        CustomerVO customerVO = modelMapper.map(customer, CustomerVO.class);
        log.info(customerVO);
        customerMapper.updateCustomer(customerVO);

    }


    @Override
    public boolean deleteCustomer(Long cid) {
        customerMapper.deleteCustomer(cid);
        return false;
    }

    @Override
    public CustomerDTO getOneCustomerById(CustomerDTO customerDTO) {
        CustomerVO customerVO = customerMapper.getOneCustomerById(customerDTO.getId());
        if (customerVO == null){
            return null;
        }
        if (customerVO.getPasswd() == null){
            customerDTO = modelMapper.map(customerVO, CustomerDTO.class);
            return customerDTO;
        }
        else if (customerVO.getPasswd().equals(customerDTO.getPasswd())){
            customerDTO = modelMapper.map(customerVO, CustomerDTO.class);
            return customerDTO;
        }
        return null;
    }


    @Override
    public List<Customer> getListCustomer(Customer customer) {
        return customerMapper.getListCustomer(customer);
    }

    @Override
    public CustomerDTO getOneCustomer(int cid) {
        return modelMapper.map(customerMapper.getOneCustomer(cid), CustomerDTO.class);
    }
}