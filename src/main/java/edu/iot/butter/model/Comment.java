package edu.iot.butter.model;

import java.util.Date;

import lombok.Data;

@Data
public class Comment {
   private int commentId;
   private String content;
   private String writer;
   private Date regDate;
   private String fileName;
   private int commentRef;
   private int commentLevel;
   private int boardId;
}