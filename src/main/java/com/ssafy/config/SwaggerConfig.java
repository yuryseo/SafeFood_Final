package com.ssafy.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2 // 스웨거 설정
public class SwaggerConfig {
	@Bean
	public Docket api() {
		return new Docket(DocumentationType.SWAGGER_2)
				.groupName("SafeFood") // 서비스할 프로젝트 이름이나 도메인 이름 설정
				.apiInfo(info()) // 스웨거에 표시할 정보
				.select()
				.apis(RequestHandlerSelectors.basePackage("com.ssafy.controller")) // rest 서비스할 controller 패키지 지정
				.paths(PathSelectors.ant("/qna/**")) // PathSelectors.any : 어떤 path든 swagger로,  PathSelectors.ant : 지정한 형식의 path만 swagger로
				.build();
	}

	private ApiInfo info() {
		return new ApiInfoBuilder()
				.title("SAFEFOOD Management API")
				.description("SAFE FOOD 모델 관리를 위한 <b>CRUD</b>")
				.license("SSAFY License")
				.version("2.0")
				.build();
	}
}
