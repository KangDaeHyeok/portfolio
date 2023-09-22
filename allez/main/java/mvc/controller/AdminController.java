package mvc.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.MultipartParser;

import mvc.model.CarDAO;
import mvc.model.CarDTO;

public class AdminController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI(); 
		String contextPath = request.getContextPath(); 
		String command = RequestURI.substring(12);
		
		System.out.println("RequestURI : "+RequestURI);
		System.out.println("contextPath : "+contextPath);
		System.out.println("command : "+command);
	
		//모델 등록
		if(command.equals("/AddCar.ad")) {
			requestAddCar(request);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/AddCar.jsp"); //메소드 실행 후 processCar.jsp로 보냄
			rd.forward(request, response);
		}
		else if(command.equals("/index.ad")) {
			RequestDispatcher rd = request.getRequestDispatcher("/index.jsp");
			rd.forward(request, response);
		}
		else if(command.equals("/getInfo.ad")) {
			requestgetInfo(request);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/UpdateCar.jsp"); //메소드 실행 후 UpdateCar.jsp로 보냄
			rd.forward(request, response);
		}
		else if(command.equals("/UpdateCar.ad")) {
			requestUpdateCar(request);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/Admin_ev_models.jsp?edit=update");
			//메소드 실행 후 Admin_ev_models.jsp로 보내고, update 파라미터 값을 가져감
			rd.forward(request, response);
		}
		else if(command.equals("/DeleteCar.ad")) {
			requestDeleteCar(request);
			RequestDispatcher rd = request.getRequestDispatcher("/admin/Admin_ev_models.jsp?edit=delete");
			//메소드 실행 후 Admin_ev_models.jsp로 보내고, delete 파라미터 값을 가져감
			rd.forward(request, response);
		}
		
		
	}
	
	
	
	/**
	 * 모델 등록
	 * @param request
	 * @throws IOException
	 */
	public void requestAddCar(HttpServletRequest request) throws IOException {
		
		ServletContext application = request.getServletContext();			
		String filename = "";
		String realFolder = application.getRealPath("/resources/images/");
		System.out.println(realFolder);
		
		
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String carImage = multi.getFilesystemName(fname);
		
		CarDAO dao = new CarDAO();

		String carModel = multi.getParameter("carModel");
		String carName = multi.getParameter("carName");
		String price = multi.getParameter("price");

		
		
		dao.AddCar(carModel, carName, price, carImage);
	}
	
	/**
	 * 모델 수정 데이터 조회
	 * @param request
	 */
	public void requestgetInfo(HttpServletRequest request) {
		
		CarDAO dao = new CarDAO();
		CarDTO dto = new CarDTO();
		
		String carName = request.getParameter("carname");
		
		dto = dao.getInfo(carName);
		
		request.setAttribute("dto", dto);
	}
	
	
	/**
	 * 모델 수정
	 * @param request
	 * @throws IOException
	 */
	public void requestUpdateCar(HttpServletRequest request) throws IOException {
		
		ServletContext application = request.getServletContext();			
		String filename = "";
		String realFolder = application.getRealPath("/resources/images/");
		String encType = "utf-8";
		int maxSize = 5 * 1024 * 1024;
		
		MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType);
		
		Enumeration files = multi.getFileNames();
		String fname = (String) files.nextElement();
		String carImage = multi.getFilesystemName(fname);
		
		CarDAO dao = new CarDAO();

		String carModel = multi.getParameter("carModel"); //모델 종류
		String carName = multi.getParameter("carName"); //수정될 모델 이름
		String carNameOrigin = multi.getParameter("carNameOrigin"); //원래 모델 이름
		String price = multi.getParameter("price"); //모델 가격

		
		
		dao.UpdateCar(carModel, carName, price, carImage, carNameOrigin);
	}
	
	
	
	/**
	 * 모델 삭제
	 * @param request
	 */
	public void requestDeleteCar(HttpServletRequest request){
		
		CarDAO dao = new CarDAO();
		
		String carName = request.getParameter("carname");
		
		dao.DeleteCar(carName);
	}
}
