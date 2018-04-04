package com.jing.experiment.news.controller;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.jing.experiment.news.bean.NewsBean;
import com.jing.experiment.news.mapper.NewsMapper;
import com.jing.experiment.news.bean.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.common.Mapper;

import javax.annotation.Resource;
import javax.print.Doc;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * @author jings
 * ����ģ��
 */
@RestController
@RequestMapping("/news")
public class NewsController {
    private static final Logger log = LoggerFactory.getLogger(NewsController.class);

    //����ģ��dao
    @Resource
    private NewsMapper newsMapper;


    @Value("${uploadDir:E:/playmyself/News/}")
    private String uploadDir;


    /**
     * @return
     * @Description ������ѯ����
     * @author jingshuai
     * @Date 2017��12��7��
     */
    @RequestMapping(value = "/queryNewsByCondition", method = RequestMethod.GET)
    public PageInfo<NewsBean> queryNewsByCondition(NewsBean newsBean) {

        //mapper.selectByRowBounds(record, rowBounds)
        List<NewsBean> newsList = new ArrayList<>();
        PageHelper.offsetPage(newsBean.getOffset(), newsBean.getPageSize());
        //PageHelper.startPage(newsBean.getOffset(),20);
        //newsList   = newsMapper.queryNewsByCondition(newsBean);
        newsBean.setCategoryid(1);
        newsList = newsMapper.queryNewsByCondition(newsBean);
        // newsMapper.queryNewsByCondition(newsBean);
        log.debug(newsList.toString());
        PageInfo<NewsBean> pageInfo = new PageInfo<NewsBean>(newsList);
        return pageInfo;

    }

    /**
     * @param NewsId
     * @return
     * @Description ����id��ѯ����
     * @author jingshuai
     * @Date 2017��12��7��
     */
//    @ResponseBody
//    @RequestMapping(value = "/queryNewsById", method = RequestMethod.GET)
//    public String queryNewsById(@RequestParam("newsId") String NewsId) {
//        log.info("into queryNewsById method!!!");
////		if(StringUtils.isEmpty(NewsId)){
////			throw new IllegalArgumentException("����ID�ǿյ�");
////		}
//        return newsMapper.queryNewsById(NewsId).toString();
//    }
    public NewsBean updateNewsById() {

        return newsMapper.updateNewsById();
    }

    /**
     * @param newsBean
     * @Description �������
     * @author jingshuai
     * @Date 2017��12��7��
     * @retur
     */
    @RequestMapping("/addNews")
    public String addNews(NewsBean newsBean, @RequestParam("file") MultipartFile multipartFile) {

        if (null == newsBean) {
            System.out.println("----------");
        } else {
            System.out.println(newsBean.getTitle());
        }
        if (multipartFile.getName() == null) {
            System.out.println("33333333333333333333333333333333");
        }

        if (!multipartFile.isEmpty()) {
            String name = multipartFile.getOriginalFilename();
            String path = uploadDir;
            System.out.println("--------" + path);
            File file = new File(path, name);
            if (!file.getParentFile().exists()) {
                file.getParentFile().mkdirs();
            }
            try {
                multipartFile.transferTo(new File(path + File.separator + name));
            } catch (IllegalStateException | IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
        }


        // newsMapper.insert(newsBean);
        return "/admin/news/news_list.jsp";
        //return newsMapper.insert(newsBean);
    }


    /**
     *
     * @param id
     * @return
     */
    /**
     * @param
     * @author jingShuai
     * @Date 2018/3/23 16:04
     * @Description:
     */
    @RequestMapping(value = "/new", method = RequestMethod.DELETE)
    public String delNews(String id) {
        Pattern pattern = Pattern.compile("[0-9]*");

        if (null != id) {
            System.out.println(id);
//		  //ͨ��������ʽ�ж��Ƿ�������
//	         Matcher isNum = pattern.matcher(id);
//	         int idIn = 0;
//			 //Ϊtrue,˵��������
//			 if( isNum.matches() ){
//				 idIn = Integer.parseInt(id);
//				 
//				 mapper.deleteByPrimaryKey(idIn);
//			 } else {
//				 return "id��������";
//			 }
        } else {

            return "idΪ��";
        }
        return "0000";
    }

    /**
     * 获取所有的新闻，通过泛型的mapper获取
     * @return pageinfo
     *
     */
//    public PageInfo<NewsBean> queryAllNews(){
//
//        PageHelper.startPage(3,20);
//        List<NewsBean> list = mapper.selectAll();
//        return new PageInfo(list);
//    }
}
