package com.ch.goat.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.model.Place;
import com.ch.goat.service.PlaceService;

@Controller
public class PlaceController {
	@Autowired
	private PlaceService ps;
	
	@RequestMapping("place/placeList")
	public String placeList() {
		
		return "place/placeList";
	}
	@RequestMapping("place/areaPlaceList")
	public String areaPlaceList(Place place, String pageNum, Model model) {
		int rowPerPage = 10;
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
					URL url = new URL("http://api.visitjeju.net/vsjApi/contents/searchList?apiKey="+key+"&locale=kr&page="+pageNum);				
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
