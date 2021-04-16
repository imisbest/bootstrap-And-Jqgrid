package com.csw.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Accessors(chain = true)
@Data
@Component
public class Tag {
   private String id;// varchar(99),
   private String tag;// varchar(99)

    public Tag(String id, String tag) {
        this.id = id;
        this.tag = tag;
    }
}
