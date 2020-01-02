package com.ag;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.ag.dao")
public class SpringbootWorkApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringbootWorkApplication.class, args);
        System.out.println("我在运行");
    }

}
