package com.csw.dao;

import com.csw.entity.Dept;

import java.util.List;

public interface DeptDao {
    List<Dept> qa();

    void add(Dept dept);
}
