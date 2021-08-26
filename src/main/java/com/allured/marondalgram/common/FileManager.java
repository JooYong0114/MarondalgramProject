package com.allured.marondalgram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManager {

	private final String FILE_UPLOAD_PATH = "C:\\Users\\이주용\\Desktop\\fileUpload\\images/";
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public String saveFile(int userId,
			MultipartFile file) {
		
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		File directory = new File(filePath);
		
		if(directory.mkdir() == false) {
			logger.error("[FileManger saveFile] 디렉토리 생성 실패");
			return null;
		}
		
		byte[] bytes;
		try {
			bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			logger.error("[FileManger saveFile] 파일 생성 실패");
			e.printStackTrace();
		}
		
		return "/images/" + directoryName + file.getOriginalFilename();
	}
}
