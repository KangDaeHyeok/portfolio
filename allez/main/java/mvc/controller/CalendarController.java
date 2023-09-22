package mvc.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.ReserveDAO;
import mvc.model.ReserveDTO;

public class CalendarController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request, response);
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	//한글 깨짐 방지
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println("RequestURI : "+RequestURI);
		System.out.println("command : "+command);
		
		String viewPage = null; // 이동시킬 페이지를 넣을 변수를 미리 생성
		
		
		if(command.equals("/reserve.cal")) { // 예약하기 요청이 들어온다면
			reserveCommand(request, response);
			
			viewPage="/reserve/test_drive.jsp";
			
		} else if(command.equals("/reserveList.cal")) { // 예약 내역을 보여달라는 요청이 들어온다면
			reserveListCommand(request, response);	
			
			viewPage="/reserve/reserveList.jsp"; // reserveList 페이지로 이동
			
		} else if(command.equals("/delete.cal")) { // 예약 내역을 보여달라는 요청이 들어온다면
			deleteCommand(request, response);	
			
			viewPage="reserveList.cal"; // reserveList 페이지로 이동
		}
		
		
		// RequestDispatcher : 사용자의 요청을 받아서 페이지를 이동시키는 기능을 가진 클래스
		System.out.println("viewPage :"+viewPage);
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		
		// 뷰페이지에 들어있던 요청과 응답을 해당 뷰로 forwarding -> 예외 처리or전가 필수 메소드
		dispatcher.forward(request, response);
	}
    
    
    public void reserveCommand(HttpServletRequest request, HttpServletResponse response) {
    	String id = request.getParameter("id");
    	String car_name = request.getParameter("car_name");
    	String place = request.getParameter("place");
    	String drive_date = request.getParameter("drive_date");
    	String drive_time = request.getParameter("drive_time");
    	String image_url = request.getParameter("image_url");
    	
    	ReserveDAO dao = ReserveDAO.getInstance();
    	boolean check = dao.checkReserve(place, drive_date, drive_time);
    	
    	if(!check) {
    		dao.addReserve(id, car_name, place, drive_date, drive_time, image_url);
    		dao.updateReserve(place, drive_date, drive_time);
    		
    		request.setAttribute("result", "success");
    		
    	} else {
    		request.setAttribute("result", "fail");
    	}
    	
    }
    
    // 시승 예약 내역을 불러오는 메소드
    public void reserveListCommand(HttpServletRequest request, HttpServletResponse response) {
    	String id = request.getParameter("id");
    	
    	ReserveDAO dao = ReserveDAO.getInstance();
    	
    	List<ReserveDTO> list = dao.list(id);
    	
    	request.setAttribute("reserveList", list);
    }
    
    
    // 시승 예약 내역을 삭제하는 메소드
    public void deleteCommand(HttpServletRequest request, HttpServletResponse response){
    	String num = request.getParameter("num");
    	String id = request.getParameter("id");
    	
    	ReserveDAO dao = ReserveDAO.getInstance();
		dao.delete(num);	
    }

}


