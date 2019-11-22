package com.ssafy.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

@Configuration
@ComponentScan("com.ssafy.model")
public class ApplicationConfig {


	@Bean
	public SqlSessionFactoryBean aqlSessionFactoryBean(DataSource ds) {
		SqlSessionFactoryBean ssfb = new SqlSessionFactoryBean();
		ssfb.setDataSource(ds);
		String configLoc = "classpath:spring/SqlMapConfig.xml";
		ssfb.setConfigLocation(new PathMatchingResourcePatternResolver().getResource(configLoc));
		return ssfb;
	}


	@Bean
	public SqlSession sqlSession(SqlSessionFactoryBean fac) throws Exception {
		return new SqlSessionTemplate(fac.getObject());
	}

	@Bean
	public PlatformTransactionManager platformTransactionManager(DataSource ds) {
		return new DataSourceTransactionManager(ds);
	}
}
