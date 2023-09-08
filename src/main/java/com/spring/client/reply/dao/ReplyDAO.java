package com.spring.client.reply.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.spring.client.reply.vo.ReplyVO;

@Mapper
public interface ReplyDAO {
	public List<ReplyVO> replyList(ReplyVO rvo);
	public int replyInsert(ReplyVO rvo);
//	public int pwdConfirm(ReplyVO rvo);
	public int replyUpdate(ReplyVO rvo);
	public int replyDelete(int r_num);			//댓글 기준 각 삭제
	public int replyChoiceDelete(int b_num);	//게시글 기준 댓글 삭제 관리자용
	public int replyCnt(int b_num);

}
