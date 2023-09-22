package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;
import java.util.Random;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.MemberDAO;
import mvc.model.MemberDTO;

/*18-5)HttpServlet을 상속받는 BoardController 클래스 생성*/

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		System.out.println("RequestURI : " + RequestURI);
		// 프로젝트 path~파일명.확장자 가져옴 => 예시)/step01/LoginMember.jsp
		String command = RequestURI.substring(14);
		System.out.println(command);
		// //LoginMember.jsp 를 가져옴
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");

		// 로그인
		if (command.equals("LoginMemberAction.do")) {
			requestLoginForm(request);
			// requestOO형식의 메소드의 request값을 호출
			RequestDispatcher rd = request.getRequestDispatcher("./LoginMember.jsp");
			// 값을 받아서 이동할 경로를 지정해준다
			rd.forward(request, response);
			// rd에 저장된 경로로 가져갈 값들을 지정
		}
		// 회원가입
		else if (command.equals("JoinMemberAction.do")) {
			requestJoinForm(request);
			RequestDispatcher rd = request.getRequestDispatcher("./LoginResult.jsp?value=1");
			rd.forward(request, response);
		}
		// 이메일 인증
		else if (command.equals("EmailCheck.do")) {
			int num = requestEmailCheck(request);
			PrintWriter pw = response.getWriter();
			pw.write(num + "");
			pw.flush();
			pw.close();
		}
		// 아이디 중복검사
		else if (command.equals("duplicationCheck.do")) {
			String result = requestduplicationCheck(request);
			PrintWriter pw = response.getWriter();
			pw.write(result);
			pw.flush();
			pw.close();
		}
		//비밀번호 조회, 이메일 보내기
		else if (command.equals("SearchData.do")) {
			String result = requestSearchData(request);
			PrintWriter pw = response.getWriter();
			pw.write(result);
			pw.flush();
			pw.close();
		}
		// 비밀번호 변경
		else if (command.equals("UpdatePassword.do")) {
			requestUpdatePassword(request);
			RequestDispatcher rd = request.getRequestDispatcher("./LoginMember.jsp");
			//재설정 후 로그인창으로 보냄
			rd.forward(request, response);
		}
		// 아이디 찾기
		else if (command.equals("findId.do")) {
			requestfindId(request);
			RequestDispatcher rd = request.getRequestDispatcher("./LoginMember.jsp");
			//아이디를 메일로 받은 후 로그인창으로 보냄
			rd.forward(request, response);
		}

	}

	
	/**
	 * 로그인
	 * @param request
	 */
	public void requestLoginForm(HttpServletRequest request) {

		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();

		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		// 입력받은 id, password를 각각 member.setId, member.setPassword에 저장

		String result = dao.login(member.getId(), member.getPassword());

		request.setAttribute("result", result);

	}

	
	/**
	 * 회원가입
	 * @param request
	 */
	public void requestJoinForm(HttpServletRequest request) {

		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();

		member.setId(request.getParameter("id"));
		member.setPassword(request.getParameter("password"));
		member.setName(request.getParameter("name"));
		member.setBirth_date(request.getParameter("birthyy") + "/" + request.getParameter("birthmm") + "/"
				+ request.getParameter("birthdd"));
		member.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));
		member.setPhone(request.getParameter("phone1") + "-" + request.getParameter("phone2") + "-"
				+ request.getParameter("phone3"));

		dao.join(member);
	}


	/**
	 * 아이디 중복검사
	 * @param request
	 * @return
	 */
	public String requestduplicationCheck(HttpServletRequest request) {

		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();

		member.setId(request.getParameter("id"));
		// 입력받은 아이디를 member.setId에 저장

		String result = dao.duplication(member.getId());
		// 조회하여 얻어온 아이디를 result에 저장

		return result;
	}


	/**
	 * 이메일인증 부분
	 * @param request
	 * @return
	 */
	public int requestEmailCheck(HttpServletRequest request) {

		Random random = new Random();

		int num = random.nextInt(10000);

		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
		p.put("mail.smtp.host", "smtp.naver.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 true 고정
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.port", "587"); // 네이버 포트

		String id = "gloveg9@naver.com"; // 네이버 이메일 아이디
		String pw = "0103pencil%"; // 네이버 비밀번호

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pw);
			}
		});

		MimeMessage msg = new MimeMessage(session);

		try {

			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();

			// 이메일 발신자
			from = new InternetAddress("gloveg9@naver.com"); // 발신자 주소
			msg.setFrom(from);

			// 이메일 수신자
			String mail1 = request.getParameter("mail1");
			String mail2 = request.getParameter("mail2");

			String email = mail1 + "@" + mail2;

			InternetAddress to = new InternetAddress(email); // 수신자 주소
			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목
			msg.setSubject("메일 전송 테스트", "UTF-8");

			// 이메일 내용
			msg.setText("인증번호 : " + num, "UTF-8");

			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");

			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}

		return num;
		// 랜덤으로 생성되는 인증번호를 리턴
	}

 
	/**
	 * 비밀번호 찾기
	 * @param request
	 * @return
	 */
	public String requestSearchData(HttpServletRequest request) {

		MemberDAO dao = new MemberDAO();
		MemberDTO member = new MemberDTO();

		member.setId(request.getParameter("id"));
		member.setName(request.getParameter("name"));
		member.setEmail(request.getParameter("mail1") + "@" + request.getParameter("mail2"));

		String result = dao.pwFind(member.getId(), member.getName(), member.getEmail());

		if(result.equals("y")) {
			int num = requestEmailCheck(request);
			
			return num+"";
			//num을 리턴해야 이메일 ajax에서 값을 전달받아 input태그에 반환받은 값을 저장할 수 있다.
		}
		else {
			System.out.println("조회되지 않는 사용자입니다.");
			
			return "";
		}
	}
	


	/**
	 * 비밀번호 재설정
	 * @param request
	 */
	public void requestUpdatePassword(HttpServletRequest request) {
		
		MemberDAO dao = new MemberDAO();
		
		String password = request.getParameter("pwReset");
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("mail1")+"@"+request.getParameter("mail2");
		
		dao.UpdatePassword(password, id, name, email);
	}
	

	/**
	 * 아이디 찾기
	 * @param request
	 * @return
	 */
	public void requestfindId(HttpServletRequest request) {
		
		MemberDAO dao = new MemberDAO();
		
		String name = request.getParameter("name");
		String email = request.getParameter("mail1")+"@"+request.getParameter("mail2");
		
		String result = dao.IdFind(name, email);
		
		
		if(!result.equals("n")) {
			requestEmailId(request);
		}
		else {
			System.out.println("조회되지 않는 사용자입니다.");
		}
	}
	
	
	
	/**
	 * 이메일로 아이디 보내기
	 * @param request
	 * @return
	 */
	public void requestEmailId(HttpServletRequest request) {

		MemberDAO dao = new MemberDAO();
		
		String name = request.getParameter("name");
		String email = request.getParameter("mail1")+"@"+request.getParameter("mail2");
		
		String findId = dao.IdFind(name, email);
				
		Properties p = System.getProperties();
		p.put("mail.smtp.starttls.enable", "true"); // gmail은 true 고정
		p.put("mail.smtp.host", "smtp.naver.com"); // smtp 서버 주소
		p.put("mail.smtp.auth", "true"); // gmail은 true 고정
		p.put("mail.smtp.port", "587"); // 네이버 포트
		p.put("mail.smtp.port", "587"); // 네이버 포트

		String id = "gloveg9@naver.com"; // 네이버 이메일 아이디
		String pw = "0103pencil%"; // 네이버 비밀번호

		// session 생성 및 MimeMessage생성
		Session session = Session.getDefaultInstance(p, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(id, pw);
			}
		});

		MimeMessage msg = new MimeMessage(session);

		try {

			// 편지보낸시간
			msg.setSentDate(new Date());
			InternetAddress from = new InternetAddress();

			// 이메일 발신자
			from = new InternetAddress("gloveg9@naver.com"); // 발신자 주소
			msg.setFrom(from);

			// 이메일 수신자
			InternetAddress to = new InternetAddress(email); // 수신자 주소
			msg.setRecipient(Message.RecipientType.TO, to);

			// 이메일 제목
			msg.setSubject("메일 전송 테스트", "UTF-8");

			// 이메일 내용
			msg.setText("아이디 : " + findId, "UTF-8");

			// 이메일 헤더
			msg.setHeader("content-Type", "text/html");

			// 메일보내기
			javax.mail.Transport.send(msg, msg.getAllRecipients());

		} catch (Exception msg_e) {
			msg_e.printStackTrace();
		}
	}
}
