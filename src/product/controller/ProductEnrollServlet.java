package product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import product.model.service.ProductService;
import product.model.vo.Option;
import product.model.vo.OptionType;
import product.model.vo.Product;


/**
 * Servlet implementation class ProductEnrollServlet
 */
@WebServlet("/product/enroll")
public class ProductEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/productEnroll/productEnrollView.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// enctype이 multipart/form-data로 전송 되었는지 확인
	      if(!ServletFileUpload.isMultipartContent(request)) {
	         request.setAttribute("msg", "잘못 된 전송입니다");
	         request.getRequestDispatcher("/WEB-INF/views/common/errorpage.jsp").forward(request, response);
	         return;
	      }
	      
	      // cos.jar 라이브러리 추가

	      // 1. 전송 파일 용량 제한 : 10Mbyte 제한
	      int maxSize = 1024*1024*10;
	      
	      // 2. 웹  서버 컨테이너 경로 추출
	      String root = request.getSession().getServletContext().getRealPath("/");
	      System.out.println(root);
	      
	      // 3. 파일 실제 저장 경로 
	      String savePath = root + "resources\\uploadFiles\\product\\";
	      
	      // HttpServletRequest => MultipartRequest 변경
	      MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

	      // -----------------------------------------------------------------------------------------------------------------

	      Enumeration files = multi.getFileNames(); 
	      String fname1 = (String) files.nextElement(); 
	      String fname2 = (String) files.nextElement();
	      String pImg = multi.getFilesystemName(fname2);
		  String pDetail = multi.getFilesystemName(fname1);
		  
		  
	      int cNo = Integer.parseInt(multi.getParameter("category"));
	      String pName = multi.getParameter("title");
	      int pPrice = Integer.parseInt(multi.getParameter("price"));
	      
	      String[] opType = multi.getParameterValues("opType");
	      
	      List<String> optionTypeList = new ArrayList<>();
	      List<Option> optionList = new ArrayList<>();
	      
	      if(opType != null) {
	    	  for(String str : opType){
	              if(!optionTypeList.contains(str)) {	// optionType 중복 제거
	            	  optionTypeList.add(str);
	              }
	          }	
	      }
	      
	      String[] opName = multi.getParameterValues("opName");
	      String[] arr = multi.getParameterValues("opPrice");		// Values는 String 타입으로만 받아올 수 있으므로 받아와서 형변환 처리
	      int[] opPrice = null;
	      if(arr != null) {
	    	  opPrice = new int[arr.length];
	    	  for(int i = 0; i < opPrice.length; i++) {
	    		  opPrice[i] = Integer.parseInt(arr[i]);
	    	  }
	      }
	      
	      if(opName != null && opPrice != null) {
	    	  for(int i = 0; i < opName.length; i++) {
	    		  	Option o = new Option();
		    		o.setOptionName(opName[i]);
		    		o.setOptionPrice(opPrice[i]);
		    		optionList.add(o);
		    	} 
	      }
	      
	      Product p = new Product(cNo, pName, pImg, pPrice, optionTypeList, optionList, pDetail);
	      
	      int result = new ProductService().insertProduct(p);
	      System.out.println(result);
	      System.out.println(p);
	      if(result > 0) {
	    	  response.sendRedirect(request.getContextPath() + "/product/list");
	      } else {
	    	  request.setAttribute("msg", "상품 등록에 실패하였습니다.");
	    	  request.getRequestDispatcher("WEB/INF/views/common/errorpage.jsp").forward(request, response);
	      }
	}
}
