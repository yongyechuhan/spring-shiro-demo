package com.liuxin.shiro.dao;

import java.util.List;

import com.liuxin.shiro.entity.Resource;

public interface ResourceDao {

    public Resource createResource(Resource resource);
    public Resource updateResource(Resource resource);
    public void deleteResource(Long resourceId);

    Resource findOne(Long resourceId);
    List<Resource> findAll();

}
