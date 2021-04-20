package com.ko.eat.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ko.eat.dao.UploadFileDAO;
import com.ko.eat.vo.UploadFileVO;


@Service
public class UploadFileService {
	
	@Autowired
	UploadFileDAO dao;
	
	public void uploadFile(UploadFileVO file) {
		file.setFileId(dao.getMaxFileId()+1);
		dao.uploadFile(file);
	}

	public List<UploadFileVO> getFileList(String dir) {
		return dao.getFileList(dir);
	}

	public List<UploadFileVO> getImageList(String dir) {
		return dao.getImageList(dir);
	}
	
	public List<UploadFileVO> getAllFileList() {
		return dao.getAllFileList();
	}
	
	public UploadFileVO getFile(int fileId) {
		return dao.getFile(fileId);
	}
	
	public void deleteFile(int fileId) {
		dao.deleteFile(fileId);
	}

	public String getDirectoryName(int fileId) {
		return dao.getDirectoryName(fileId);
	}

	public void updateDirectory(int[] fileIds, String directoryName) {
		for(int fileId : fileIds) {
			System.out.println("서비스까지 왔다");
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("fileId", fileId);
			map.put("directoryName", directoryName);
			dao.updateDirectory(map);
		}
	}

	public void updateFile(UploadFileVO file) {
		dao.updateFile(file);
	}
}
