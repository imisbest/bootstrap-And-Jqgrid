package com.csw.service;

import com.csw.entity.Tagz;

public interface TagzService {
    void add(Tagz tagz);

    void remove(String id);

    void deleteTid(String iddir);
}
