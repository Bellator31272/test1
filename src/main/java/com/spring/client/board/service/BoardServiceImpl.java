package com.spring.client.board.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.client.board.dao.BoardDAO;
import com.spring.client.board.vo.BoardVO;
import com.spring.client.reply.dao.ReplyDAO;
import com.spring.common.file.FileUploadUtil;

import io.netty.handler.codec.http.multipart.FileUpload;
import lombok.Setter;

@Service
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	public BoardDAO boardDAO;
	
	@Setter(onMethod_ = @Autowired)
	public ReplyDAO replyDAO;
	
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
	public int boardInsert(BoardVO vo) throws Exception {
		 if(vo.getFile().getSize() >0) {
			 String fileName = FileUploadUtil.fileUpload(vo.getFile(), "board");
			 vo.setB_file(fileName);
		 }
		 
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
	public void readCntUpdate(BoardVO vo){
		boardDAO.readCntUpdate(vo);
	}

	@Override
	public void boardDelete(BoardVO vo) throws Exception {
		if(!vo.getB_file().isEmpty() ) {
			FileUploadUtil.fileDelete(vo.getB_file());
		}
		boardDAO.boardDelete(vo);
	}

	@Override
	public int passwdChk(BoardVO vo) {
		int result = boardDAO.passwdChk(vo);
		return result;
	}

	@Override
	public void boardUpdate(BoardVO vo) throws Exception {
		if(!vo.getFile().isEmpty() ) {		// 새롭게 업로드할 파일이 존재하면
			if(!vo.getB_file().isEmpty()) {	//기존파일이 존재하면
				FileUploadUtil.fileDelete(vo.getB_file());
			 }
			String fileName = FileUploadUtil.fileUpload(vo.getFile(), "board");
			vo.setB_file(fileName);
		}
		boardDAO.boardUpdate(vo);
	}

	@Override
	public int replyCnt(int b_num) {
		int result = replyDAO.replyCnt(b_num);
		return result;
	}

}