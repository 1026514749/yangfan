package com.sjmcrf.yangfan.web;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.sjmcrf.yangfan.dto.ActionResult;
import com.sjmcrf.yangfan.util.CustomizedPropertyConfig;
import com.sjmcrf.yangfan.util.ImageUtils;

@Controller
public class CommonController {

	@Autowired
	private CustomizedPropertyConfig config;
	
	@RequestMapping(value="/common/upload.do")
	@ResponseBody
	public ActionResult upload(MultipartFile file,HttpServletRequest request, HttpServletResponse response)
	{
		ActionResult result = new ActionResult(false);
		
		if(file == null||file.isEmpty()){
			result.setMessage("请先选择文件");
			return result;
		}
		String uploadPath = request.getServletContext().getRealPath(config.getContextProperty("upload.path"));
		String newName = ImageUtils.getNewName(file.getOriginalFilename());
		
		File img = ImageUtils.save(uploadPath, newName, file);
		String imgUrl = request.getContextPath()+"/"+config.getContextProperty("upload.path")+"/"+newName;
		
		if(img.exists()){
			result.setSuccess(true);
			result.setObject(imgUrl);
		}else{
			result.setMessage("上传失败");
		}
		return result;
	}

}
