package com.ex.springboot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ex.springboot.model.Board_DAO;
import com.ex.springboot.model.Board_DTO;
import com.ex.springboot.model.League_DAO;
import com.ex.springboot.model.Member_DAO;
import com.ex.springboot.model.Member_DTO;
import com.ex.springboot.model.Page_DTO;
import com.ex.springboot.model.Player_DAO;
import com.ex.springboot.model.Reply_DAO;
import com.ex.springboot.model.Reply_DTO;
import com.ex.springboot.service.BoardService;
import com.ex.springboot.service.MemberService;

import jakarta.servlet.http.HttpSession;

@Controller
public class Volleyball_Controller {
	@Autowired
	League_DAO league_dao;
	
	@Autowired
	Player_DAO player_dao;
	
	@Autowired
	Member_DAO member_dao;
	
	@Autowired
	Board_DAO board_dao;
	
	@Autowired
	Reply_DAO reply_dao;

	
	// 회원가입 서비스 클래스
	@Autowired
	private MemberService member_service;

	
	// 게시판 서비스 클래스
	@Autowired
	private BoardService board_service;

	
	@RequestMapping("/")
	public String root() {
		return "redirect:index";
	}

	
	
	/***** 댓글 삭제 *****/
	@RequestMapping("/deleteReply")
	public String deleteReply(Reply_DTO reply_dto) {
		int result = reply_dao.deleteReply(reply_dto);
		System.out.println(result);
		
		return "redirect:selectContent?idx="+reply_dto.getB_idx();
	}
	
	
	
	
	/***** 댓글 수정 *****/
	@RequestMapping("/updateReply")
	public String updateReply(Reply_DTO reply_dto) {
		if(reply_dto.getTitle() == null || reply_dto.getTitle().trim() == "" ||
			reply_dto.getContent() == null || reply_dto.getContent().trim() == "" ) {
				return "replyError";
		} 
		
		int result = reply_dao.updateReply(reply_dto);
		System.out.println(result);
		

		return "redirect:selectContent?idx="+reply_dto.getB_idx();
	}
	
	
	/***** 댓글 등록 *****/
	@ResponseBody
	@GetMapping("/insertReply")
	public int insertReply(Reply_DTO reply_dto) {
		
		int result = reply_dao.writeReply(reply_dto);
		System.out.println(result);

		return result;
	}
	
	
	
	/***** 게시글 수정 *****/
	@RequestMapping("/updateBoard")
	public String updateBoard(Board_DTO board_dto) {
		
		int result = board_service.updateBoard(board_dto);
		System.out.println(result);
		
		return "redirect:board/fanzone";
	}
	
	
	
	/***** 게시글 삭제 *****/
	@RequestMapping("/deleteBoard")
	public String deleteBoard(Board_DTO board_dto) {
		int result = board_service.deleteBoard(board_dto);
		System.out.println(result);
		
		return "redirect:board/fanzone";
	}
	
	
	/***** 게시글 작성 *****/
	@RequestMapping("/insertBoard")
	public String insertBoard(Board_DTO board_dto) {
		int result = board_service.insertBoard(board_dto);
		System.out.println(result);
		
		return "redirect:board/fanzone";
	}
	
	
	/***** 게시판 작성 화면 *****/
	@RequestMapping("/writeBoard")
	public String writeBoard(HttpSession session, Model model) {
		String id = (String) session.getAttribute("logId");
		
		Member_DTO member_dto = member_service.selectMember(id);

		model.addAttribute("Member_DTO", member_dto);
		
		return "board/writeBoard";
	}
	
	
	/***** 게시물 상세보기 + 댓글 리스트 *****/
	@RequestMapping("/selectContent")
	public String selectContent(Board_DTO board_dto, HttpSession session, Model model) {

		// 사용자 이름 찾기
		String id = (String) session.getAttribute("logId");
		Member_DTO member_dto = member_dao.selectMember(id);
		String name = member_dto.getName();
		
		List<Reply_DTO> reply_dto = reply_dao.selectReplyList(board_dto.getIdx());
		// 댓글 리스트 저장
		model.addAttribute("reply", reply_dto);
		
		Board_DTO dto = board_service.selectContent(board_dto);
		// 게시글 정보 저장
		model.addAttribute("Board_DTO", dto);
		
		// 사용자 이름 저장
		model.addAttribute("name", name);
 		
		return "board/contentView";
	}
	

	/***** 게시물 리스트 페이지 *****/
	@RequestMapping("/board/fanzone")
	public String fanzone(@RequestParam(value = "num", required = false, defaultValue = "1") int num,
			Model model,  
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {		
		
		System.out.println("타입 : " + searchType);
		System.out.println("키워드 : " + keyword);
		
		// 검색에 필요한 자료를 저장
		Map<String, Object> search = new HashMap<>();
		search.put("searchType", searchType);
		search.put("keyword", keyword);
		
		// 페이지 객체에 현재 페이지 번호와 조건에 맞는 게시글 카운트
		Page_DTO page = new Page_DTO();
		page.setNum(num);
		page.setCount(board_dao.selectBoardCount(search));  
		page.setSearchType(searchType);
		page.setKeyword(keyword);
		

		// 리스트를 호출하기 위한 정보를 저장
		Map<String, Object> map = new HashMap<>();
		map.put("displayPost", page.getDisplayPost());
		map.put("postNum", page.getPostNum());
		map.put("searchType", searchType);
		map.put("keyword", keyword);
		
		// 리스트 호출
		List<Board_DTO> list = board_dao.searchBoardList(map);
		
		// 공지사항 리스트 호출
		List<Board_DTO> notice = board_dao.selectBoardNotice();
		
		
		//리스트 저장
		model.addAttribute("list", list);
		model.addAttribute("notice", notice);
		
		//페이징 객체 저장
		model.addAttribute("page", page);  
		
		model.addAttribute("select", num);
			

		return "board/fanzone";
	}
	
	
	/***** 홈 화면 *****/
	@RequestMapping("/index")
	public String index(Model model) {
		model.addAttribute("tableList", league_dao.tableList());
		model.addAttribute("playerList1", player_dao.playerList1());
		model.addAttribute("playerList2", player_dao.playerList2());
		model.addAttribute("playerList3", player_dao.playerList3());
		model.addAttribute("playerList4", player_dao.playerList4());
		return "index";
	}

	/***** 플레이어 페이지 *****/
	@RequestMapping("/player")
	public String player() {
		return "player";
	}

	/***** 클럽 페이지 *****/
	@RequestMapping("/club")
	public String club() {
		return "club";
	}

	/***** 로그인 화면 *****/
	@RequestMapping("/profile/login")
	public String login() {
		return "profile/login";
	}

	/***** 회원가입 화면 *****/
	@RequestMapping("/profile/join")
	public String join() {
		return "profile/join";
	}

	/***** 로그인 *****/
	@RequestMapping("/login")
	public String login(Member_DTO member_dto, HttpSession session, Model model) {
		member_dto = member_service.getMember(member_dto);
		String result = "";

		if (member_dto != null) {
			System.out.println("로그인 성공");
			session.setAttribute("logId", member_dto.getId());
			result = "redirect:index";
		} else {
			System.out.println("로그인 실패");
			model.addAttribute("msg", "fail");
			result = "profile/login";
		}

		return result;
	}

	/***** 로그아웃 *****/
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "profile/login";
	}

	/***** 회원가입 *****/
	@PostMapping("/joinMember")
	public String joinMember(Member_DTO member_dto) {
		int result = member_service.insertMember(member_dto);
		System.out.println(result);

		return "profile/login";
	}

	/***** 아이디 중복체크 *****/
	@ResponseBody
	@GetMapping("/idCheck")
	public int idCheck(Member_DTO member_dto) {
		int result = member_service.idCheck(member_dto);
		System.out.println(result);

		return result;
	}

	/***** 마이페이지 *****/
	@RequestMapping("/mypage")
	public String mypage(HttpSession session, Model model) {
		String id = (String) session.getAttribute("logId");

		Member_DTO member_dto = member_service.selectMember(id);

		model.addAttribute("Member_DTO", member_dto);

		return "profile/mypage";
	}

	/***** 회원탈퇴 *****/
	@ResponseBody
	@GetMapping("/deleteProfile")
	public int deleteProfile(Member_DTO member_dto) {
		int result = member_service.deleteMember(member_dto);
		System.out.println(result);

		return result;
	}

	/***** 내 정보 수정 *****/
	@PostMapping("/updateProfile") // 수정
	public String updateProfile(Member_DTO member_dto) {

		int result = member_service.updateMember(member_dto);
		System.out.println(result);

		return "redirect:mypage";
	}
}
