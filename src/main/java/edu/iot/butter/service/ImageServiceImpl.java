package edu.iot.butter.service;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.tika.Tika;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.iot.butter.dao.ImageDao;
import edu.iot.butter.model.Image;
import edu.iot.butter.model.Pagination;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;

@Service
public class ImageServiceImpl implements ImageService {
	@Autowired
	ImageDao dao;
	
	@Override
	public Pagination getPagination(int page) throws Exception {
		int total = dao.getCount();
//		System.out.println("페이지네이션:"+total);
		Pagination pagination = new Pagination(page,total,8,8);
		return pagination;
	}

	@Override
	public List<Image> getList(Pagination pagination) throws Exception {
		return dao.selectList(pagination);
	}

	@Override
	public Image getImage(int id) throws Exception {
		return dao.selectOne(id);
	}

	@Override
	public boolean upload(Image image, List<MultipartFile> fileList) throws Exception {
		for(MultipartFile file: fileList) {
			if(!file.isEmpty()) {
				// 업로드 파일 저장, thumbnail 생성, Image 정보 설정
				saveImage(image, file);
				// 데이터베이스 저장
				dao.insert(image);
			}
		}
		return true;
	}
	
	@Autowired
	ServletContext context;
	
	// 파일 저장 및 Image 객체 정보 설정
	public void saveImage(Image image, MultipartFile file)
							throws Exception {
		String fileName  = file.getOriginalFilename();
		String newName = saveImage(fileName,file);
		String thumbName = saveThumb(newName);
		
		Tika tika = new Tika();
		String mimeType = tika.detect(fileName);
		
		image.setFileName(fileName);
		image.setMimeType(mimeType);
		image.setFileSize(file.getSize());
		image.setNewName(newName);
		image.setThumbName(thumbName);
		
	}
	
	//이름 충돌없게 timestamp 추가하여 새로운 파일명 배정 후 저장
	//새로운 파일명 리턴
	public String saveImage(String fname, MultipartFile file)
							throws Exception{
		long fileNo = System.currentTimeMillis();
		String newName = fileNo + "_"+fname;
		String path = IMAGE_DIR + "/" + newName;
		
		//업로드 된 파일명 재지정
		file.transferTo(new File(path));
		return newName;
	}

	//Thumbnail 파일 생성 및 Thumbnail 파일명 리턴
	public String saveThumb(String fname) throws Exception{
		String thumbName = "thumbnail-"+ fname;
		
		//Thumbnail 파일 생성
		Thumbnails	
			.of(new File(IMAGE_DIR + "/" +fname))
			.crop(Positions.CENTER)  //이미지 crop
			.size(200,200)
			.toFile(new File(THUMB_DIR +"/"+ thumbName));
		return thumbName;
	}
}
