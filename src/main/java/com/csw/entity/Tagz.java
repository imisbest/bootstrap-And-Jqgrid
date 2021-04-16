package com.csw.entity;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.stereotype.Component;

@NoArgsConstructor
@Accessors(chain = true)
@Data
@Component
public class Tagz {
    private  String id ;//varchar(11),
    private  String tid;// varchar(11),
    private  String eid;// varchar(11)
    private  Tag tag;
    private  Emp emp;

    public Tagz(String id, String tid, String eid) {
        this.id = id;
        this.tid = tid;
        this.eid = eid;
    }
}
