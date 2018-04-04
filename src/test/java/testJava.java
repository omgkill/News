

import static org.junit.Assert.assertEquals;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.springframework.core.env.SystemEnvironmentPropertySource;

public class testJava {

	@Test
	public void test() {
		String str = "  dd  ff  ss ff eee  ";
		String strTrim = str.trim();
		System.out.println(str);
		System.out.println(strTrim);
	
		assertEquals("ddffssffeee", strTrim);
	}
	
	@Test
	public void testListToArray(){
		
		List<String> list = new ArrayList<String>();
		
		list.add("ddd");
		list.add("ddd1111");
		list.add(null);
		
		String[] strArray =new String[2];
		strArray[0]= "dddd";
		list.toArray(strArray);
		
		System.out.println(strArray.length);
		
		for(String str: strArray){
			if(null == str){
				System.out.println("33333333");
			}else {
				System.out.println(str);
			}
		}
		//System.out.println(strArray.);
		
		
	}
	
	@Test
	public void testSubStr(){
		String str = "qwertyuiop/";
		int a = str.indexOf("/");
		System.out.println("a:"+a+"----"+"size"+str.length());
	}

}
