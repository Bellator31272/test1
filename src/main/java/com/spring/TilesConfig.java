package com.spring;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.UrlBasedViewResolver;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Configuration
public class TilesConfig {
	
	@Bean
	UrlBasedViewResolver viewResolver() {
		UrlBasedViewResolver tilesViewResolver = new UrlBasedViewResolver();
		tilesViewResolver.setViewClass(TilesView.class);
		tilesViewResolver.setOrder(0);
		return tilesViewResolver; 
	}
	
	@Bean
	TilesConfigurer titlesConfigurer() {
		final TilesConfigurer configurer = new TilesConfigurer();
		
		configurer.setDefinitions( new String[] { "/WEB-INF/tiles/client/client-setting.xml" } );
		configurer.setCheckRefresh(true);
		
		return configurer;
	}

}
