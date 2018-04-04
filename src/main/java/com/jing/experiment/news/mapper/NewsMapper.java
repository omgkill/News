package com.jing.experiment.news.mapper;

import java.util.List;

import com.jing.experiment.news.bean.NewsBean;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;



import tk.mybatis.mapper.common.Mapper;

@Repository
public interface NewsMapper {
	@Select("SELECT * FROM news")
	List<NewsBean> queryNewsByCondition(NewsBean newsBean);

	NewsBean queryNewsById(String newsId);

	NewsBean updateNewsById();

	int addNews(NewsBean newsBean);

	List<NewsBean> queryNewsTitleByCategoryId(String categoryId);
}
