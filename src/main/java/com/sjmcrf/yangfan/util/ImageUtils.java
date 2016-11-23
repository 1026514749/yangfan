package com.sjmcrf.yangfan.util;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

public class ImageUtils {

	private static DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	
	// TODO Auto-generated constructor stub
	public static File save(String path,String name,MultipartFile file){
		File img = new File(path, name);
		
		InputStream is = null;
		OutputStream os = null;
		try {
			is = file.getInputStream();
			os = new FileOutputStream(img);     
			byte[] buffer = new byte[1024];     
			int length = 0;  
			while ((length = is.read(buffer)) > 0) {     
			    os.write(buffer, 0, length);     
			}
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally{
			try {
				is.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}  
			try {
				os.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return img;	
	}
	public static String getNewName(String name){
		int index = name.lastIndexOf(".");
		String type = "";
		if(index>=0){
			type = name.substring(index);
		}
		return df.format(new Date())+type;
		
	}

}
