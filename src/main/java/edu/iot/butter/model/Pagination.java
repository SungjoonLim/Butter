package edu.iot.butter.model;

import lombok.Data;

@Data
public class Pagination {
//	public static final int PER_PAGE = 10; 		//1페이지다 데이터 건수
//	public static final int PER_BLOCK = 10;		//1블록당 페이지 수
	public final int PER_PAGE; 		//1페이지다 데이터 건수
	public final int PER_BLOCK;		//1블록당 페이지 수
	
	// ======== 외부에서 선언됨 ==============================
	private int totalCount;			// 전체 데이터 건 수
	private int page;				// 현재 페이지
	// =================================================
	private int start;				// 현재 페이지 시작 번호
	private int end;				// 현재 페이지 끝 번호
	
	private int totalPage;			// 전체 페이지 수
	private int startPage;			// 현재 페이지 블럭에서 시작 페이지 번호
	private int endPage;			// 현재 페이지 블럭에서 마지막 페이지 번호
	
	private int currentBlock;		// 현재 페이지 블록
	private int totalBlock;			// 전체 페이지 블록 수
	private int prevBlockPage;		// 이전 페이지 블록 시작 페이지
	private int nextBlockPage;		// 다음 페이지 블록 시작 페이지
	
	public Pagination(int currentPage, int totalCount) {
		this(currentPage,totalCount,10,10);
	}
	
	public Pagination(int currentPage, int totalCount, int perPage) {
		this(currentPage,totalCount,perPage,10);
	}
	
	public Pagination(int currentPage, int totalCount,
			int perPage, int perBlock) {
		PER_PAGE=perPage;
		PER_BLOCK=perBlock;
		
		page = currentPage;
		this.totalCount = totalCount;
		
		start = (page-1)*PER_PAGE+1;
		end = start+PER_PAGE-1;
		totalPage = (int)Math.ceil((float)totalCount/PER_PAGE);
		
		currentBlock=(int)Math.ceil((float)currentPage/PER_BLOCK);
		totalBlock=(int)Math.ceil((float)totalPage/PER_BLOCK);
		
		startPage = (currentBlock-1)*PER_BLOCK+1;
		endPage = startPage +PER_BLOCK-1;
		
		if(endPage > totalPage) endPage=totalPage;
		
		prevBlockPage=page-PER_BLOCK;
		nextBlockPage=page+PER_BLOCK;
		
//		prevBlockPage=startPage+1;
//		nextBlockPage=startPage+1;
	}
}
