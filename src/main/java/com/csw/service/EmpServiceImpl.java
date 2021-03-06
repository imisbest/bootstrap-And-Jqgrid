package com.csw.service;

import com.csw.dao.EmpDAO;
import com.csw.entity.Emp;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by HIAPAD on 2019/11/12.
 */
@Service
@Transactional
public class EmpServiceImpl implements EmpService {


    @Autowired
    private EmpDAO empDAO;

    @Override
    public Long findTotalCountsSearch(String searchField, String searchString, String searchOper) {
        if (searchField.equals("dept.id")){
            searchField="d.name";
        }else{
            searchField="e."+searchField;
        }
        return empDAO.findTotalCountsSearch(searchField,searchString,searchOper);
    }

    @Override
    public List<Emp> findSearch(String searchField, String searchString, String searchOper, Integer page, Integer rows) {
        if (searchField.equals("dept.id")){
            searchField="d.name";
        }else{
            searchField="e."+searchField;
        }
        int start = (page-1)*rows;
        return empDAO.findSearch(searchField,searchString,searchOper,start,rows);
    }

    @Override
    public void delete(String id) {
        empDAO.delete(id);
    }

    @Override
    public void update(Emp emp) {
        empDAO.update(emp);
    }

    @Override
    public void save(Emp emp) {
        empDAO.save(emp);
    }

    @Override
    public Long findTotalCounts() {
        return empDAO.findTotalCounts();
    }

    @Override
    public List<Emp> findAll(Integer page, Integer rows) {
        System.out.println("service page//SSSSSSSSSSS//"+page);
        System.out.println("service rows//SSSSSSSSSSS//"+rows);
        int start = (page-1)*rows;
        System.out.println("service stars//SSSSSSSSSSS//"+start);
        return empDAO.findByPage(start,rows);
    }
}
