package com.spring.client.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.client.board.vo.BoardVO;

@Mapper
public interface BoardDAO {
	public List<BoardVO> boardList(BoardVO vo);
	public int boardListCnt(BoardVO vo);
	public int boardInsert(BoardVO vo);
	public BoardVO boardDetail(BoardVO vo);
	public void readCntUpdate(BoardVO vo);
	public void boardDelete(BoardVO vo);
	public int passwdChk(BoardVO vo);
	public void boardUpdate(BoardVO vo);
}
