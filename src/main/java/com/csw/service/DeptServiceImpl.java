package com.csw.service;

import com.csw.dao.DeptDao;
import com.csw.entity.Dept;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeptServiceImpl implements DeptService {
    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> qa() {
        return deptDao.qa();
    }

    @Override
    public void add(Dept dept) {
        System.out.println("service dept/" + dept);
        deptDao.add(dept);
    }
}
