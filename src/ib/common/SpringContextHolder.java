package ib.common;

import javax.servlet.ServletContext;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.web.context.WebApplicationContext;

/**
 * 以静态变量保存Spring ApplicationContext, 可在任何代码任何地方任何时�?中取出ApplicaitonContext
 */
public class SpringContextHolder implements ApplicationContextAware {

private static ApplicationContext applicationContext;
	

	public static Object getBean(String name){
		return applicationContext.getBean(name);
	}
	
	public static Object getBean(Class clzz){
		return getBean(clzz.getName());
	}
	
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringContextHolder.applicationContext = applicationContext;

	}
	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}
	public static ServletContext getServletContext(){
		if(applicationContext instanceof WebApplicationContext){
			return ((WebApplicationContext)applicationContext).getServletContext();
		}
		return null;
	}
	

	//加Bean工厂后置处理�?只是为了适应spring的IOC加载顺序,使这个类在启动时第一个被实例化并被加�?
	public void postProcessBeanFactory(	ConfigurableListableBeanFactory beanFactory) throws BeansException {
		
	}
}
