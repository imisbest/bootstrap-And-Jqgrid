package com.csw.service;

import com.csw.dao.TagDAO;
import com.csw.entity.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class TagServiceImpl implements TagService {
    @Autowired
    private TagDAO tagDao;
    @Override
    public void add(Tag tag) {
        tagDao.add(tag);
    }

    @Override
    public List<Tag> qa() {
        return tagDao.qa();
    }

    @Override
    public void del(String id) {
        tagDao.del(id);
    }
}
