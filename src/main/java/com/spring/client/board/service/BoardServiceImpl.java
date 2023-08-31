package com.spring.client.board.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;

import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	public BoardDAO boardDAO;
	
	@Override
	public List<BoardVO> boardList(BoardVO vo) {
		List<BoardVO> list = boardDAO.boardList(vo);
		return list;
	}
	
	@Override
	public int boardlistCnt(BoardVO vo) {
		return boardDAO.boardListCnt(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		 int result = boardDAO.boardInsert(vo);
		 return result;
	}

	@Override
	public BoardVO boardDetail(BoardVO vo) {
		BoardVO detail = boardDAO.boardDetail(vo);
		
		if(detail!=null) {
			detail.setB_content(detail.getB_content().toString().replaceAll("\n", "<br />"));
		}
		return detail;
	}

	@Override
	public void readCntUpdate(BoardVO vo) {
		boardDAO.readCntUpdate(vo);
	}

	@Override
	public void boardDelete(BoardVO vo) {
		boardDAO.boardDelete(vo);
	}

	@Override
	public int passwdChk(BoardVO vo) {
		int result = boardDAO.passwdChk(vo);
		return result;
	}

	@Override
	public void boardUpdate(BoardVO vo) {
		boardDAO.boardUpdate(vo);
	}

	


}
