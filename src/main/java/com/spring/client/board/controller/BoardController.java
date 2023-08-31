package com.spring.client.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.client.board.service.BoardService;
import com.spring.client.board.vo.BoardVO;
import com.spring.common.vo.PageDTO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/board/*")
@Slf4j
public class BoardController {
	
	@Setter(onMethod_ = @Autowired)
	public BoardService boardService;
	
//	@GetMapping("/boardList")
//	public String boardList(@ModelAttribute BoardVO vo, Model model) {
//		log.info("boardList 메서드 호출");
//		
//		List<BoardVO> boardList = boardService.boardList(vo);
//		model.addAttribute("boardList", boardList);
//		
//		return "client/board/boardList";
//	}
	
	/* 페이징 처리 목록 조회 */
	@GetMapping("/boardList")
	public String boardList(@ModelAttribute BoardVO vo, Model model) {
		log.info("boardList 메서드 호출");
		
		List<BoardVO> boardList = boardService.boardList(vo);
		model.addAttribute("boardList", boardList);
		
		//전체 레코드 수 반환
		int total = boardService.boardlistCnt(vo);
		// 페이징 처리
		model.addAttribute("pageMaker", new PageDTO(vo, total));
		
		return "client/board/boardList";
	}
	
	@GetMapping("/writeForm")
	public String writeForm() {
		log.info("writeForm 메서드 호출");
		return "client/board/writeForm";
	}
	
	@PostMapping("/boardInsert")
	public String boardInsert(BoardVO vo, Model model) throws Exception {
		log.info("boardInsert 메서드 호출");
		
		String url="";
		int result = boardService.boardInsert(vo);
		
		if(result == 1) {
			url="/board/boardList";
		} else {
			url="/board/writeForm";
		}
		
		return "redirect:"+url;
	}
	
	@PostMapping("/boardDetail")
	public String boardDetail(BoardVO vo, Model model) {
		log.info("boardDetail 메서드 호출");
		boardService.readCntUpdate(vo);
		
		BoardVO detail = boardService.boardDetail(vo);
		model.addAttribute("detail", detail);
		
		return "client/board/boardDetail";
	}
	
	@PostMapping("/pwdConfirm")
	@ResponseBody
	public int pwdConfirm(BoardVO vo) {
		int chk = boardService.passwdChk(vo);
//		String msg = "";
//		if(chk == 1) { msg="비밀번호 일치"; }
//		else { msg="비밀번호 불일치"; }
		return chk;
	}
	
	@GetMapping("/boardDelete")
	public String boardDelete(BoardVO vo) {
		boardService.boardDelete(vo);
		return "redirect:/board/boardList";
	}
	
	@PostMapping("/updateForm")
	public String updateForm(BoardVO vo, Model model) {
		BoardVO detail = boardService.boardDetail(vo);
		detail.setB_content(detail.getB_content().toString().replaceAll("<br />", "\n"));
		model.addAttribute("detail", detail);
		
		return "client/board/updateForm";
	}
	
	@PostMapping("/boardUpdate")
	public String boardUpdate(BoardVO vo, Model model) {
		boardService.boardUpdate(vo);
		BoardVO detail = boardService.boardDetail(vo);
		model.addAttribute("detail", detail);

//		return "redirect:/board/boardDetail?b_num="+vo.getB_num();
		return "client/board/boardDetail";
	}
	
	
}
