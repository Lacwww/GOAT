package com.ch.goat.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.ch.goat.model.Member;
import com.ch.goat.model.Trip;
import com.ch.goat.model.TripLike;
import com.ch.goat.service.MemberService;
import com.ch.goat.service.PageBean;
import com.ch.goat.service.TripService;

@Controller
public class TripController {
	@Autowired
	private MemberService ms;
	@Autowired
	private TripService ts;
	
	@RequestMapping("trip/tripList")
	public String noticeList(Trip trip, String pageNum, Model model) {
		int rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ts.getTotal(trip);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		trip.setStartRow(startRow);
		trip.setEndRow(endRow);
		List<Trip> list = ts.list(startRow, endRow);
		
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		String[] title = {"제목","내용","제목+내용"};
		
		model.addAttribute("trip", trip);
		model.addAttribute("title", title);
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		model.addAttribute("pb", pb);
		
		return "trip/tripList";
	}
	
	@RequestMapping(value="trip/imageUpload.do", method = RequestMethod.POST) 
	public void imageUpload(HttpServletRequest request, HttpSession session,
			HttpServletResponse response, MultipartHttpServletRequest multiFile , 
			@RequestParam MultipartFile upload) throws Exception{ 
		// 랜덤 문자 생성 
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null; 
		PrintWriter printWriter = null; 
		
		//인코딩 
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		try{ 
			//파일 이름 가져오기 
			String fileName = upload.getOriginalFilename();
			byte[] bytes = upload.getBytes(); 
			
			//이미지 경로 생성 
			String real = session.getServletContext().getRealPath("/resources/tripPhoto");
			String ckUploadPath = real + "/" + uid + "_" + fileName; 
			File folder = new File(real);
			
			//해당 디렉토리 확인 
			if(!folder.exists()){ 
				try{ folder.mkdirs(); // 폴더 생성 
				}catch(Exception e){ 
					e.getStackTrace(); 
					} 
				}
			
			out = new FileOutputStream(new File(ckUploadPath)); 
			out.write(bytes); 
			out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화 
			
			String callback = request.getParameter("CKEditorFuncNum"); 
			printWriter = response.getWriter(); 
			String fileUrl = "ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면 
			
			// 업로드시 메시지 출력
			printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}"); 
			printWriter.flush(); 
			
		}catch(IOException e){ 
			e.printStackTrace(); 
			} finally { 
				try { if(out != null) { out.close(); } 
				if(printWriter != null) { printWriter.close(); } 
				} catch(IOException e) { e.printStackTrace(); } 
			} 
		return; 
	}
	
	@RequestMapping(value="trip/ckImgSubmit.do") 
	public void ckSubmit(@RequestParam(value="uid") String uid 
			, @RequestParam(value="fileName") String fileName
			, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{ 
		
		//서버에 저장된 이미지 경로 
		String real = session.getServletContext().getRealPath("/resources/tripPhoto");
		String sDirPath = real+ "/" + uid + "_" + fileName; 
		File imgFile = new File(sDirPath); 
		
		//사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다. 
		if(imgFile.isFile()){ byte[] buf = new byte[1024]; 
		int readByte = 0; 
		int length = 0; 
		byte[] imgBuf = null; 
		
		FileInputStream fileInputStream = null; 
		ByteArrayOutputStream outputStream = null; 
		ServletOutputStream out = null; 
		
		try{ 
			fileInputStream = new FileInputStream(imgFile); 
			outputStream = new ByteArrayOutputStream(); 
			out = response.getOutputStream(); 
			
			while((readByte = fileInputStream.read(buf)) != -1){ 
				outputStream.write(buf, 0, readByte); 
				} 
			
			imgBuf = outputStream.toByteArray(); 
			length = imgBuf.length; 
			out.write(imgBuf, 0, length); 
			out.flush(); 
			
		}catch(IOException e){ 
			e.getMessage();
		}finally { 
			outputStream.close();
			fileInputStream.close();
			out.close();
			} 
		} 
	}

	@RequestMapping("trip/tripInsertForm")
	public String noticeInsertForm(Trip trip, String pageNum, HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("id");
		String admin_id = (String) session.getAttribute("adminid");

		if(m_id == null) {
			Member adminInfo = ms.select(admin_id);
			model.addAttribute("adminInfo",adminInfo);
		}
		if(admin_id == null) {
			Member member = ms.select(m_id);
			model.addAttribute("member",member);
		}

		model.addAttribute("pageNum", pageNum);

		return "trip/tripInsertForm";
	}

	@RequestMapping("trip/tripInsert")
	public String noticeInsert(Trip trip, String pageNum, Model model) {
		int number = ts.maxNum(); // 새 게시글 번호 생성
		
		trip.setT_num(number);
		int result = ts.insert(trip);
			
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "trip/tripInsert";
	}
	
	@RequestMapping("trip/tripView")
	public String noticeView(Trip trip, HttpSession session, String pageNum, Model model) {
		int t_num = trip.getT_num();
		String m_id = (String) session.getAttribute("id");
		String tripLikeImgSrc ="";
		int tripLikeCnt;
		
		ts.updateViewcount(t_num);  // 조회수 증가
		Trip trip2 = ts.select(t_num); // 조회
		
		if(m_id != null) {
			TripLike tripLike = ts.tLike(m_id, t_num);
			if(tripLike != null) {
				tripLikeImgSrc = "/goat/resources/tripPhoto/fullHeart.png";
				tripLikeCnt = ts.tlCnt(t_num);
			}else {
				tripLikeImgSrc = "/goat/resources/tripPhoto/heart.png";
				tripLikeCnt = ts.tlCnt(t_num);
			}
		}else {
			tripLikeImgSrc = "/goat/resources/tripPhoto/heart.png";
			tripLikeCnt = ts.tlCnt(t_num);
		}
		
		model.addAttribute("tripLikeImgSrc",tripLikeImgSrc);
		model.addAttribute("tripLikeCnt", tripLikeCnt);
		model.addAttribute("pageNum", pageNum);		
		model.addAttribute("trip", trip2);
		
		return "trip/tripView";
	}
	
	@RequestMapping(value = "trip/tripLike", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지말고 바로 본문으로 전달
	public String tripLike(String t_num, HttpSession session) {
		
		String m_id = (String) session.getAttribute("id");
		int num = Integer.parseInt(t_num);
		String tripLikeImgSrc = "";
		
		TripLike tripLike = ts.tLike(m_id, num);
		
		if(tripLike != null) { // 좋아요 테이블에 있으면
			ts.deleteTL(m_id, num); // 좋아요 삭제
			tripLikeImgSrc = "/goat/resources/tripPhoto/heart.png";
		}else {
			ts.insertTL(m_id, num); // 좋아요 추가
			tripLikeImgSrc = "/goat/resources/tripPhoto/fullHeart.png";
		}	
		return tripLikeImgSrc;
	}
	
	@RequestMapping("trip/tripDelete")
	public String noticeDelete(Trip trip, String pageNum, Model model) {
		int t_num = trip.getT_num();
		int result = ts.delete(t_num);
		
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);
		
		return "trip/tripDelete";
	}
	
	@RequestMapping("trip/tripUpdateForm")
	public String noticeUpdateForm(Trip trip, String pageNum, HttpSession session,Model model) {
		String m_id = (String) session.getAttribute("id");
		String admin_id = (String) session.getAttribute("adminid");
		int t_num = trip.getT_num();
		Trip trip2 = ts.select(t_num);
		
		if(m_id == null) {
			Member adminInfo = ms.select(admin_id);
			model.addAttribute("adminInfo",adminInfo);
		}
		if(admin_id == null) {
			Member member = ms.select(m_id);
			model.addAttribute("member",member);
		}

		model.addAttribute("trip", trip2);
		model.addAttribute("pageNum", pageNum);
		
		return "trip/tripUpdateForm";
	}
	
	@RequestMapping("trip/tripUpdate")
	public String noticeUpdate(Trip trip, String pageNum, Model model) {
		int t_num = trip.getT_num();
		String t_title = trip.getT_title();
		String t_content = trip.getT_content();
		
		trip.setT_num(t_num);
		trip.setT_title(t_title);
		trip.setT_content(t_content);
		int result = ts.update(trip);
			
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("result", result);

		return "trip/tripUpdate";
	}
	
	@RequestMapping("trip/tripSearch")
	public String tripSearch(Trip trip, String keyword, String pageNum, Model model) {
		int  rowPerPage = 10;
		if (pageNum == null || pageNum.equals("")) pageNum="1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ts.getTotal(trip);
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow = startRow + rowPerPage - 1;
		trip.setStartRow(startRow);
		trip.setEndRow(endRow);
		List<Trip> searchList = ts.searchList(trip);
		PageBean pb = new PageBean(currentPage, rowPerPage, total);
		// 답변글로 인한 번호를 보기좋게 다시 설정
		int no = total - startRow + 1;
		String[] title = {"제목","내용","제목+내용"};
		
		model.addAttribute("trip", trip);
		model.addAttribute("title", title);
		model.addAttribute("keyword", keyword);
		model.addAttribute("no", no);
		model.addAttribute("searchList", searchList);
		model.addAttribute("pb", pb);
		
		return "trip/tripSearch";
	}
}