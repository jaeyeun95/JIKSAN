package notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import notice.model.service.NoticeService;
import notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeAdminInsertServlet
 */
@WebServlet("/ninsert.ad")
public class NoticeAdminWriteServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "form 의 enctype='multipart/form-data' 속성 누락 되었음. 확인하세요 ");
			view.forward(request, response);
		}
		int maxSize = 1024*1024*10;
		
		String savePath = request.getSession().getServletContext().getRealPath("/resources/notice_files");
		MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());
		
		Notice notice = new Notice();
		notice.setNoticeTitle(mrequest.getParameter("title")); 
		notice.setNoticeWriter(mrequest.getParameter("writer"));
		notice.setNoticeContent(mrequest.getParameter("content"));
		
		String originalFileName = mrequest.getFilesystemName("ofile");
		notice.setNoticeOriginFileName(originalFileName);
		
		if(originalFileName != null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			
			renameFileName += "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			
			File originFile = new File(savePath + "\\" + originalFileName);
			File renameFile = new File(savePath + "\\" + renameFileName);
			
			if(!originFile.renameTo(renameFile)) {
				FileInputStream fin = new FileInputStream(originFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				int data = -1;
				byte[] buffer = new byte[1024];
				
				while((data = fin.read(buffer, 0, buffer.length)) != -1 ) {
					fout.write(buffer, 0, buffer.length);
				}
				fin.close();
				fout.close();
				originFile.delete();
				
			}
			notice.setNoticeRenameFileName(renameFileName);
			
			
		}
		int result = new NoticeService().insertNotice(notice);
		
		if(result > 0 ) {
			response.sendRedirect("/jiksan/nlist");
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "새 공지사항 등록 실패");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
