package com.hq.javaee.controller;

import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.hq.javaee.pojo.User;
import com.hq.javaee.service.UserService;
import com.hq.javaee.service.impl.userserviceimpl;
import com.hq.javaee.utils.UUIDUtils;

/*
 * @author <q>
 * 
 * 
 * */
@Controller
public class UserController {
	@Autowired
	private  UserService us;
	@RequestMapping(value="login",method=RequestMethod.POST)
	public  String  login(User user,HttpSession session,Model model){
		Map<String ,Object> map=us.login(user);
		
		if(map!=null&&!map.isEmpty()){
			String result=map.get("result").toString();
			if("success".equals(result)){
				User _user=(User) map.get("user");
				session.setAttribute("user", _user);
				return "myzone";
			}else{
				model.addAttribute("message",result);
				return "login";
			}
	}else{
		model.addAttribute("message","network  error");
		return "login";
	}
}
	@RequestMapping("/regist")
	public  String  regist(User user,Model model){
		
			String  result=us.regist(user);
			
			if("success".equals(result)){
				
				return "/login";
			}else{
				model.addAttribute("message",result);
				return "/regist";
			}
			
	}
	
@RequestMapping("/update")
public  String  updata(User  user,Model model,HttpSession session){
	System.out.println(user.getAddress());
	Map<String,Object> map=us.update(user);
	
	if(map!=null&&!map.isEmpty()){
		
		String  update=map.get("update").toString();
		if("success".equals(update)){
				User  _uer=(User) map.get("user");
				session.setAttribute("user", _uer);
				model.addAttribute("update",update);
				return  "personal_info";
		}else{
			model.addAttribute("update" ,update);
			return "personal_info";
		}
	}else{
		model.addAttribute("update","neterror");
		return "personal_info";
	}
}
@RequestMapping("resetpwd")
public  String update_pwd(User  user,Model model){
	System.out.println(user.getUsername());
	
	 String  result=us.updatebyusername(user);
	 if("success".equals(result)){
		 	return "login";
	 }else{
		 model.addAttribute("message",result);
		 return "resetpwd";
	 }
	 
}
@RequestMapping("modAvatar")
public String modAvatar(HttpServletRequest req, HttpSession session) {
	String randomname=UUIDUtils.getUUID();
	String filename;
	String filetype;
	//文件路径'' 加载到apach里的路径
//	String  filepath=System.getProperty("catalina.base")+File.separatorChar+"wtpwebapps"+File.separatorChar+
//			"41601434_hq_personal_zone"+File.separatorChar+"uploadFile"+File.separatorChar+"avatar"+File.separatorChar;
	
	String filepath = req.getServletContext().getRealPath("/upload");
	
	String filesrc;
	// 转换request对象，解析文件
	MultipartHttpServletRequest multipartRequest =(MultipartHttpServletRequest) req;
	// 获取文件集合
	Map<String,MultipartFile> map=multipartRequest .getFileMap();
	//循环遍历，取出单个文件
	for(Map.Entry<String,MultipartFile>  entry: map.entrySet()){
		//获取单个文件
		MultipartFile mf=entry.getValue();
		filename=mf.getOriginalFilename();
		filetype=filename.substring(filename.indexOf("."));//文件类型
		filepath=filepath+randomname +filetype;
		filesrc = "uploadFile" + File.separatorChar + "avatar" + File.separatorChar + randomname + filetype;
		//创建文件实例
		File  uploadFile=new File(filepath);
		if(uploadFile.exists()){
			uploadFile.delete();
		} try {
        	// 利用spring中的FileCopyUtils.copy()将文件复制
			FileCopyUtils.copy(mf.getBytes(), uploadFile);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("上传出错！");
		}
        User user = (User) session.getAttribute("user");
        user.setAvatar(filesrc);  
        UserService us = new userserviceimpl();
        us.uploadAvatar(user); 
	}
		return "personal_info";
		
	}
	@RequestMapping("friend_info")
	public String  friend(User  user,Model  model){
		
		Map<String,Object> map=us.selectbyusername(user);
		if(map!=null&&!map.isEmpty()){
			String  res=map.get("result").toString();
			if("ok".equals(res)){
				User  fuser=(User) map.get("fuser");
					System.out.println(fuser.getAddress()+"-"+fuser.getEmail()+"-"+fuser.getUsername());
				model.addAttribute("friendinfo",fuser);
				return "display";
			}else{
				model.addAttribute("message",res);
				return "display";
			}
			
		}else{
			model.addAttribute("message","network");
			return "myzone";
		}
		
	}
	@RequestMapping("/download")
	public ResponseEntity<byte[]> download(HttpServletRequest request) throws IOException {
		    File file = new File("C:\\Users\\hq\\Desktop\\猫.jpg");
		    byte[] body = null;
		    InputStream is = new FileInputStream(file);
		    body = new byte[is.available()];
		    is.read(body);
		    HttpHeaders headers = new HttpHeaders();
		    headers.add("Content-Disposition", "attchement;filename=" + file.getName());
		    HttpStatus statusCode = HttpStatus.OK;
		    ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
		    is.close();
		    return entity;
		  
		}
	
	@RequestMapping("fileUpload")
	public String hanldForm(@RequestParam("name") String name,@RequestParam("uploadfile") List<MultipartFile> uploadfile,HttpServletRequest  request){
		if(!uploadfile.isEmpty() && uploadfile.size()>0){
			for(MultipartFile  file:uploadfile){
				String originalFilename=file.getOriginalFilename();
				String dirpath=request.getServletContext().getRealPath("/upload/");
				File  filepath=new File(dirpath);
				if(!filepath.exists()){
					filepath.mkdirs();
				}
			String newFilename=name+"_"+UUID.randomUUID()+"_"+originalFilename;
			try{
				file.transferTo(new File(dirpath+newFilename));
			}catch(Exception e){
				e.printStackTrace();
				return  "error";
			}
			
			}
		return  "success";
		}else{
			return "error";
		}
	}
	
}
	

