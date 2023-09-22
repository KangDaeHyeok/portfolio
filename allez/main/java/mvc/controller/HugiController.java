package mvc.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import mvc.model.CarDTO;
import mvc.model.HugiDAO;
import mvc.model.HugiDTO;

public class HugiController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	static final int LISTCOUNT = 5;	//게시판 글이 한페이지에 몇개씩 보여질지 상수로 설정
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		// 프로젝트 path~파일명.확장자 가져옴 => 예시)/allez/admin/AddCar.jsp
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(contextPath.length());
		
		System.out.println(command);
		// AddCar.jsp 를 가져옴
		
		
	
		//db에 저장된 모델출력
		if(command.equals("/selectbox.hg")) {
			JSONArray result = requestSelectBox(request);
			//json 생성
			
			PrintWriter pw = response.getWriter();
			pw.write(result.toString());
			pw.flush();
			pw.close();
		}
		else if(command.equals("/write.hg")) {
			requestwrite(request);
			response.sendRedirect("./Hugi_List.hg");
		}
		else if(command.equals("/Hugi_List.hg")) {
			requestlist(request);
			RequestDispatcher rd = request.getRequestDispatcher("/hugi/Hugi_List.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/getWriteInfo.hg")) {
			requestgetWriteInfo(request);
			RequestDispatcher rd = request.getRequestDispatcher("/hugi/Hugi_View.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/update.hg")) {
			requestupdate(request);
			response.sendRedirect("./Hugi_List.hg");
		}
		else if(command.equals("/delete.hg")) {
			requestdelete(request);
			response.sendRedirect("./Hugi_List.hg");
		}
	}
	
	/**
	 * db에 저장된 모델출력(selectbox)
	 * @param request
	 * @return
	 */
	public JSONArray requestSelectBox(HttpServletRequest request) {
		
		JSONObject obj = new JSONObject(); //JSON 객체 생성
		JSONArray ja = new JSONArray(); //JSON 배열 생성
		HugiDAO dao = new HugiDAO();
		ArrayList<CarDTO> list = dao.SelectBox();
		
		 for (int i = 0; i < list.size(); i++){//배열
			JSONObject so = new JSONObject();//배열 내에 들어갈 json
			so.put("carname", list.get(i).getCarname());
			
			ja.add(so);
		 }
		return ja;
	}
	
	
	/**
	 * 시승후기 글 작성
	 * @param request
	 */
	public void requestwrite(HttpServletRequest request) {
		
		String id = request.getParameter("id_hidden");
		String title = request.getParameter("title");
		String carname = request.getParameter("carname");
		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));
		
		HugiDAO dao = new HugiDAO();
		
		dao.write(id, carname, title, content, star);
	}
	
	
	/**
	 * 게시판 리스트 출력
	 * @param request
	 */
	public void requestlist(HttpServletRequest request) {
		
		HugiDAO dao = new HugiDAO();
		
		int pageNum = 1;//페이지의 수를 나타냄(1페이지, 2페이지)
		int limit = LISTCOUNT;//5라는 상수를 limit 변수에 저장
		
		if(request.getParameter("pageNum") != null) {//페이지 번호가 있다면
			pageNum = Integer.parseInt(request.getParameter("pageNum")); 
			//정수형에 저장 => menu 네비에서 게시판 링크를 클릭하면 처음에 pageNum=1을 매개변수로 가져옴
			
		}
		
		String search_item = request.getParameter("search_item");
		String search_text = request.getParameter("search_text");
		
		System.out.println(search_item);
		System.out.println(search_text);
		
		int total_record = dao.getListCount(search_item, search_text);
		//옵션별로 검색한 단어와 관련된 레코드의 갯수를 리턴해서 total_record에 저장
		
		int value = (int) Math.ceil((double)(total_record)/(double)(limit));
		
		
		ArrayList<HugiDTO> list = dao.list(pageNum, limit, search_item, search_text);
		
		request.setAttribute("list", list);
		request.setAttribute("value", value);
		request.setAttribute("pageNum", pageNum);
	}
	
	
	/**
	 * 게시판 작성한 글 불러오기
	 * @param request
	 */
	public void requestgetWriteInfo(HttpServletRequest request) {
		
		HugiDAO dao = new HugiDAO();
		HugiDTO dto = new HugiDTO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dto = dao.getWriteInfo(num);
		dao.count(num);
		
		request.setAttribute("dto", dto);
	}
	
	
	/**
	 * 본인이 작성한 게시물 수정
	 * @param request
	 */
	public void requestupdate(HttpServletRequest request) {
		
		HugiDAO dao = new HugiDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String star = request.getParameter("star");
		
		dao.update(title, content, star, num);
	}
	
	
	/**
	 * 게시물 삭제
	 * @param request
	 */
	public void requestdelete(HttpServletRequest request) {
		
		HugiDAO dao = new HugiDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		dao.delete(num);
	}
}
