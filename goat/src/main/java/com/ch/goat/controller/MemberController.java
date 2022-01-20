package com.ch.goat.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ch.goat.model.Alert;
import com.ch.goat.model.Cs;
import com.ch.goat.model.Member;
import com.ch.goat.model.Place;
import com.ch.goat.model.Schedule;
import com.ch.goat.model.TempPlace;
import com.ch.goat.model.Trip;
import com.ch.goat.service.MemberService;
@Controller
public class MemberController {
	@Autowired
	private MemberService ms;
	@Autowired
	private JavaMailSenderImpl mailSender;
	// 비밀번호 암호화
	@Autowired
	private BCryptPasswordEncoder bpPass;
	@RequestMapping("main/main")
	public String main() {
		return "main/main";
	}
	@RequestMapping("main/home")
	public String home() {
		return "main/home";
	}
	@RequestMapping("main/homeModal")
	public String homeModal(String area, Model model) {
		model.addAttribute("area", area);
		return "main/homeModal";
	}
	@RequestMapping("member/joinForm")
	public String joinForm() {
		return "member/joinForm";
	}
	@RequestMapping(value = "member/chkId", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkId(String m_id, Model model) {
		String msg = "";
		Member member = ms.select(m_id);
		if(member == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping(value = "member/chkNick", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkNick(Member member, Model model) {
		String msg = "";
		Member member2 = ms.nickChk(member);
		if(member2 == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping(value = "member/chkEmail", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkEmail(Member member, Model model) {
		String msg = "";
		Member member2 = ms.emailChk(member);
		if(member2 == null) msg = "0";
		else msg = "1";
		return msg;
	}
	@RequestMapping("member/join")
	public String join(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// 화면에서 입력한 데이터가 있는지 확인 member = 화면에서 입력한 데이터 member2 = db에서 읽어온 데이터
		Member member2 = ms.select(member.getM_id());
		if (member2 == null) {
			// 실제 파일명
			String fileName1 = member.getFile().getOriginalFilename();
			String fileName="";
			if (fileName1==null||fileName1.equals("")) {
				System.out.println("getFile = " + member.getFile().getOriginalFilename());
				fileName = "goat6.png";
				System.out.println("file Name = " + fileName);
			} else {
				System.out.println("getFile = " + member.getFile().getOriginalFilename());
				// 파일명을 변경해야 할 때 : UUID 임의의 문자열로 변경 Mac은 파일명이 한글이면 깨짐
				UUID uuid = UUID.randomUUID();
				fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
				System.out.println("file Name = " + fileName);
				// 실제 파일 저장 경로
				String real = session.getServletContext().getRealPath("/resources/m_photo");
				System.out.println("real = " + real);
				// 파일 저장			
				FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName));
				System.out.println("real + fileName = " + real+ "/" + fileName);
				fos.write(member.getFile().getBytes());
				fos.close();
			}
			// 입력한 암호를 암호화 한 후 다시 db에 저장
			String pass = bpPass.encode(member.getM_pass());
			member.setM_pass(pass);
			member.setM_photo(fileName);
			result = ms.insert(member);
		} else result = -1; // 이미 있는 데이터
		model.addAttribute("result", result);
		return "member/join";
	}
	@RequestMapping("member/loginForm")
	public String loginForm(HttpServletRequest request, Model model) {
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);
		model.addAttribute("prevUrl", prevUrl);
		return "member/loginForm";
	}
	@RequestMapping("member/login")
	public String login(Member member, Model model, String prevUrl, HttpSession session) {
		int result = 0; // 암호가 다름
		Member member2 = ms.select(member.getM_id());
		if (member2 == null || member2.getDel().equals("y")) {
			result = -1; // 없는 아이디
		} else {
//			if (member.getPassword().equals(member2.getPassword())) 암호화 되어있기 때문에 불가능
			if (bpPass.matches(member.getM_pass(), member2.getM_pass())) {
				result = 1; // 성공 id와 암호가 일치
				if (member2.getAdmin().equals("n")) {
					session.setAttribute("id", member.getM_id());
				} else {
					session.setAttribute("adminid", member.getM_id());
				}
				session.setAttribute("m_num", member2.getM_num());
				session.setAttribute("m_img", member2.getM_photo());
				List<Alert> alert = ms.confirm(member2.getM_num());
				session.setAttribute("alert", alert);
			}
		}
		model.addAttribute("result", result);
		model.addAttribute("prevUrl", prevUrl);
		return "member/login";
	}
	@RequestMapping(value = "member/chkAlert")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public List<Alert> chkAlert(int m_num, HttpSession session) {
		List<Alert> alert = ms.confirm(m_num);
		session.removeAttribute("alert");
		session.setAttribute("alert", alert);
		return alert;
	}
	@RequestMapping("member/logout")
	public String logout(HttpSession session, HttpServletRequest request, Model model) {
		session.invalidate();
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);
		model.addAttribute("prevUrl", prevUrl);
		return "member/logout";
	}
	@RequestMapping("member/findIdForm")
	public String findIdForm() {
		return "member/findIdForm";
	}
	@RequestMapping("member/findIdResult")
	public String findIdResult(Member member, Model model) {
		int result = 0;
		Member member2 = ms.findId(member);
		if(member2 == null) {
			result = -1; // 데이터 없음
		} else {
			result = 1;
		}
		
		model.addAttribute("result", result);
		model.addAttribute("member", member2);
		return "member/findIdResult";
	}
	@RequestMapping("member/findPassForm")
	public String findPassForm() {
		return "member/findPassForm";
	}
	@RequestMapping("member/findPassResult")
	public String findPassResult(Member member, Model model) {
		int result = 0;
		Random r = new Random();
		int num = r.nextInt(999999); // 랜덤난수설정
		
		Member member2 = ms.findPass(member);
		if(member2 == null) { 
			result = -1; // 데이터 없음
		} else {
			MimeMessage mail = mailSender.createMimeMessage();
        	String msg2 = "안녕하세요 회원님!<br>";
            msg2 += "비밀번호 찾기(변경) 인증번호는<br>";
            msg2 += "<b><font color=red>"+num+"</font></b>"+" 입니다.<br>";
            msg2 += "<i>숫자를 정확하게 입력해주세요</i>";

			try {
				String myEmail = "wzk1201@naver.com";
                mail.setFrom(new InternetAddress(myEmail));
			    mail.setSubject("[G.O.A.T] 비밀번호 찾기 인증 이메일", "utf-8");
			    mail.setText(msg2, "utf-8", "html");
			    mail.addRecipient(Message.RecipientType.TO, new InternetAddress(member.getM_email()));
			    mailSender.send(mail);
			} catch (MessagingException e) {
			    e.printStackTrace();
			}
			result = 1;
		}
		model.addAttribute("member", member2);
		model.addAttribute("result", result);
		model.addAttribute("num", num);
		return "member/findPassResult";
	}
	@RequestMapping("member/updatePassForm")
	public String updatePassForm(Member member, Model model) {
		model.addAttribute("member", member);
		return "member/updatePassForm";
	}
	@RequestMapping("member/updatePassResult")
	public String updatePassResult(Member member, Model model) {
		String password = bpPass.encode(member.getM_pass());
		member.setM_pass(password);
		int result = ms.updatePass(member);
		model.addAttribute("result", result);
		return "member/updatePassResult";
	}
	@RequestMapping("member/myPage")
	public String myPage(HttpSession session, Model model) {
		String m_id = (String) session.getAttribute("id");
		Member member = ms.select(m_id);
		model.addAttribute("member", member);
		return "member/myPage";
	}
	@RequestMapping("member/updateForm")
	public String updateForm(String m_id, Model model) {
		Member member = ms.select(m_id);
		model.addAttribute("member", member);
		return "member/updateForm";
	}
	@RequestMapping(value = "member/chkUpdateNick", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkUpdateNick(Member member, Model model) {
		String msg = "";
		Member member2 = ms.nickChk(member);
		if(member2 == null) {
			msg = "0";
		} else if (member.getM_id().equals(member2.getM_id())) {
			msg = "1";
		} else {
			msg = "-1";
		};
		return msg;
	}
	@RequestMapping(value = "member/chkUpdateEmail", produces = "text/html;charset=utf-8")
	@ResponseBody // jsp로 가지않고 바로 바디로 전달
	public String chkUpdateEmail(Member member, Model model) {
		String msg = "";
		Member member2 = ms.emailChk(member);
		if(member2 == null) {
			msg = "0";
		} else if (member.getM_id().equals(member2.getM_id())) {
			msg = "1";
		} else {
			msg = "-1";
		};
		return msg;
	}
	@RequestMapping("member/update")
	public String update(Member member, Model model, HttpSession session) throws IOException {
		int result = 0;
		// 실제 파일명
		String fileName1 = member.getFile().getOriginalFilename();
		String fileName = "";
		if (fileName1==null||fileName1.equals("")) {
			fileName = ms.photo(member.getM_id());
		} else {
			// 파일명을 변경해야 할 때 : UUID 임의의 문자열로 변경 Mac은 파일명이 한글이면 깨짐
			UUID uuid = UUID.randomUUID();
			fileName = uuid+fileName1.substring(fileName1.lastIndexOf("."));
		}
		// 실제 파일 저장 경로
		String real = session.getServletContext().getRealPath("/resources/m_photo");
		// 파일 저장			
		FileOutputStream fos = new FileOutputStream(new File(real + "/" + fileName));
		fos.write(member.getFile().getBytes());
		fos.close();
		// 입력한 암호를 암호화 한 후 다시 db에 저장
		String pass = bpPass.encode(member.getM_pass());
		member.setM_pass(pass);
		member.setM_photo(fileName);
		result = ms.update(member);
		session.setAttribute("m_img", member.getM_photo());
		model.addAttribute("result", result);
		return "member/update";
	}
	@RequestMapping("member/delete")
	public String delete(String m_id, Model model, HttpSession session) {
		int result = ms.delete(m_id);
		if (result > 0) {
			session.invalidate();
		}
		model.addAttribute("result", result);
		return "member/delete";
	}
	@RequestMapping("member/createPlaceList")
	public String placeCreateList(int m_num, Model model) {
		List<TempPlace> place = ms.cpList(m_num);
		model.addAttribute("place", place);
		return "member/createPlaceList";
	}
	@RequestMapping("member/cpDelete")
	public String cpDelete(int temp_num, int m_num, Model model) {
		int result = ms.cpDelete(temp_num);
		model.addAttribute("m_num", m_num);
		model.addAttribute("result", result);
		return "member/cpDelete";
	}
	@RequestMapping("member/bookmarkList")
	public String bookmarkList(int m_num, Model model) {
		List<Integer> num = ms.bmNum(m_num);
		List<Place> list = new ArrayList<Place>();
		Iterator<Integer> it = num.iterator();
		while(it.hasNext()) {
			int temp = it.next();
			list.addAll((List<Place>)ms.bookmarkList(temp));
		}
		model.addAttribute("list", list);
		model.addAttribute("m_num", m_num);
		return "member/bookmarkList";
	}
	@RequestMapping("member/myCsList")
	public String myCsList(int m_num, Model model) {
		List<Cs> list = ms.myCsList(m_num);
		model.addAttribute("list", list);
		return "member/myCsList";
	}
	@RequestMapping("member/scheduleList")
	public String scheduleList(int m_num, Model model) {
		List<Schedule> list = ms.myScList(m_num);
		model.addAttribute("list", list);
		return "member/scheduleList";
	}
	@RequestMapping("member/tripList")
	public String tripList(int m_num, Model model) {
		List<Trip> list = ms.myTripList(m_num);
		model.addAttribute("list", list);
		return "member/tripList";
	}
	@RequestMapping("member/alertTp")
	public String alertTp(int ale_num, int temp_num, int place_num, Model model) {
		ms.alertTp(ale_num);
		model.addAttribute("temp_num", temp_num);
		model.addAttribute("place_num", place_num);
		return "member/alertTp";
	}
	@RequestMapping("member/alertCs")
	public String alertCs(int ale_num, int cs_num, Model model) {
		ms.alertCs(ale_num);
		model.addAttribute("cs_num", cs_num);
		return "member/alertCs";
	}
	@RequestMapping("member/alertTr")
	public String alertTr(int ale_num, int t_num, Model model) {
		ms.alertTr(ale_num);
		model.addAttribute("t_num", t_num);
		return "member/alertTr";
	}
}
