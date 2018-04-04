import com.jing.experiment.news.bean.NewsBean;
import com.jing.experiment.news.bean.PageInfo;
import com.jing.experiment.news.controller.NewsController;
import com.jing.experiment.news.mapper.NewsMapper;
import net.sf.json.JSONArray;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.sql.Timestamp;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:config/spring-mvc.xml","classpath*:config/spring-common.xml"})
public class TestMyBatis {
	private static Logger log = Logger.getLogger(TestMyBatis.class);

//	@Autowired
//	private Action action;
//	@Test
//	public void test1() {
//	   action. aa();
//	}
	@Resource
	private NewsMapper newsMapper;
	@Autowired
	private NewsController newsController;
	
	@Test
	public void testqueryNewsByCondition(){
		NewsBean newsBean = new NewsBean();
		newsBean.setCategoryid(5);
		PageInfo<NewsBean> list = newsController.queryNewsByCondition(newsBean);
	//	List<NewsBean> list = newsMapper.selectAll();
		//System.out.println(JSONObject.fromObject(list).toString());
		//List<NewsBean> list = newsMapper.queryNewsByCondition(new NewsBean());
		JSONArray jsonObject = JSONArray.fromObject(list);
		System.out.println(jsonObject.toString());
	}
	
//	@Test
//	public void testaddNews(){
//		NewsBean newsBean = new NewsBean();
//		newsBean.setCategoryid(1);
//		newsBean.setAuthorname("test");
//		newsBean.setTitle("test");
//		newsBean.setContent("test");
//		Timestamp time = new Timestamp(System.currentTimeMillis());
//		newsBean.setTime(time);
//		
//		int i = newsController.addNews(newsBean);
//		log.info("<<<<<<<<<<<<<<<<"+i);
//	}
	
	@Test
	public void testqueryNewsTitleByCategoryId(){
//		List<NewsBean> list = newsMapper.queryNewsTitleByCategoryId("5");
//		System.out.println(list.toString());
		NewsBean newsBean = new NewsBean();
		newsBean.setCategoryid(3);
		newsBean.setAuthorname("test");
		newsBean.setTitle("test");
		newsBean.setContent("test");
		
		String tsStr = "2011-05-09 11:49:45";  
	    Timestamp ts = Timestamp.valueOf(tsStr);  // 2011-05-09 11:49:45.0  
	  //  System.out.println(ts);  
		newsBean.setTime(ts);
//		long test= newsBean.hashCode();
//		System.out.println(test);
		//insertSelective插入数据，使用不为null的属性作为字段使用
	//	newsMapper.insertSelective(newsBean);
	}
	
//	@Test
//	public void testqueryNewsById(){
//
//		newsController.queryNewsById("14");
//	}
	
	@Test
	public void testEquals(){
		NewsBean bean = new NewsBean();
		bean.setTitle("22222222");
		NewsBean beans = new NewsBean();
		beans.setContent("22222222");
		if(bean == beans){
			System.out.println("测试成功");
		}
		if(bean.equals(beans)){
			System.out.println("测试成功22222222");
		}
		System.out.println("bean"+bean.hashCode());
		System.out.println("beans"+bean.hashCode());
		
	}
	
	

	@Test
	public void TestStringIsNull(){
		String ad="22";
		String dd=new String("22");
		
		if(dd == ad){
			System.out.println("2222222");
		}else{
			System.out.println("3333333333333");
		}
		
		
	}
	

	@Test
    public void TestqueryAllNews(){

	  //  PageInfo<NewsBean> page  = newsController.queryAllNews();
     //   JSONArray jsonObject = JSONArray.fromObject(page);
     //   System.out.println(jsonObject.toString());

    }
	
}
