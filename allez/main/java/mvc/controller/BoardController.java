package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BoardDTO;

public class BoardController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		/* 
		전체 url => http://localhost:8080/프로젝트명/~.do 
		- RequestURI : /allez/~.do
		- contextPath : allez
		- command : ~.do
		*/
		
		System.out.println("RequestURI : "+RequestURI);
		System.out.println("contextPath : "+contextPath);
		System.out.println("command : "+command);
		
		String viewPage = null; // 이동시킬 페이지를 넣을 변수를 미리 생성
		
		if(command.equals("/write_view.bo")) { // 게시물 작성 요청이 들어온다면
			viewPage="/board/write_view.jsp"; // write_view 페이지로 이동
			
		}else if(command.equals("/write.bo")) { // write_view에서 사용자가 게시물 입력을 완료한다면 
			writeCommand(request, response); // writeCommand()메소드 호출 => db에 게시글 저장하고
			
			viewPage="list.bo"; // 목록을 보여주는 요청 전송
			
		}else if(command.equals("/list.bo")) { // 목록을 보여달라는 요청이 들어온다면
			listCommand(request, response); // listCommand()메소드 호출 => db에서 데이터를 가져와서 setAttribute로 리스트 저장 후
						
			viewPage="/board/list.jsp"; // list 페이지로 이동
			
		}else if(command.equals("/content_view.bo")) { // 리스트 페이지에서 게시글을 클릭하여 상세내용을 보려는 요청이 들어온다면
			contentCommand(request, response); // contentCommand()메소드 호출 => 글번호에 맞는 DB데이터를 DTO객체에 담아 가져온 후 조회수 올리고
			
			viewPage="/board/content_view.jsp"; // content_view 페이지로 이동
			
		}else if(command.equals("/modify.bo")) { // content_view에서 수정하기 요청이 들어온다면
			modifyCommand(request, response); // modifyCommand()메소드 호출 => 글번호에 맞는 DB데이터를 재입력값으로 수정하고
			
			viewPage="list.bo"; // 목록을 보여주는 요청 전송
			
		}else if(command.equals("/delete.bo")) { // content_view에서 삭제하기 요청이 들어온다면
			deleteCommand(request, response); // deleteCommand()메소드 호출 => 글번호에 맞는 DB데이터를 삭제하고
			
			viewPage="list.bo"; // 목록을 보여주는 요청 전송
			
		}else if(command.equals("/reply_view.bo")) { // content_view에서 답변을 보여달라는 요청이 들어온다면 
			replyViewCommand(request, response); // replyViewCommand()메소드 호출 => 답변하고자 하는 글번호에 맞는 DB데이터를 가져와서
			
			viewPage="/board/reply_view.jsp"; // setAttribute로 board객체를 replay라는 변수에 담아 reply_view 페이지 이동
			
		}else if(command.equals("/reply.bo")) { //reply_view에서 답변을 작성하고 submit요청을 한다면
			replyCommand(request, response); // replyCommand()메소드 호출 => 답변하고자 하는 글의 데이터를 부모글로 새로 추가하고 추가된 글을 답변으로 입력한 내용으로 수정하여
			
			viewPage="list.bo"; // 목록을 보여주는 요청 전송
		}
		
		
		// RequestDispatcher : 사용자의 요청을 받아서 페이지를 이동시키는 기능을 가진 클래스
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		// 뷰페이지에 들어있던 요청과 응답을 해당 뷰로 forwarding -> 예외 처리or전가 필수 메소드
		dispatcher.forward(request, response);
	}
	
	
	// 페이지에서 데이터를 전송받아 DB에 글을 저장하는 함수
	public void writeCommand(HttpServletRequest request, HttpServletResponse response) {
		// 사용자가 글쓰기 폼에서 입력한 정보 받기
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		
		// DB연동해주는 BoardDAO write() 메소드 호출
		BoardDAO dao = BoardDAO.getInstance();
		dao.write(subject, content, id);
	}
	
	// DB에서 리스트를 불러오는 함수
	public void listCommand(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO dao = BoardDAO.getInstance();
		
		String items = request.getParameter("items"); // 게시판 하단의 검색 옵션 값
		String text = request.getParameter("text"); // 게시판 하단의 검색 텍스트 값
		
		// BoardDAO list() 메소드 호출
		List<BoardDTO> list = dao.list(items, text);
		
		// 다음에 진행되는 jsp페이지에 "listAll"이라는 이름으로 데이터 테이블 정보 제공(키,값)
		request.setAttribute("boardList", list);
	}
	
	
	// DB에서 글의 내용을 가져오고 조회수를 올리는 함수
	public void contentCommand(HttpServletRequest request, HttpServletResponse response) {
		// DB에 글 내용을 요청
		
		// 사용자가 클릭한 게시물 번호 => num
		String num =request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		
		// contentView() : 글 내용을 가져오는 DAO 메소드
		BoardDTO board = dao.contentView(num);
		
		request.setAttribute("content", board);
	}
	
	
	
	// DB에서 글번호 num을 선택해 DB데이터를 update(수정)하는 함수
	public void modifyCommand(HttpServletRequest request, HttpServletResponse response) {
		// 글 수정 요청을 하는 사용자로부터 글번호 num 정보와 수정하는 제목, 내용 받기
		String num = request.getParameter("num");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		// BoardDAO 객체를 얻어온 후 modify() 메소드 호출
		BoardDAO dao = BoardDAO.getInstance();
		dao.modify(num,subject,content);
	}
	
	
	// DB에서 글번호 num을 선택해 DB데이터를 삭제하는 함수
	public void deleteCommand(HttpServletRequest request, HttpServletResponse response) {
		// 삭제하고자하는 게시물 번호
		String num = request.getParameter("num");
		
		// 삭제 작업 메소드 준비
		BoardDAO dao = BoardDAO.getInstance();
		dao.delete(num);	
	}
	
	
	// DB에서 답변하고자 하는 글의 내용을 가져오는 함수
	public void replyViewCommand(HttpServletRequest request, HttpServletResponse response) {
		// 게시물번호
		String num = request.getParameter("num");
		BoardDAO dao = BoardDAO.getInstance();
		
		BoardDTO board = dao.contentView(num);
		
		request.setAttribute("reply", board);
	}
	
	
	
	// DB에서 게시물 번호에 맞는 데이터를 가져와서 부모글로 추가하고 그 데이터를 답변 입력내용으로 수정하는 함수  
	public void replyCommand(HttpServletRequest request, HttpServletResponse response) {
		// 게시물번호
		String num = request.getParameter("num");

		// 답변 입력내용
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		
		// 부모글 정보
		String reF=request.getParameter("reF");
		String reStep=request.getParameter("reStep");
		String reLevel=request.getParameter("reLevel");
		
		String id=request.getParameter("id");

		BoardDAO dao=BoardDAO.getInstance();
		dao.reply(num, subject, content, reF, reStep, reLevel, id);
	}
}
