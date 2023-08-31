package com.spring.client.main.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.client.main.vo.MovieVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class MovieServiceTest {
	
	@Autowired
	private RestTemplate restTemplate;

	@Test
	public void searchPlayingMovie() {
		String url = "https://api.themoviedb.org/3/search/movie?api_key=2f086445ca13875b5bf9a9f2fb2bfa36&language=ko-KO&include_adult=true&primary_release_year=2023&region=kr&query=바비";
		ResponseEntity<String> response = restTemplate.getForEntity(url, String.class);
		String responseBody = response.getBody();
		
		List<MovieVO> data = new ArrayList<>();
		ObjectMapper objectMapper = new ObjectMapper();
		try {
			JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode results = rootNode.path("results");

            for (JsonNode node : results) {
            	MovieVO movieVO = new MovieVO();
                
            	String title = node.path("title").asText();
                String overview = node.path("overview").asText();
                if(overview=="") {
                	overview = "준비중 입니다.";
                }
                String releaseDate = node.path("release_date").asText();
                String posterPath = node.path("poster_path").asText();
                String id = node.path("id").asText();

                movieVO.setTitle(title);
                movieVO.setOverview(overview);
                movieVO.setRelease_date(releaseDate);
                movieVO.setPoster_path(posterPath);
                movieVO.setId(id);
                
                data.add(movieVO);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
		log.info("테스트 : " + data);
	}
}
