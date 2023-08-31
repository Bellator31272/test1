package com.spring.client.board.dao;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.spring.client.board.vo.BoardVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class BoardTests {
	
	@Setter(onMethod_ = @Autowired)
	public BoardDAO boardDAO;
	
//	@Test
//	public void testBoardList() {
//		List<BoardVO> list = boardDAO.boardList();
//		log.info("BoardListTest() 테스트메서드 실행");
//		for(BoardVO vo : list) {
//			log.info(vo.toString());
//		}
//	}
//	
//	@Test
//	public void testBoardInsert() {
//		log.info("BoardListTest() 테스트메서드 실행");
//		BoardVO vo = new BoardVO();
//		vo.setB_name("test Name");
//		vo.setB_pwd("1234");
//		vo.setB_title("test title");
//		vo.setB_content("test content");
//		int cnt = boardDAO.boardInsert(vo);
//		log.info("입력 :", cnt);
//	}
	
//	@Test
//	public void chkTest() {
//		BoardVO vo = new BoardVO();
//		vo.setB_num(5);
//		vo.setB_pwd("1234");
//		int cnt = boardDAO.passwdChk(vo);
//		log.info(""+cnt);
//	}
	
	@Test
	public void boardList() {
		BoardVO vo = new BoardVO();
		vo.setPageNum(1);
		vo.setAmount(10);
		vo.setSearch("b_title");
		vo.setKeyword("12");
		
		List<BoardVO> list = boardDAO.boardList(vo);
		for(BoardVO bvo : list) {
			log.info(bvo.toString());
		}
		log.info("총 레코드 수 : " + boardDAO.boardListCnt(vo));
	}
	
	
	
}
