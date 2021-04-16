package com.csw.controller;

import com.csw.entity.Tag;
import com.csw.service.TagService;
import com.csw.service.TagzService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("t")
public class TagController {
    @Autowired
    private TagService tagService;
    @Autowired
    private TagzService tagzService;

    @RequestMapping("add")
    @ResponseBody
    public void add(Tag tag) {
        System.out.println("contrallor tag;;" + tag);
        tag.setId(UUID.randomUUID().toString());
        tagService.add(tag);
        // return null;
    }

    @RequestMapping("qa")
    @ResponseBody
    public List<Tag> qa() {
        List<Tag> tags = tagService.qa();
        return tags;
    }

    @RequestMapping("qa2")
    @ResponseBody
    public void qa2(HttpServletResponse response) throws IOException {
        List<Tag> tags = tagService.qa();
        StringBuilder sb = new StringBuilder();
        sb.append("<select>");
        //构建select代码
        tags.forEach(tag -> {
            sb.append("<option value='" + tag.getId() + "'>" + tag.getTag() + "</option>");
        });
        sb.append("</select>");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().print(sb.toString());
    }

    @ResponseBody
    @RequestMapping("del")
    private void del(String iddir) {
        System.out.println("controller id/" + iddir);
        tagService.del(iddir);
        tagzService.deleteTid(iddir);
        // return null;
    }
}
