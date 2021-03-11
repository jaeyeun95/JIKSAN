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
 * Servlet implementation class NoticeAdminUpdateServlet
 */
@WebServlet("/nupdate.ad")
public class NoticeAdminUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeAdminUpdateServlet() {
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
		notice.setNoticeNo(Integer.parseInt(mrequest.getParameter("no")));
		notice.setNoticeTitle(mrequest.getParameter("title")); 
		notice.setNoticeWriter(mrequest.getParameter("writer"));
		notice.setNoticeContent(mrequest.getParameter("content"));
		
		String deleteFlag = mrequest.getParameter("deleteFlag");
		String originFilePath = mrequest.getParameter("ofile");
		String renameFilePath = mrequest.getParameter("rfile");
		
		String originalFileName = mrequest.getFilesystemName("upfile");
		
		//수정경우 1. 
		//원래 파일과 새로 업로드된 파일의 이름이 같도,
		//파일 용량도 동일하면 원래 이름 그대로 객체에 기록함
		
		//새로 업로드된 파일의 file 객체 만들기
		File newOriginFile = new File(savePath + "/" + originalFileName);
		//이전 저장된 파일의 file 객체 만들기
		File originFile = new File(savePath + "/" + renameFilePath);
		

		
		//2. 수정경우
		//첨부파일이 없었는데 추가된 경우
		//첨부파일이 있었는데 변경된 경우 둘다 이름 바꾸기
		if(originalFileName != null) {
			
			notice.setNoticeOriginFileName(originalFileName);

			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
			
			renameFileName += "." + originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
			
			File renameFile = new File(savePath + "\\" + renameFileName);
			
			if(!newOriginFile.renameTo(renameFile)) {
				
				FileInputStream fin = new FileInputStream(newOriginFile);
				FileOutputStream fout = new FileOutputStream(renameFile);
				int data = -1;
				byte[] buffer = new byte[1024];
				
				while((data = fin.read(buffer, 0, buffer.length)) != -1 ) {
					fout.write(buffer, 0, buffer.length);
				}
				fin.close();
				fout.close();
				newOriginFile.delete();
				
			}
			
			notice.setNoticeRenameFileName(renameFileName);
			//이전 첨부파일 삭제
			if(originFilePath != null) {
				originFile.delete();
			}
		}else if(originFilePath != null && deleteFlag != null && deleteFlag.equals("yes")) {
			
			notice.setNoticeOriginFileName(null);
			notice.setNoticeRenameFileName(null);
			originFile.delete();
			
		}else if(originFilePath != null && (originalFileName == null || originFilePath.equals(originalFileName)
				&& newOriginFile.length() == originFile.length())) {
			notice.setNoticeOriginFileName(originFilePath);
			notice.setNoticeRenameFileName(renameFilePath);
		}
		
		if(originFilePath == null && originalFileName == null) {
			notice.setNoticeOriginFileName(null);
			notice.setNoticeRenameFileName(null);
			}
		
		System.out.println("nupdate" + notice);
		
		int result = new NoticeService().updateNotice(notice);
		
		if(result > 0 ) {
			response.sendRedirect("/jiksan/nlist");
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", notice.getNoticeNo() + "번 공지사항 수정 등록 실패");
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
