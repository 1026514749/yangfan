package com.sjmcrf.yangfan.web;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sjmcrf.yangfan.util.CustomizedPropertyConfig;
import com.sjmcrf.yangfan.util.ImageUtils;

@Controller
public class CkEditorController {

	private DateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
	@Autowired
	private CustomizedPropertyConfig config;
	
	@RequestMapping(value="/ckeditor/uploadImg.do")
	@ResponseBody
	public String uploadImage(MultipartFile upload,String CKEditorFuncNum,HttpServletRequest request){

		String name = upload.getOriginalFilename();
		String type = upload.getContentType();
		
		if(!type.startsWith("image")){
			String result = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",''," + "'必须为图片文件！');</script>";
			return result;
		}
		
		String uploadPath = request.getServletContext().getRealPath(config.getContextProperty("upload.path"));
		String newName = ImageUtils.getNewName(name);
		
		File file = ImageUtils.save(uploadPath, newName, upload);
		
		if(file.exists()){
			String imgUrl = request.getContextPath()+"/upload/"+newName;
			String result = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction("+ CKEditorFuncNum + ",'" + imgUrl + "','');</script>"; 
			return result;
		}else{
			String result = "<script type=\"text/javascript\">window.parent.CKEDITOR.tools.callFunction(" + CKEditorFuncNum + ",''," + "'图片保存失败');</script>";
			return result;
		}
		
	}

}
