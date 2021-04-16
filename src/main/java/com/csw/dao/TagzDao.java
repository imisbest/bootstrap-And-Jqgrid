package com.csw.dao;

import com.csw.entity.Tagz;

public interface TagzDao {
    void add(Tagz tagz);

    void remove(String id);

    void deleteTid(String iddir);
}
