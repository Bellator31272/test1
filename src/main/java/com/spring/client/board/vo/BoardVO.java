package com.spring.client.board.vo;

import org.springframework.web.multipart.MultipartFile;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class BoardVO extends CommonVO {
	private int b_num = 0;
	private String b_name = "";
	private String b_title = "";
	private String b_content = "";
	private String b_date;
	private String b_pwd = "";
	private int readcnt = 0;	// 글 조회수
	private int r_cnt = 0;		// 댓글카운트
	
	private MultipartFile file;	//파일 업로드를 위한 필드
	private String b_file = "";	// 실제 서버에 저장할 파일명
}
