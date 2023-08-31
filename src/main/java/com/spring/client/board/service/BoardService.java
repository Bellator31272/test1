package com.spring.client.board.service;

import java.util.List;

import com.spring.client.board.vo.BoardVO;

public interface BoardService {

	public List<BoardVO> boardList(BoardVO vo);
	public int boardlistCnt(BoardVO vo);
	public int boardInsert(BoardVO vo);
	public BoardVO boardDetail(BoardVO vo);
	public void readCntUpdate(BoardVO vo);
	public void boardDelete(BoardVO vo);
	public int passwdChk(BoardVO vo);
	public void boardUpdate(BoardVO vo);
}
