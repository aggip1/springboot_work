package com.ag.controller;

import com.ag.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.swing.*;
import java.util.Map;
import java.util.Set;

@RequestMapping("/emp")
@RestController
public class EmpController {
    @Autowired
    private EmpService empService;

    @RequestMapping("showAll")
    public Map<String, Object> showAll(Integer rows,Integer page){
        Map<String, Object> map = empService.queryAllEmp(page, rows);
        Set<Map.Entry<String, Object>> entries = map.entrySet();
        for (Map.Entry<String, Object> entry : entries) {

            System.out.println(entry.getKey()+"====="+entry.getValue());
        }
        return map;
    }
}
