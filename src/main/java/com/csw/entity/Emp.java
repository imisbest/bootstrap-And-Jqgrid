package com.csw.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

import java.util.List;

@NoArgsConstructor
@Accessors(chain = true)
@Data
@Component
public class Emp {
    private String id;// varchar(99),
    private String name;// varchar(99),
    private String salary;//  varchar(99),
    private String age;// varchar(99),
    @DateTimeFormat(pattern = "YYYY/MM/dd")
    @JsonFormat(pattern = "YYYY/MM/dd HH:mm:ss", timezone = "GMT+8")
    private String bir;// DATE,
    private String did;// varchar(99)
    /**
     *
     */
    private List<Tag> tags;
    private Dept dept;

    public Emp(String id, String name, String salary, String age, String bir, String did) {
        this.id = id;
        this.name = name;
        this.salary = salary;
        this.age = age;
        this.bir = bir;
        this.did = did;
    }
}
