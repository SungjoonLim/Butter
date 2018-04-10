package edu.iot.butter.model;

import java.util.Date;

import lombok.Data;

@Data
public class Image {
	private int	imageId;	
	private String 	title;
	private String 	description;
	private String 	fileName; //원본
	private String	newName; //서버에서의 이름
	private String 	thumbName; //섬네일 이름
	private long 	fileSize;
	private String	mimeType;
	private Date	regDate;	
	
}
