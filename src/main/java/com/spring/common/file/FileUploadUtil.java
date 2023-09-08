package com.spring.common.file;

import java.io.File;
import java.io.IOError;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.spring.client.board.vo.BoardVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class FileUploadUtil {
	
	/*********************************************************************************
	 * 파일 업로드할 폴더 생성
	 *********************************************************************************/
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) {
			return;
		}
		fileDir.mkdirs();
	}
	
	/********************************************************************************
	 * 파일 업로드 메서드 
	 * 파일명이 중복시 해결 방법  
	 * System.currentTimeMillis()를 사용하거나 UUID는 128비트의 수이다. 
	 * 표준 형식에서 UUID는 32개의 16진수로 표현되며 총 36개 문자(32개 문자와 4개의 하이픈)로 
	 * 된 8-4-4-4-12라는 5개의 그룹을 하이픈으로 구분한다. 이를테면 다음과 같다. 
	 * 이때 UUID.randomUUID().toString()를 이용해서 얻는다.
	 * 50e8400-e29b-41d4-a716-446655440000
	 ********************************************************************************/
	public static String fileUpload(MultipartFile file, String fileName) throws IOException{
		log.info("파일업로드 호출");
		
		String real_name = null;
		// MultipartFile 클래스의 getFile() 메서드로 클라이언트가 업로드한 파일
		String org_name = file.getOriginalFilename();
		log.info("업로드 파일명 : " + org_name);
		
		//파일명 변경
		if(org_name !=null && (!org_name.equals(""))) {
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name; //저장할 파일 이름
			
			String docRoot = "D:/Dev/uploadStorage/"+fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot+"/"+real_name);
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd); // 이 메서드에 의해 저장 경로에 실질적으로 File이 생성됨
		}
		return real_name;	// 서버에 저장된 파일명 반환(board_숫자_파일명.확장자)
	}
	
	/********************************************************************************
	 * 파일 삭제 메서드
	 * 이미지 경로 및 파일명: board/board_파일명.jpg
	 * 참고 : fileDelete(String folderName, String fileName)
	 ********************************************************************************/
	public static void fileDelete(String fileName) throws IOException{
		log.info("파일삭제 호출");
		boolean result = false;
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		String docRoot = "d:/Dev/uploadStorage/" + dirName;
		File fileDelete = new File(docRoot+"/"+fileName);
		
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("파일 삭제 확인 : " + result);
	}
}
