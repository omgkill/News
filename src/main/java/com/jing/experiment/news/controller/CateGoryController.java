package com.jing.experiment.news.controller;

import com.jing.experiment.news.bean.CategoryBean;
import com.jing.experiment.news.bean.NewsBean;
import tk.mybatis.mapper.common.Mapper;

import javax.annotation.Resource;
import java.util.List;

public class CateGoryController {

    @Resource
    private Mapper<CategoryBean> mapperCate;

    /**
     * @Description: 查询所有的分类
      * @param null
     * @author jingShuai
     *  @Date 2018/3/23 16:35
     */
    public List<CategoryBean> queryAllCategory(){
        return mapperCate.selectAll();
    }
}
