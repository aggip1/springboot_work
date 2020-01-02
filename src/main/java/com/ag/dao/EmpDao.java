package com.ag.dao;

import com.ag.entity.Emp;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EmpDao {
    public List<Emp> selectAllEmp(@Param("start") Integer start,@Param("rows") Integer rows);
    //总条数
    public Integer selectCount();
}
