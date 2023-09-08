package com.spring.client.reply.controller;

import java.util.List;
import org.springframework.http.MediaType;
import org.apache.ibatis.annotations.Delete;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.client.reply.service.ReplyService;
import com.spring.client.reply.vo.ReplyVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/replies/*")
@Slf4j
public class ReplyController {
	
	@Setter(onMethod_ = @Autowired)
	public ReplyService replyService;
	
	/***************************************************************************************
	 * 댓글 글목록 구현하기
	 * @return List<ReplyVO>
	 * 참고 : @PathVariable는 URI의 경로에서 원하는 데이터를 추출하는 용도의 어노테이션.
	 * 응답 문서 타입을 xml이나 json으로 반환할 때는 produces 속성을 사용한다.
	 * produces = { MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_VALUE }
	 * 현재 요청 URL : http://localhost:8080/replies/all/게시판글번호(b_num)
	 * 예전 요청 URL : http://localhost:8080/replies/replyList?b_num=게시판글번호
	 * ResponseEntity는 개발자가 직접 결과 데이터와 HTTP 상태 코드(200, 404, 500..)를 직접 제어할 수 있는 클래스.
	 **************************************************************************************
	
	@GetMapping(value="/all/{b_num}", produces=MediaType.APPLICATION_JSON_VALUE )
	public ResponseEntity<List<ReplyVO>> replyList(@PathVariable("b_num") Integer b_num) {
		log.info("댓글 리스트 불러오기");
		
		ResponseEntity<List<ReplyVO>> entity = null;
		entity = new ResponseEntity<>(replyService.replyList(b_num), HttpStatus.OK); 
		return entity;
	}*/
	
	
	@GetMapping(value="/all/{b_num}", produces=MediaType.APPLICATION_JSON_VALUE)
	public List<ReplyVO> replyList(@PathVariable("b_num") Integer b_num, ReplyVO rvo) {
		log.info("댓글 리스트 불러오기");
		
		List<ReplyVO> entity = null;
		rvo.setB_num(b_num);
		entity = replyService.replyList(rvo);
		return entity;
	}
	
	/**************************************************************
	 * 댓글 글쓰기 구현하기
	 * @return String
	 * 참고 : @RequestBody: JSON 데이터를 원하는 타입으로 바인딩 처리한다.{name:value} 
	 * 		consumes 속성을 이용하면 사용자가 Request Body에 담는 타입을 제한할 수 있으며 
	 * 
	 * 		produces 속성을 추가하고 dataType을 지정하면 해당 데이터타입으로만 
	 * 		사용자에게 응답하겠다는 의미로 해석하면 된다.
	 * 현재 요청 URL : http://localhost:8080/replies/replyInsert
	 **************************************************************/
	@PostMapping(value="/replyInsert", consumes = "application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyInsert(@RequestBody ReplyVO rvo) {
		log.info("댓글입력 호출");
//		log.info("ReplyVO : " + rvo);
		int result = replyService.replyInsert(rvo);
		return (result==1) ? "SUCCESS":"FAILURE";
	}
	/***************************************************************
	 * 댓글 수정 구현
	 * @return
	 * 참고 : REST 방식에서 UPDATE 작업은 PUT, PATCH방식을 이용해서 처리.
	 * 		전체 데이터를 수정하는 경우 PUT 사용,
	 * 		일부 데이터를 수정하는 경우 PATCH 사용.
	 * 현재 요청 URL : http://locahost:9090/replies/댓글번호
	 ***************************************************************/
	@PutMapping(value="/{r_num}", consumes = "application/json", produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyUpdate(@RequestBody ReplyVO rvo, @PathVariable("r_num") int r_num) {
		rvo.setR_num(r_num);
		int result = replyService.replyUpdate(rvo);
		return (result==1) ? "SUCCESS":"FAILURE";
	}
	/***************************************************************
	 * 댓글 tkrwp 구현
	 * @return
	 * 참고 : REST 방식에서 삭제 작업은 DELETE 방식을 이용해서 처리.
	 * 현재 요청 URL : http://locahost:9090/replies/댓글번호
	 ***************************************************************/
	@DeleteMapping(value="/{r_num}", produces=MediaType.TEXT_PLAIN_VALUE)
	public String replyDelete(@PathVariable("r_num") int r_num) {
		log.info("r_num : " + r_num);
		int result = replyService.replyDelete(r_num);
		return (result==1) ? "SUCCESS":"FAILURE";
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
