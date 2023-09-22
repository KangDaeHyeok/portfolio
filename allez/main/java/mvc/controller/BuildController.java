package mvc.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.model.BoardDAO;
import mvc.model.BuildDAO;
import mvc.model.BuildDTO;
import mvc.model.ReserveDAO;

	
/* HttpServlet 을 상속받는 BoardController 클래스 생성 */
public class BuildController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	static final int LISTCOUNT = 10; //게시판 글이 한 페이지에 몇개씩 보여질지 상수로 설정
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Pragma", "once"); // Pragma : 전처리구문의 하나로 컴파일러에게 한번만 컴파일 명령
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(15);
		if(command.equals("ist.bu")||command.equals("uildList.bu") || command.equals("elete.bu")) {
			command = RequestURI.substring(13);
		}
		
		System.out.println("RequestURI : "+RequestURI);
		System.out.println("contextPath : "+contextPath);
		System.out.println("command : "+command);
		
		
		
		if(command.equals("/BuildList.bu")){
			System.out.println("info 전");
			buildListInfo(request);
			System.out.println("info 후");
			RequestDispatcher rd = request.getRequestDispatcher("/buildCar/buildListInfo.jsp");
			rd.forward(request, response);
			
		}else if(command.equals("/BuildAdd.bu")) {
			System.out.println("listCheck 전");
			listCheck(request);
			System.out.println("listCheck 후");
			
			/*
			 * System.out.println("buildInsert 전");
			 * buildInsert(request);
			 * System.out.println("buildInsert 후");
			 */
			
			System.out.println("buildList 전");
			buildList(request);
			System.out.println("buildList 후");
			RequestDispatcher rd = request.getRequestDispatcher("../buildCar/buildList.jsp");
			rd.forward(request, response);
			
		} else if(command.equals("/Delete.bu")){ // 선택 내용 삭제하기
			System.out.println("infoDelete 전");
			infoDelete(request);
			System.out.println("infoDelete 후");
			System.out.println("buildList 전");
			buildList(request);
			System.out.println("buildList 후");
			
			RequestDispatcher rd = request.getRequestDispatcher("../buildCar/buildList.jsp");
			rd.forward(request, response);
			
		} else if(command.equals("/List.bu")){ 
			System.out.println("buildList 전");
			buildList(request);
			System.out.println("buildList 후");
			RequestDispatcher rd = request.getRequestDispatcher("/buildCar/buildList.jsp");
			rd.forward(request, response);
		}
	}
	
	
	
	public void buildList(HttpServletRequest request) {
		BuildDAO dao = BuildDAO.getInstance();
		List<BuildDTO> buildList = new ArrayList<>();
		
		String id = request.getParameter("id");
		
		/* System.out.println("id : "+id); */
		
		buildList = dao.getBuildList(id,null);
		
		request.setAttribute("buildList", buildList);
		
	}
	
	public void buildListInfo(HttpServletRequest request) {
		BuildDAO dao = BuildDAO.getInstance();
		List<BuildDTO> info = new ArrayList<>();
		
		String id = request.getParameter("id");
		String num = request.getParameter("listNum");
		int listNum = Integer.parseInt(num);
		
		/* System.out.println("id : "+id); */
		
		info = dao.getBuildList(id, num);
		
		request.setAttribute("info", info);
		request.setAttribute("listNum", listNum);
		
	}
	 

	/*
	 * public void buildInsert(HttpServletRequest request) { BuildDAO dao =
	 * BuildDAO.getInstance(); BuildDTO build = new BuildDTO();
	 * 
	 * Date nowDate = new Date(); SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyy-MM-dd");
	 * 
	 * build.setUesr_id(request.getParameter("id"));
	 * build.setCarname(request.getParameter("carname"));
	 * build.setEngine(request.getParameter("engine"));
	 * build.setTrim(request.getParameter("trim"));
	 * build.setTransmission(request.getParameter("transmission"));
	 * build.setCarPrice(request.getParameter("carPrice"));
	 * build.setIn_color(request.getParameter("inColor"));
	 * build.setInColor_image(request.getParameter("inColorImgFile"));
	 * build.setOut_color(request.getParameter("outColor"));
	 * build.setOutColor_image(request.getParameter("outColorImgFile"));
	 * build.setCar_image(request.getParameter("carImgFile"));
	 * build.setRegion(request.getParameter("region"));
	 * build.setWarehouse(request.getParameter("warehouse"));
	 * build.setOptionName(request.getParameter("optionName"));
	 * build.setOptionPrice(request.getParameter("optionPrice"));
	 * build.setConsignment(request.getParameter("consignment"));
	 * build.setCashWay(request.getParameter("cashWay"));
	 * build.setPrepayment(request.getParameter("prepayment"));
	 * build.setInstallmentPrincipal(request.getParameter("installmentPrincipal"));
	 * build.setMonthPeriod(request.getParameter("monthPeriod"));
	 * build.setPayInstallments(request.getParameter("payInstallments"));
	 * build.setLogtime(sdf.format(nowDate));
	 * 
	 * dao.InsertBuild(build); }
	 */
	
	public void infoDelete(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("listNum"));
		
		BuildDAO dao =  BuildDAO.getInstance();
		
		dao.deleteListInfo(num);
	}

	
	public void listCheck(HttpServletRequest request) {
    	String id = request.getParameter("id");
    	
    	BuildDAO dao = BuildDAO.getInstance();
		BuildDTO build = new BuildDTO();
		
		Date nowDate =  new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    	
    	boolean check = dao.checkBuild(id);
    	
    	if(check) {
    		System.out.println("if check : "+check);
    		
    		build.setUesr_id(request.getParameter("id"));
    		build.setCarname(request.getParameter("carname"));
    		build.setEngine(request.getParameter("engine"));
    		build.setTrim(request.getParameter("trim"));
    		build.setTransmission(request.getParameter("transmission"));
    		build.setCarPrice(request.getParameter("carPrice"));
    		build.setIn_color(request.getParameter("inColor"));
    		build.setInColor_image(request.getParameter("inColorImgFile"));
    		build.setOut_color(request.getParameter("outColor"));
    		build.setOutColor_image(request.getParameter("outColorImgFile"));
    		build.setCar_image(request.getParameter("carImgFile"));
    		build.setRegion(request.getParameter("region"));
    		build.setWarehouse(request.getParameter("warehouse"));
    		build.setOptionName(request.getParameter("optionName"));
    		build.setOptionPrice(request.getParameter("optionPrice"));
    		build.setConsignment(request.getParameter("consignment"));
    		build.setCashWay(request.getParameter("cashWay"));
    		build.setPrepayment(request.getParameter("prepayment"));
    		build.setInstallmentPrincipal(request.getParameter("installmentPrincipal"));
    		build.setMonthPeriod(request.getParameter("monthPeriod"));
    		build.setPayInstallments(request.getParameter("payInstallments"));
    		build.setLogtime(sdf.format(nowDate));
    		
    		dao.InsertBuild(build);
    		
    		request.setAttribute("result", "success");
    		
    	} else {
    		System.out.println("else check : "+check);
    		
    		request.setAttribute("result", "fail");
    	}
    	
    }
	
}
