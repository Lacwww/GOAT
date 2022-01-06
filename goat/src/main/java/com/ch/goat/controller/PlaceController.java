package com.ch.goat.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.goat.model.Area;
import com.ch.goat.model.Bookmark;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.PlaceReview;
import com.ch.goat.service.MemberService;
import com.ch.goat.service.PlaceService;
import com.ch.goat.service.ScheduleService;

@Controller
public class PlaceController {
	@Autowired
	private PlaceService ps;
	@Autowired
	private ScheduleService ss;
	@Autowired
	private MemberService ms;
	
	
	
	@RequestMapping("place/insertPlace")
	public String insertPlace() {
		
		return "place/insertPlace";
	}
	
	@RequestMapping("place/placeAreaModal")
	public String placeAreaModal(String place_area, Model model) {
		List<Place> areaDetailList = ps.areaDetailList(place_area);
		
		model.addAttribute("place_area", place_area);
		model.addAttribute("areaDetailList", areaDetailList);
		return "place/placeAreaModal";
	}
	
	@RequestMapping("place/updatePrev")
	public String updatePrev(PlaceReview prev) {		
		ps.updatePrev(prev);
		return "redirect:/place/prevList.do?place_num="+prev.getPlace_num();
	}
	
	@RequestMapping("place/deletePrev")
	public String deletePrev(PlaceReview prev) {
		ps.deletePrev(prev);	
		return "redirect:/place/prevList.do?place_num="+prev.getPlace_num();
	}
	
	@RequestMapping("place/insertPrev")
	public String insertPrev(PlaceReview prev, HttpSession session) {
		String id = (String) session.getAttribute("id");
		Member member = ms.select(id);
		prev.setM_num(member.getM_num());
		ps.insertPrev(prev);
		return "redirect:/place/prevList.do?place_num="+prev.getPlace_num();
	}
	
	@RequestMapping(value = "place/bookMark", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String bookMark(String place_num, HttpSession session) {
		
		String id = (String) session.getAttribute("id");
		int num = Integer.parseInt(place_num);
		String bookMarkImgSrc = "";
		
		Bookmark bookMark = ps.bookMarkChk(id, num);
		
		if(bookMark != null ) { // 마이픽 테이블에 있으면
			ps.deleteBM(id, num); // 마이픽 삭제
			bookMarkImgSrc = "/goat/resources/bookMarkImg/nobookmark.png";
		}else {
			ps.insertBM(id, num);
			bookMarkImgSrc = "/goat/resources/bookMarkImg/bookmark.png";
		}	
		return bookMarkImgSrc;
	}
	
	@RequestMapping("place/prevList")
	public String prevList(String place_num, Model model) {
		int num = Integer.parseInt(place_num);	
		List<PlaceReview> list = ps.prevList(num);
		model.addAttribute("list", list);
		return "place/prevList";
	}
	
	@RequestMapping("place/prevDetailView")
	public String prevDetailView(String place_num,HttpSession session, Model model) {
		int num = Integer.parseInt(place_num);
		Place place = ps.placeModal(num);
		float avgScore = ps.avgScore(num);		
		String id = (String) session.getAttribute("id");
		String bookMarkImgSrc ="";
		
		if(id != null) {
			Bookmark bookMark = ps.bookMarkChk(id, num);
			if(bookMark != null) {
				bookMarkImgSrc = "/goat/resources/bookMarkImg/bookmark.png";
			}else {
				bookMarkImgSrc = "/goat/resources/bookMarkImg/nobookmark.png";
			}
		}else {
			bookMarkImgSrc = "/goat/resources/bookMarkImg/nobookmark.png";
		}

		model.addAttribute("bookMarkImgSrc", bookMarkImgSrc);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("place", place);
		return "place/prevDetailView";
	}
	
	@RequestMapping("place/placeModal")
	public String placeModal(String place_num, Model model) {
		int num = Integer.parseInt(place_num);
		Place place = ps.placeModal(num);
		float avgScore = ps.avgScore(num);
		
		
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("place", place);
		return "place/placeModal";
	}
	
	@RequestMapping("place/placeList")
	public String placeList(Model model) {
		List<Area> list = ss.list();
		model.addAttribute("list",list);
		return "place/placeList";
	}
	@RequestMapping("place/areaPlaceList")
	public String areaPlaceList(Place place, String pageNum, Model model) {
		System.out.println(place.getPlace_areadetail());
		int rowPerPage = 12;
		int pagePerBlock = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ps.getTotal(place);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		List<Place> list = ps.list(place, startRow, endRow);
		int totalPage = (int)(Math.ceil((double)total/rowPerPage));
		int startPage = currentPage - (currentPage - 1) % pagePerBlock;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		
		String place_area = place.getPlace_area();
		
		model.addAttribute("place_area", place_area);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("list", list);
		return "place/areaPlaceList";
	}
	
	
	
	
	
	@RequestMapping("place/insertAPI")
	public String placeAPI() {
		
		String key ="vjdbjvpd3scuwrna";
		String result = "";
		for(int pageNum = 1; pageNum <=12; pageNum++) {
			for(int i = 0; i < 100; i++) {
				try {
					URL url = new URL("http://api.visitjeju.net/vsjApi/contents/searchList?apiKey=" + key
							+ "&locale=kr&page="+pageNum);				
					BufferedReader bf;
					
					bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));					
					result = bf.readLine();
					int CurNum = ps.getPlaceNum();
					Place place = new Place();
					place.setPlace_num(CurNum);
					
					JSONParser jsonParser = new JSONParser();
					JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
					JSONArray items = (JSONArray)jsonObject.get("items");
					
					JSONObject itemsNum = (JSONObject)items.get(i);
					
					JSONObject contentscd = (JSONObject)itemsNum.get("contentscd");
					JSONObject repPhoto = (JSONObject)itemsNum.get("repPhoto");
					JSONObject photoid = (JSONObject)repPhoto.get("photoid");
					
					String title = (String)itemsNum.get("title");
					System.out.println("장소 이름 : " + title);
					place.setPlace_name(title);

					String cate = (String)contentscd.get("label");
					System.out.println("분류 : " + cate);
					place.setPlace_cate(cate);
			
					String address = (String)itemsNum.get("address");
					System.out.println("지번 주소 : " + address);
					place.setPlace_addr(address);

					String roadaddress = (String)itemsNum.get("roadaddress");
					System.out.println("도로명 주소 : " + roadaddress);
					place.setPlace_addrd(roadaddress);

					String filename = (String)photoid.get("imgpath");
					System.out.println("파일 이름 : " + filename);
					place.setPlace_photo(filename);
			
					String latitude = String.valueOf(itemsNum.get("latitude"));
					System.out.println("위도 : " + latitude);
					place.setLat(latitude);

					String longitude = String.valueOf(itemsNum.get("longitude"));
					System.out.println("경도 : " + longitude);
					place.setLng(longitude);
			
					String introduction = (String)itemsNum.get("introduction");
					System.out.println("설명 : " + introduction);
					place.setPlace_content(introduction);
					
					String tag = (String)itemsNum.get("tag");
					System.out.println("태그 : " + tag);
					place.setPlace_tag(tag);
					
					if(roadaddress.indexOf("제주시") >= 0 || address.indexOf("제주시") >= 0) {
						System.out.println("제주시");
						place.setPlace_areadetail("제주시");
					}else if(roadaddress.indexOf("서귀포시") >= 0 || address.indexOf("서귀포시") >= 0) {
						System.out.println("서귀포시");
						place.setPlace_areadetail("서귀포시");
					}else {
						System.out.println("정보없음");
						place.setPlace_areadetail("정보없음");
					}
					
					ps.insertAPI(place);

				}catch (Exception e) {
					e.getMessage();
				}
			}
		}
		System.out.println("=================");
		System.out.println("완료");
		System.out.println("=================");
		
		return "place/insertAPI";
	}
}
