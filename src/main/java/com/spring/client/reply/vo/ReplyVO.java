package com.spring.client.reply.vo;

import com.spring.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ReplyVO extends CommonVO{
	private int r_num = 0;
	private int b_num = 0;
	private String r_name = "";
	private String r_content = "";
	private String r_date = "";
	private String r_pwd = "";
}
