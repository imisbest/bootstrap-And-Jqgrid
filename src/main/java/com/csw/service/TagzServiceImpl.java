package com.csw.service;

import com.csw.dao.TagzDao;
import com.csw.entity.Tagz;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class TagzServiceImpl implements TagzService {
    @Autowired
    private TagzDao tagzDao;

    @Override
    public void add(Tagz tagz) {
        tagzDao.add(tagz);
    }

    @Override
    public void remove(String id) {
        tagzDao.remove(id);
    }

    @Override
    public void deleteTid(String iddir) {
        tagzDao.deleteTid(iddir);
    }
}
