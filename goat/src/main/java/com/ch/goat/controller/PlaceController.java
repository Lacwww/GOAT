package com.ch.goat.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ch.goat.service.PlaceService;

@Controller
public class PlaceController {
	@Autowired
	private PlaceService ps;
	@RequestMapping("placeAPI.do")
	public String placeAPI(Model model) {
		
		String key ="vjdbjvpd3scuwrna";
		String result = "";
		int pageNum = 1;
		
		try {
			URL url = new URL("http://api.visitjeju.net/vsjApi/contents/searchList?apiKey="+key+"&locale=kr&page="+pageNum);
			
			BufferedReader bf;
			
			bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));
			
			result = bf.readLine();
			
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
			JSONArray items = (JSONArray)jsonObject.get("items");
			
			JSONObject itemsNum = (JSONObject)items.get(0);
			
			JSONObject contentscd = (JSONObject)itemsNum.get("contentscd");
			JSONObject repPhoto = (JSONObject)itemsNum.get("repPhoto");
			JSONObject photoid = (JSONObject)repPhoto.get("photoid");
			
			String title = (String)itemsNum.get("title");
			System.out.println("장소 이름 : " + title);

			String cate = (String)contentscd.get("label");
			System.out.println("분류 : " + cate);
			
			String address = (String)itemsNum.get("address");
			System.out.println("지번 주소 : " + address);

			String roadaddress = (String)itemsNum.get("roadaddress");
			System.out.println("도로명 주소 : " + roadaddress);

			String filename = (String)photoid.get("imgpath");
			System.out.println("파일 이름 : " + filename);
			
			String latitude = String.valueOf(itemsNum.get("latitude"));
			System.out.println("위도 : " + latitude);

			String longitude = String.valueOf(itemsNum.get("longitude"));
			System.out.println("경도 : " + longitude);
			
			String introduction = (String)itemsNum.get("introduction");
			System.out.println("설명 : " + introduction);
			
		}catch (Exception e) {
			e.getMessage();
		}
		
		int CurNum = ps.getPlaceNum();
		
		model.addAttribute("CurNum", CurNum);
		return "place/placeAPI";
	}
}
