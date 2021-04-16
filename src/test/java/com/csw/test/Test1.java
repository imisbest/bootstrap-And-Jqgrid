package com.csw.test;

import com.csw.Application;
import com.csw.dao.EmpDAO;
import com.csw.entity.Emp;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;
import java.util.UUID;

@RunWith(SpringRunner.class)  //==@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
public class Test1 {
    @Autowired
    private EmpDAO empDAO;

    @Test
    public void testqueryAll() {
        List<Emp> emps = empDAO.findAll();
        emps.forEach(e -> System.out.println("/e/" + e));
    }
    @Test
    public  void uuid(){
//        D:\IdeaProjects\RUN\bootstrap-And-Jqgrid
        /*5c2764b4-8cf8-490b-aaa6-e603c67b562d
        * @c2764b48cf8490baaa6e603c67b562d*/
        System.out.println(UUID.randomUUID());
    }
}
