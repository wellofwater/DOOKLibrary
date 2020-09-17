package com.controller;

import java.io.FileOutputStream;
import org.springframework.web.multipart.MultipartFile;

public class Util {
	// 받아온 데이터를 서버에 이미지를 올린다.
	public static void saveFile(MultipartFile mf) {
		String dir = "C:\\Java\\project_0909_final\\web\\view\\main\\img\\bookimg";
		byte [] data;
		String imgname = mf.getOriginalFilename();
		System.out.println("Image Save ok");
		try {
			data = mf.getBytes();
			FileOutputStream fo = 
					new FileOutputStream(dir+imgname);
			fo.write(data);
			fo.close();
		}catch(Exception e) {
			
		}
		
	}
	
}




