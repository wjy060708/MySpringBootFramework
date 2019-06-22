package com.jiangxinsoft.scorpio;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * 该注解指定项目为springboot，由此类当作程序入口 自动装配 web 依赖的环境
 * @author strawman
 */
@SpringBootApplication
public class BugRoot {

	public static void main(String[] args) {
		SpringApplication.run(BugRoot.class, args);
	}
}

/* 打包不是使用下面代码 */
/*
@EnableScheduling
@EnableCaching
@SpringBootApplication
public class BugRoot extends SpringBootServletInitializer {

	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(BugRoot.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(BugRoot.class, args);
	}
}
*/
