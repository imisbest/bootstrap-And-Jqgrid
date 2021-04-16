package com.csw.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Accessors(chain = true)
@Data
@Component
@AllArgsConstructor
public class Dept {
    private String id;// varchar(99),
    private String name;// varchar(99)

//    public Dept(String id, String name) {
//        this.id = id;
//        this.name = name;
//    }
}
