package com.ch.goat.service;

import lombok.Data;

@Data
public class PageBean {
	private int currentPage;
	private int rowPerPage;
	private int total;
	private int totalPage;
	private int pagePerBlock = 10;
	private int startPage;
	private int endPage;
	
	public PageBean(int currentPage, int rowPerPage, int total) {
		this.currentPage = currentPage;
		this.rowPerPage = rowPerPage;
		this.total = total;
		//                457/10 => 45인데 (double)457/10 => 45.7 이거를 ceil하면 46.0
		totalPage = (int)(Math.ceil((double)total/rowPerPage));
		//          현재페이지가 15이면       15 - 1 => 14인데   %10 => 4
		//          그래서 15에서 4를 빼면 이 페이지는 11부터
		startPage = currentPage - (currentPage - 1) % pagePerBlock;
		//            11    +    10      - 1  => 20이 마지막
		endPage = startPage + pagePerBlock - 1;
		//   460      457   endPage가 totalPage보다 클수 없으므로 457로 변경됨
		if(endPage > totalPage) endPage = totalPage;
	}
}