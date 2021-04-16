package com.csw.service;

import com.csw.entity.Tag;

import java.util.List;

public interface TagService {
    void add(Tag tag);

    List<Tag> qa();

    void del(String id);
}
