package com.ag.service.impl;

import com.ag.dao.EmpDao;
import com.ag.entity.Emp;
import com.ag.service.EmpService;
import com.sun.org.apache.bcel.internal.generic.NEW;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpDao empDao;
    @Override
    public Map<String, Object> queryAllEmp(Integer page, Integer rows) {
        /**
         * rows: 数据
         * page: 当前页
         * total: 总页数
         * records:总条数
         */
        Integer records = empDao.selectCount();
        Integer start = (page-1) * rows;
        Integer total  = records % rows ==0 ?  records / rows : records / rows + 1;

        List<Emp> emps = empDao.selectAllEmp(start,rows);
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("rows",emps);
        map.put("page",page);
        map.put("total",total);
        map.put("records",records);
        return map;



    }
}
