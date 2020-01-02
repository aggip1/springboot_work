package com.ag.service;

import com.ag.entity.Emp;

import java.util.List;
import java.util.Map;

public interface EmpService {
    public Map<String,Object> queryAllEmp(Integer page, Integer rows);

}
