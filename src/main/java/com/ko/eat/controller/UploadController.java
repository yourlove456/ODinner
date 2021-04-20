package com.ko.eat.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ko.eat.service.UploadFileService;
import com.ko.eat.vo.UploadFileVO;



@Controller
@RequestMapping("/up/*")
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Autowired
	UploadFileService imageService;
	
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public String home() {
		return "/upload/index";
	}
	
	@RequestMapping(value="/upload/new", method=RequestMethod.GET)
	public String uploadFile() {
		logger.info("업로드 겟");
		return "redirect:/up/upload/list";
	}
	
	@RequestMapping(value="/upload/new", method=RequestMethod.POST)
	public String uploadFile(@RequestParam MultipartFile file, RedirectAttributes redirectAttrs) {
		logger.info(file.getOriginalFilename());
		try{
			if(file!=null && !file.isEmpty()) {
				String dir="/images";
				logger.info("/upload : " + file.getOriginalFilename());
				UploadFileVO newFile = new UploadFileVO();
				newFile.setDirectoryName(dir);
				newFile.setFileName(file.getOriginalFilename());
				newFile.setFileSize(file.getSize());
				newFile.setFileContentType(file.getContentType());
				newFile.setFileData(file.getBytes());
				logger.info("/upload : " + newFile.toString());

				imageService.uploadFile(newFile);
			}
//			redirectAttrs.addFlashAttribute("dir", dir);
		}catch(Exception e){
			e.printStackTrace();
			redirectAttrs.addFlashAttribute("message", e.getMessage());
		}
		logger.info("/upload/new =====> redirect:/up/upload/list ");
		return "redirect:/";//+dir;
	}
	
	@RequestMapping("/upload/gallery")
	public String getFileList(@RequestParam(value="dir", required=false, defaultValue="/images")String dir, Model model) {
		model.addAttribute("fileList", imageService.getImageList(dir));
		return "/upload/gallery";
	}
	
	@RequestMapping("/upload/list")
	public String getImageList(Model model) {
		model.addAttribute("fileList", imageService.getAllFileList());
		return "home";
	}

	@RequestMapping("/upload/list/{dir}")
	public String getFileListByDir(@PathVariable String dir, Model model) {
		model.addAttribute("fileList", imageService.getFileList("/"+dir));
		return "home";
	}
	
	@RequestMapping("/img/{fileId}")
	public ResponseEntity<byte[]> getImageFile(@PathVariable int fileId) {
		UploadFileVO file = imageService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		if(file != null) {
			logger.info("getFile 무야호 " + file.toString());
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentDispositionFormData("attachment", file.getFileName());
			headers.setContentLength(file.getFileSize());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		}else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping("/pds/{fileId}")
	public ResponseEntity<byte[]> getBinaryFile(@PathVariable int fileId) {
		UploadFileVO file = imageService.getFile(fileId);
		final HttpHeaders headers = new HttpHeaders();
		if(file != null) {
			logger.info("getFile " + file.toString());
			String[] mtypes = file.getFileContentType().split("/");
			headers.setContentType(new MediaType(mtypes[0], mtypes[1]));
			headers.setContentDispositionFormData("attachment", file.getFileName()); //4.3.7 이후 charset 지정 가능
			headers.setContentLength(file.getFileSize());
			return new ResponseEntity<byte[]>(file.getFileData(), headers, HttpStatus.OK);
		}else {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
	}
	
	@RequestMapping("/upload/delete/{fileId}")
	public String deleteFile(@PathVariable int fileId) {
//		String dir = imageService.getDirectoryName(fileId);
		imageService.deleteFile(fileId);
		logger.info("/upload/delete/{fileId} =====> redirect:/up/upload/list ");
		return "redirect:/up/upload/list";// + dir;
	}
	
	@RequestMapping("/upload/updateDir")
	public String updateDirectory(@RequestParam int[] fileIds) {
//		String dir = imageService.getDirectoryName(fileId);
		System.out.println("컨트롤러 updateDir까지 왔다");
		String directoryName = "/images";
		imageService.updateDirectory(fileIds, directoryName);
		logger.info("/upload/updateDir =====> redirect:/up/upload/list ");
		return "redirect:/up/upload/list";
	}
}