package com.springbook.ioc.injection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CollectionBeanClient {

	public static void main(String[] args) {
//		// TODO Auto-generated method stub
//		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
//		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
//		List<String> addressList = bean.getAddressList();
//		for(String address : addressList) {
//			System.out.println(address.toString());
//		}

//		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
//		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
//		Set<String> addressList =  bean.getAddressList();
//		for(String address : addressList) {
//			System.out.println(address.toString());
//		}

//		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
//		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
//		Map<String,String> addressList =  bean.getAddressList();
//		Set<String> keySet = addressList.keySet();
////		Iterator<String> keyIterater = keySet.iterator();
////		while(keyIterater.hasNext()) {
////			String key = keyIterater.next();
////			String value = addressList.get(key);
////			System.out.println(key + " : " + value);
////			}
////		}
//		for(String key : addressList.keySet()) {
//			System.out.println(String.format("키 :%s, 값 : %s" , key, addressList.get(key)));
//			}
		AbstractApplicationContext factory = new GenericXmlApplicationContext("applicationContext.xml");
		CollectionBean bean = (CollectionBean)factory.getBean("collectionBean");
		Properties addressList =  bean.getAddressList();	
		for(String key : addressList.stringPropertyNames()) {
			System.out.println(String.format("키 :%s, 값 : %s" , key, addressList.get(key)));
			}
	}
}
