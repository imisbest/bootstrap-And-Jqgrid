package com.csw.controller;

import com.csw.entity.Emp;
import com.csw.entity.Tagz;
import com.csw.service.EmpService;
import com.csw.service.TagzService;
import org.apache.commons.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("e")
public class EmpController {
    @Autowired
    private EmpService empService;
    @Autowired
    private TagzService tagzService;


    //处理编辑操作
    @RequestMapping("edit")
    @ResponseBody
    public void edit(Emp emp, String oper, String[] taglist) {
        System.out.println("EEEEEEEEEEEEEEEEemp//" + emp);
        System.out.println("EEEEEEEEEEEEEEEEEEEoper//" + oper);
        System.out.println("EEEEEEEEEEEEEEEEEEtaglist//" + taglist);

        if(taglist!=null){
            //处理添加
            for (int i = 0; i < taglist.length; i++) {
                System.out.println("EEE" + taglist[i]);
            }
        }

        if (StringUtils.equals("add", oper)) {
            String rrer = UUID.randomUUID().toString();
            /**
             * 添加员工
             */
            System.out.println("id rrer//"+rrer);
            emp.setId(rrer);
            emp.setDid(emp.getDept().getId());
            empService.save(emp);
            /**
             *添加标签
             */
            for (int i = 0; i < taglist.length; i++) {
                System.out.println("EEE" + taglist[i]);
                String tid=taglist[i];
                System.out.println(" taglist rrer//"+rrer);
                tagzService.add(new Tagz(UUID.randomUUID().toString(),tid, rrer));
            }
        }
        //处理修改
        if (StringUtils.equals("edit", oper)) {
            emp.setDid(emp.getDept().getId());
            empService.update(emp);
            /**
             *
             */
            tagzService.remove(emp.getId());
            /**
             *添加标签
             */
            for (int i = 0; i < taglist.length; i++) {
                System.out.println("EEE" + taglist[i]);
                String tid=taglist[i];
                tagzService.add(new Tagz(UUID.randomUUID().toString(),tid, emp.getId()));
            }
        }
        //处理删除
        if (StringUtils.equals("del", oper)) {
            empService.delete(emp.getId());
            tagzService.remove(emp.getId());
        }
    }

    //查询所有
    @RequestMapping("findAll")
    @ResponseBody  //jackson  gson  //jqgrid  table 分页  key  total 总页数  page 当前页  rows:当前页数据集  records 总记录数
    public Map<String, Object> findAll(String searchField, String searchString, String searchOper, Integer page, Integer rows, Boolean _search) {
        System.out.println("searchField/" + searchField);
        System.out.println("searchString/" + searchString);
        System.out.println("searchOper/" + searchOper);
        System.out.println("page/" + page);
        System.out.println("rows/" + rows);
        System.out.println("_search/" + _search);
        //不做搜索处理
        Map<String, Object> map = new HashMap<>();
        List<Emp> lists = null;
        Long totalCounts = null;
        if (_search) {
            //根据搜索条件查询集合
            lists = empService.findSearch(searchField, searchString, searchOper, page, rows);
            //根据搜索条件查询总条数
            totalCounts = empService.findTotalCountsSearch(searchField, searchString, searchOper);
        } else {
            //进行分页查询
            lists = empService.findAll(page, rows);
            lists.forEach(lists1 -> System.out.println("lists/" + lists1));
            //获取总记录数
            totalCounts = empService.findTotalCounts();
        }
        //公共代码
        Long totalPage = totalCounts % rows == 0 ? totalCounts / rows : totalCounts / rows + 1;

        System.out.println("rows数据//" + lists);
        map.put("rows", lists);

        System.out.println("total总页数//" + totalPage);
        map.put("total", totalPage);

        System.out.println("page当前页//" + page);
        map.put("page", page);

        System.out.println("records总条数//" + totalCounts);
        map.put("records", totalCounts);

        return map;
    }

}
