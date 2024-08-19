package com.ss.sns.mypage.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ss.sns.member.dto.MemberDTO;
import com.ss.sns.mypage.dto.MypagePage;
import com.ss.sns.mypage.service.MypageService;
import com.ss.sns.trip.dto.TripDTO;


@Controller
public class MypageController {

	@Autowired
	private MypageService service;
	
	@CacheEvict
	@RequestMapping("/mypage")
	public String mypage(@RequestParam(value="page", defaultValue = "1") int currentPage, 
						 @RequestParam(value="page2", defaultValue = "1") int currentPage2,
						 Model model, HttpSession session) {
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		
		System.out.println(Session.getMember_nickname());
		System.out.println(Session.getMember_img());
		model.addAttribute("nickname",Session.getMember_nickname()); 
		model.addAttribute("img",Session.getMember_img()); 
//		int member_no = service.getMemberNo(Session.getMember_nickname());
		
	
		int member_no = Session.getMember_no();
		int BoardTotalCount = service.selectBoardTotalCount(member_no);
		int pageSize = 2;
		
		// 내가 작성한 글
		MypagePage mypage = new MypagePage(pageSize, BoardTotalCount, currentPage);
		Map<String, Integer> myBmap = new HashMap<String,Integer>();
		myBmap.put("startNo", mypage.getStartNo());
		myBmap.put("endNo", mypage.getEndNo());
		myBmap.put("member_no", member_no);
		
		mypage.setBoardList(service.selectMyBoardList(myBmap));
		model.addAttribute("myPage", mypage);
		
//		내가 좋아요 한 글
		MypagePage mypageLike = new MypagePage(pageSize, BoardTotalCount, currentPage2);
		Map<String, Integer> myBLmap = new HashMap<String,Integer>();
		myBLmap.put("startNo", mypageLike.getStartNo());
		myBLmap.put("endNo", mypageLike.getEndNo());
		myBLmap.put("member_no", member_no);
		
		mypageLike.setBoardList(service.selectMyLikeBoardList(myBLmap));
		model.addAttribute("myPageLike", mypageLike);
		
		List<TripDTO> trips = service.getTripsByMemberNo(member_no);
		
        model.addAttribute("trips", trips);
		
        System.out.println("마이페이지로 가능 trips: "+trips);
        
		return "mypage/mypage";
	}
	
	


	@RequestMapping("/profile")
	public String setting(Model model, HttpSession session) {
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		
		model.addAttribute("nickname",Session.getMember_nickname()); 
		model.addAttribute("email",Session.getMember_email()); 
		model.addAttribute("img",Session.getMember_img()); 
		
		return "mypage/setting";
	}
	
	@Autowired
	private ServletContext context;
	
	@RequestMapping("/profileModify")
	public String profileModify(@RequestParam(value="nickname") String nickname,
								@RequestParam(value="user_img") MultipartFile img,
								@RequestParam(value="profileEmail") String email,
								HttpSession session) {
		
		// 파일명을 얻어서 출력
		String fileReadName = img.getOriginalFilename();
		// 파일 사이즈
		long size = img.getSize();
		
		System.out.println(nickname);
		System.out.println("파일명 : " + fileReadName);
		System.out.println("파일 사이즈 : " + size);
		
		String fileRename = fileReadName.substring(fileReadName.lastIndexOf("."),fileReadName.length());
		
		String uploadFolder = context.getRealPath("/resources/img/mypage");
		String uploadFolder2 = "C:\\fullstack_project2\\TREEP\\src\\main\\webapp\\resources\\img\\mypage";
		
		try {
			File uploadDir = new File(uploadFolder);
			
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			
			
			// 저장할 파일 경로 
			File saveFile = new File(uploadFolder + File.separator + fileReadName);
//			File saveFile2 = new File(uploadFolder2 + "\\" + fileReadName);
			
			System.out.println(uploadFolder);
			
			// 파일 저장
			img.transferTo(saveFile);
//			img.transferTo(saveFile2);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		Map<String,Object> userDataMap = new HashMap<String, Object>();
		userDataMap.put("nickname",nickname);
		userDataMap.put("img",fileReadName);
		userDataMap.put("email", email);
		
		service.profileModify(userDataMap);
		
		MemberDTO Session = (MemberDTO)session.getAttribute("member");
		Session.setMember_nickname(nickname);
		Session.setMember_img(fileReadName);
		session.setAttribute("member",Session);
		
		return "redirect:/mypage";
	}
	@RequestMapping("/writeboard")
	public String writeboard(Model model, HttpSession session) {
		

		return "board/writeboard";
	}
	
	@GetMapping("/tripDetail")
    public String getTripDetail(@RequestParam("trip_no") int tripNo, Model model) {
        TripDTO trip = service.getTripDetails(tripNo);
        model.addAttribute("trip", trip);
        System.out.println("getTrip컨트로로");
        return "mypage/tripDetail";  
    }
	
	
	
}
