package com.csw.controller;

import com.csw.entity.Dept;
import com.csw.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("d")
public class DeptController {
    @Autowired
    private DeptService deptService;

    @RequestMapping("qa")
    @ResponseBody
    public List<Dept> qa() {
        List<Dept> depts = deptService.qa();
        depts.forEach(dept -> System.out.println("qa/dept/" + dept));
        return depts;
    }

    @RequestMapping("qa2")
    @ResponseBody
    public void qa2(HttpServletResponse response) throws IOException {
        List<Dept> depts = deptService.qa();
        StringBuilder sb = new StringBuilder();
        sb.append("<select>");
        //构建select代码
        depts.forEach(dept -> {
            sb.append("<option value='" + dept.getId() + "'>" + dept.getName() + "</option>");
        });
        sb.append("</select>");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(sb.toString());
    }

    @RequestMapping("add")
    public String add(String deptname) {
        System.out.println("deptname/" + deptname);
        deptService.add(new Dept(UUID.randomUUID().toString(), deptname));
        return "redirect:/home.jsp";
    }

}
