package com.spring.client.main.controller;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.spring.client.main.vo.MovieVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class ControlTest {

	@Autowired
	private RestTemplate restTemplate;
	
	private final String BASE_URL = "https://api.themoviedb.org/3/movie/now_playing?api_key=2f086445ca13875b5bf9a9f2fb2bfa36&language=ko&page=1";
	
	@Test
	public void getMovieDataTest() {
		ResponseEntity<List<MovieVO>> responseEntity = restTemplate.exchange(BASE_URL, HttpMethod.GET, null, new ParameterizedTypeReference<List<MovieVO>>() {});
		log.info(""+responseEntity);
//		List<MovieVO> movies = responseEntity.getBody();
//		model.addAttribute("movies", movies);
		
	}
}
