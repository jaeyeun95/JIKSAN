package disease.controller;

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

import disease.model.service.DiseaseService;
import disease.model.vo.Disease;

/**
 * Servlet implementation class DisAdminInsertServlet
 */
@WebServlet("/dinsert.ad")
public class DisAdminWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisAdminWriteServlet() {
    	super();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 관리자용 공지사항 등록 처리용 컨트롤러
		//multipart 방식으로 인코딩되어 전송온 폼 데이터를 처리하는 클래스가 
		//JAVA EE 에서 제공되지 않음 => 외부 라이브러리를 가져다 써야 함
		//즉, HTTP 프로토콜로 파일을 서버로 업로드하는 기능을 가진 클래스를 말함
		//예 : cos.jar, commons_fileUpload.jar 등
		//WEB-INF/lib 폴더에 복사해 넣음
		
		//1. multipart 방식으로 인코딩되어서 전송되었는지 확인함
		RequestDispatcher view = null;
		if(!ServletFileUpload.isMultipartContent(request)) {
			//multipart 로 파일업로드 처리가 안 되었다면
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", 
					"form의 enctype='multipart/form-data' 속성 누락되었음. 확인하세요.");
			view.forward(request, response);
		}
		
		//2. 업로드할 파일의 용량 제한 설정 : 10Mbyte 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//3. 업로드되는 파일의 저장 폴더 지정하기
		String savePath = request.getSession().getServletContext()
				.getRealPath("/resources/disease_files");
		
		//4. request를 MultipartRequest 로 변환해야 함
		//cos.jar 가 제공하는 클래스를 사용함
		//자동으로 지정한 폴더에 파일이 저장됨(업로드 완료됨)
		MultipartRequest mrequest = new MultipartRequest(
				request, savePath, maxSize, "UTF-8", 
				new DefaultFileRenamePolicy());
		
		//5. 전송 온 값 꺼내서 변수 또는 VO 객체에 기록 저장
		//주의 : mrequest 로 추출해야 함 (request 로는 값 추출 안 됨, null 임)
		Disease disease = new Disease();
		/*disease.setDiseaseNo(mrequest.getParameter(""))*/
		disease.setDiseaseNm(mrequest.getParameter("diseaseNm"));
		disease.setDeptNo(Integer.parseInt(mrequest.getParameter("deptNo")));
		disease.setReservable(mrequest.getParameter("reservable").charAt(0));
		
		disease.setSect01(mrequest.getParameter("sect01"));
		disease.setText01(mrequest.getParameter("text01"));		
		String ogFile1 = mrequest.getFilesystemName("pic01");		//서버에 업로드된 파일명 추출하기
			if(ogFile1 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
				renameFileName += "." + ogFile1.substring(	ogFile1.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
				File originFile = new File(savePath + "\\" + ogFile1); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
				File renameFile = new File(savePath + "\\" + renameFileName);
			if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
				//직접 바꾸는 코드 작성함
				FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
				FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
				int data = -1;
				byte[] buffer = new byte[1024];
					while((data = fin.read(buffer, 0, buffer.length)) != -1) {
					fout.write(buffer, 0, buffer.length);
				}
				fin.close();
				fout.close();
				originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
			}  // file rename failed...
			disease.setPic01(renameFileName);			
		}  // upload file rename...
			
			
			disease.setSect02(mrequest.getParameter("sect02"));
			disease.setText02(mrequest.getParameter("text02"));		
			String ogFile2 = mrequest.getFilesystemName("pic02");		//서버에 업로드된 파일명 추출하기
				if(ogFile2 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
					SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
					String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
					renameFileName += "." + ogFile2.substring(	ogFile2.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
					File originFile = new File(savePath + "\\" + ogFile2); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
					File renameFile = new File(savePath + "\\" + renameFileName);
				if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
					//직접 바꾸는 코드 작성함
					FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
					FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
					int data = -1;
					byte[] buffer = new byte[1024];
						while((data = fin.read(buffer, 0, buffer.length)) != -1) {
						fout.write(buffer, 0, buffer.length);
					}
					fin.close();
					fout.close();
					originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
				}  // file rename failed...
				disease.setPic02(renameFileName);			
			}  // upload file rename...
			
				
				disease.setSect03(mrequest.getParameter("sect03"));
				disease.setText03(mrequest.getParameter("text03"));		
				String ogFile3 = mrequest.getFilesystemName("pic03");		//서버에 업로드된 파일명 추출하기
					if(ogFile3 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
						SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
						String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
						renameFileName += "." + ogFile3.substring(	ogFile3.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
						File originFile = new File(savePath + "\\" + ogFile3); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
						File renameFile = new File(savePath + "\\" + renameFileName);
					if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
						//직접 바꾸는 코드 작성함
						FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
						FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
						int data = -1;
						byte[] buffer = new byte[1024];
							while((data = fin.read(buffer, 0, buffer.length)) != -1) {
							fout.write(buffer, 0, buffer.length);
						}
						fin.close();
						fout.close();
						originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
					}  // file rename failed...
					disease.setPic03(renameFileName);			
				}  // upload file rename...
			
					disease.setSect04(mrequest.getParameter("sect04"));
					disease.setText04(mrequest.getParameter("text04"));		
					String ogFile4 = mrequest.getFilesystemName("pic04");		//서버에 업로드된 파일명 추출하기
						if(ogFile4 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
							SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
							String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
							renameFileName += "." + ogFile4.substring(	ogFile4.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
							File originFile = new File(savePath + "\\" + ogFile4); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
							File renameFile = new File(savePath + "\\" + renameFileName);
						if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
							//직접 바꾸는 코드 작성함
							FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
							FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
							int data = -1;
							byte[] buffer = new byte[1024];
								while((data = fin.read(buffer, 0, buffer.length)) != -1) {
								fout.write(buffer, 0, buffer.length);
							}
							fin.close();
							fout.close();
							originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
						}  // file rename failed...
						disease.setPic04(renameFileName);			
					}  // upload file rename...
			
						disease.setSect05(mrequest.getParameter("sect05"));
						disease.setText05(mrequest.getParameter("text05"));		
						String ogFile5 = mrequest.getFilesystemName("pic05");		//서버에 업로드된 파일명 추출하기
							if(ogFile5 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
								SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
								String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
								renameFileName += "." + ogFile5.substring(	ogFile5.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
								File originFile = new File(savePath + "\\" + ogFile5); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
								File renameFile = new File(savePath + "\\" + renameFileName);
							if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
								//직접 바꾸는 코드 작성함
								FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
								FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
								int data = -1;
								byte[] buffer = new byte[1024];
									while((data = fin.read(buffer, 0, buffer.length)) != -1) {
									fout.write(buffer, 0, buffer.length);
								}
								fin.close();
								fout.close();
								originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
							}  // file rename failed...
							disease.setPic05(renameFileName);			
						}  // upload file rename...			
			
							disease.setSect06(mrequest.getParameter("sect06"));
							disease.setText06(mrequest.getParameter("text06"));		
							String ogFile6 = mrequest.getFilesystemName("pic06");		//서버에 업로드된 파일명 추출하기
								if(ogFile6 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
									SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
									String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
									renameFileName += "." + ogFile6.substring(	ogFile6.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
									File originFile = new File(savePath + "\\" + ogFile6); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
									File renameFile = new File(savePath + "\\" + renameFileName);
								if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
									//직접 바꾸는 코드 작성함
									FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
									FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
									int data = -1;
									byte[] buffer = new byte[1024];
										while((data = fin.read(buffer, 0, buffer.length)) != -1) {
										fout.write(buffer, 0, buffer.length);
									}
									fin.close();
									fout.close();
									originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
								}  // file rename failed...
								disease.setPic06(renameFileName);			
							}  // upload file rename...			
			
								disease.setSect07(mrequest.getParameter("sect07"));
								disease.setText07(mrequest.getParameter("text07"));		
								String ogFile7 = mrequest.getFilesystemName("pic07");		//서버에 업로드된 파일명 추출하기
									if(ogFile7 != null) { 	//첨부파일이 있을 때만 파일 이름바꾸기를 실행함 //저장 폴더에 같은 이름의 파일이 있을 경우를 대비하기 위함
										SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
										String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis()));
										renameFileName += "." + ogFile7.substring(	ogFile7.lastIndexOf(".") + 1);//업로드된 파일의 확장자를 추출해서, 새 파일명에 붙임
										File originFile = new File(savePath + "\\" + ogFile7); //저장된 원본파일명을 rename 하기 위해 File 객체 만듦
										File renameFile = new File(savePath + "\\" + renameFileName);
									if(!originFile.renameTo(renameFile)) {  //파일 이름바꾸기 실패했다면
										//직접 바꾸는 코드 작성함
										FileInputStream fin = new FileInputStream(originFile);				//업로드된 원본 파일(originFile)의 내용을 읽어서(read), 
										FileOutputStream fout = new FileOutputStream(renameFile);	//renameFile 에 기록함(write)
										int data = -1;
										byte[] buffer = new byte[1024];
											while((data = fin.read(buffer, 0, buffer.length)) != -1) {
											fout.write(buffer, 0, buffer.length);
										}
										fin.close();
										fout.close();
										originFile.delete(); //원본 파일 삭제함	//originFile 삭제함		
									}  // file rename failed...
									disease.setPic07(renameFileName);			
								}  // upload file rename...						
		
						disease.setDiseaseAltNm(mrequest.getParameter("diseaseAltNm"));	
									
									
									
		//6. 모델의 서비스 객체 생성하고, 메소드 실행하고 결과받기
		int result = new DiseaseService().insertDisease(disease);
		
		//7. 받은 결과를 가지고 성공/실패에 대한 뷰를 선택해서 내보냄
		if(result > 0) {  //공지글 등록이 성공했다면
			response.sendRedirect("/jiksan/dlist");
		}else {
			view = request.getRequestDispatcher("views/common/error.jsp");
			request.setAttribute("message", "새 공지사항 등록 실패!");
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
