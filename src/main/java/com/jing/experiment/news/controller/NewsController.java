package com.jing.experiment.news.controller;

import com.github.pagehelper.PageHelper;
import com.jing.experiment.news.bean.NewsBean;
import com.jing.experiment.news.bean.PageInfo;
import com.jing.experiment.news.mapper.NewsMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @ author jings
 * ����ģ��
 */
@RequestMapping("/news")
@RestControllerAdvice
public class NewsController {
    private static final Logger log = LoggerFactory.getLogger(NewsController.class);

    //����ģ��dao
    @Resource
    private NewsMapper newsMapper;


    @Value("${uploadDir:E:/playmyself/News/}")
    private String uploadDir;


    /**
     * @return pageinfo
     * @ Description ������ѯ����
     * @author jingshuai
     * @param newsBean
     * @ Date 2017��12��7��
     */
    @RequestMapping(value = "/queryNewsByCondition", method = RequestMethod.GET)
    public PageInfo<NewsBean> queryNewsByCondition(NewsBean newsBean) {

        //mapper.selectByRowBounds(record, rowBounds)
        List<NewsBean> newsList ;
        PageHelper.offsetPage(newsBean.getOffset(), newsBean.getPageSize());
        //PageHelper.startPage(newsBean.getOffset(),20);
        newsList = newsMapper.queryNewsByCondition(newsBean);
        return new PageInfo<>(newsList);

    }

    public NewsBean updateNewsById() {

        return newsMapper.updateNewsById();
    }

    /**
     * @param id
     * @ Description: 根据id删除对应的新闻
     * @author jingShuai
     * @ Date 2018/4/5 13:37
     */
    @RequestMapping(value = "news", method = RequestMethod.GET)
    public void delNews(String id) {

        log.info("进入删除方法，id ："+id);
        if(id == null || id.equals("")) {
            throw new NullPointerException("id 为空") ;
        }
        int status = newsMapper.deleteByPrimaryKey(id);
        if(status == 0) {
            log.info("该新闻已删除");
        }
        //newsMapper.deleteByIds(id);
    }

    /**
     * @param newsBean
     * @ Description �������
     * @author jingshuai
     * @ Date 2017��12��7��
     * @return string
     */
    @RequestMapping("/addNews")
    public ModelAndView addNews(NewsBean newsBean, @RequestParam("file") MultipartFile multipartFile) {

        if (null == newsBean) {
            throw new NullPointerException("kong");
        }

        Date date = new Date();
        SimpleDateFormat simpleDateFormat =
                new SimpleDateFormat("yyyy"+ File.separator+"MM"+File.separator+"dd");
        String dateDir = simpleDateFormat.format(date);
        if (!multipartFile.isEmpty()) {
            String name = multipartFile.getOriginalFilename();
            String path = uploadDir + dateDir;
            name = radom5() + name;
            File file = new File(path, name);
            if(!file.getParentFile().exists()){
                log.info("-------------"+file.getParent());
                if(!file.getParentFile().mkdirs()) {
                    throw new NullPointerException("无法创建文件夹");
                }
            }
            try {
                multipartFile.transferTo(new File(path + File.separator + name));
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                throw new NullPointerException("无法创建文件");
            }
            newsBean.setPictureaddress(path + File.separator + name);
            Timestamp timestamp = new Timestamp(date.getTime());
            newsBean.setTime(timestamp);
        }


         newsMapper.insert(newsBean);
        ModelAndView mv = new ModelAndView("/admin/news/news_list.jsp");
        return mv;
        //return newsMapper.insert(newsBean);
    }



//
//    /**
//     * 获取所有的新闻，通过泛型的mapper获取
//     * @return pageinfo
//     *
//     */
//    public PageInfo<NewsBean> queryAllNews(){
//
//        PageHelper.startPage(3,20);
//        List<NewsBean> list = mapper.selectAll();
//        return new PageInfo(list);
//    }

    private String radom5(){
        long rand = Math.round(Math.random()*9999 + 10000);
        return rand+"";
    }
}
