package edu.iot.butter.model;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Board {
	private int boardId;
	private String title;
	private String writer;
	private String password;
	private String content;
	private int readCnt;
	private List<Attachment> attachments;	//첨부파일 목록
	private Date regDate;
	private Date updateDate;
}
