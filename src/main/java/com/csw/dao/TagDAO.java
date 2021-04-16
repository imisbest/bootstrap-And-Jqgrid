package com.csw.dao;

import com.csw.entity.Tag;

import java.util.List;

public interface TagDAO {

    void add(Tag tag);

    List<Tag> qa();

    void del(String id);
}
