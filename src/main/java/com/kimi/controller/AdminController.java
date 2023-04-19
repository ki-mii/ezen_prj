package com.kimi.controller;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kimi.model.AttachImageVO;
import com.kimi.model.Criteria;
import com.kimi.model.PageDTO;
import com.kimi.model.ProductVO;
import com.kimi.service.AdminService;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="main", method=RequestMethod.GET)
	public void adminMainGET() throws Exception {
		log.info("관리자 페이지 이동");
	}
	
	/* 상품 등록 페이지 접속 */
	@RequestMapping(value = "goodsEnroll", method=RequestMethod.GET)
	public void goodsEnrollGET() throws Exception{
		log.info("상품 등록 페이지 접속");
	}
	
	/*상품 등록*/
	@PostMapping("/goodsEnroll")
	public String goodsEnrollPOST(ProductVO product, RedirectAttributes rttr) {
		log.info("goodsEnrollPOST....."+product);
		
		adminService.goodsEnroll(product);
		
		rttr.addFlashAttribute("enroll_result", product.getName());
		
		return "redirect:/admin/goodsManage";
	}
	
	/* 첨부 파일 업로드 */
	@PostMapping(value = "/uploadAjaxAction", produces = org.springframework.http.MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		
		log.info("uploadAjaxActionPOST.........");
		
		/* 이미지 파일 체크 */
		for(MultipartFile multipartFile: uploadFile) {
			File checkfile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			try {
				type = Files.probeContentType(checkfile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list,HttpStatus.BAD_REQUEST);
			}
		}
		
		String uploadFolder = "C:\\upload";
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Date date = new Date();
		
		String str = sdf.format(date);
		
		String datePath = str.replace("-", File.separator);
		
		/* 폴더 생성 */
		File uploadPath = new File(uploadFolder, datePath);
		
		if(uploadPath.exists() == false) {
			uploadPath.mkdirs();
		}
		
		/* 이미저 정보 담는 객체 */
		List<AttachImageVO> list = new ArrayList();
		
		
		for(MultipartFile multipartFile : uploadFile) {
			
			/* 이미저 정보 객체 */
			AttachImageVO vo = new AttachImageVO();
			
			/* 파일 이름 */
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			/* uuid 적용 파일 이름 */
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			
			uploadFileName = uuid + "_" + uploadFileName;
			
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(uploadPath, uploadFileName);
			
			/* 파일 저장 */
			try {
				multipartFile.transferTo(saveFile);
				
				/* 썸네일 생성(ImageIO)*/
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//				/* 비율 넓이 높이 */
//				double ratio = 3;
//				int width = (int)(bo_image.getWidth()/ratio);
//				int height = (int)(bo_image.getHeight()/ratio);
//				
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//				
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				graphic.drawImage(bo_image, 0, 0, width, height, null);
//				
//				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
				/*방법2*/
				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				/* 비율 넓이 높이 */
				double ratio = 3;
				int width = (int)(bo_image.getWidth()/ratio);
				int height = (int)(bo_image.getHeight()/ratio);
				
				Thumbnails.of(saveFile)
				.size(width, height)
				.toFile(thumbnailFile);
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			list.add(vo);
			
//			log.info("-------------------------------");
//			log.info("파일 이름 : " + multipartFile.getOriginalFilename());
//			log.info("파일 타입 : " + multipartFile.getContentType());
//			log.info("파일 크기 : " + multipartFile.getSize());
		}//for
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
	}
	
	/* 이미지 파일 삭제 */
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deleteFile........" + fileName);
		
		File file = null;
		
		try {
			/*썸네일 파일 삭제*/
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			
			file.delete();
			
			/*원본 파일 삭제*/
			String originFileName = file.getAbsolutePath().replace("s_", "");
			
			log.info("originFileName : " + originFileName);
			
			file = new File(originFileName);
			
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
			return new ResponseEntity<>("fail", HttpStatus.NOT_IMPLEMENTED);
		}//catch
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	/* 상품 관리 페이지 접속 */
	@RequestMapping(value = "goodsManage", method=RequestMethod.GET)
	public void goodsManageGET(Criteria cri, Model model) throws Exception{
		log.info("상품 관리 페이지 접속");
		
		/* 상품 리스트 데이터 */
		List list = adminService.goodsGetList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
		}else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		
		/* 페이지 인터페이스 데이터 */
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
		
	}
	
	@GetMapping({"/goodsDetail", "/goodsModify"})
	public void goodsGetInfoGET(int id, Criteria cri, Model model) {
		log.info("goodsGetInfo..........."+id);
		
		/* 목록 페이지 조건 정보 */
		model.addAttribute("cri", cri);
		/* 조회 페이지 정보 */
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(id));
	}
	
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(ProductVO product, RedirectAttributes rttr) {
		log.info("goodsModifyPOST..........."+product);
		
		int result = adminService.goodsModify(product);
		
		rttr.addFlashAttribute("modify_result", result);
		
		return "redirect:/admin/goodsManage";
	}
	
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int id, RedirectAttributes rttr) {
		log.info("goodsDeletePOST...........");
		
		List<AttachImageVO> fileList = adminService.getAttachInfo(id);
		
		if(fileList != null) {
			
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid()+"_" + vo.getFileName());
				pathList.add(path);
				
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
		}
		
		int result = adminService.goodsDelete(id);
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/admin/goodsManage";
	}

}
