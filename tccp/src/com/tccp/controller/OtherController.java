package com.tccp.controller;

import java.io.File;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/other")
public class OtherController {
	
	@RequestMapping("/toShowBooks")
	public String toShowBooks() {
		return "/other_showBooks";
	}
	@RequestMapping("/toUploadFileView")
	public String toUploadFileView3() {
		return "/other_uploadFile";
	}

	/**
	 * 通过springMVC提供的API
	 */
	@RequestMapping("/parserUploadFile")
	public String parserUploadFile3(MultipartFile file) throws IOException {
		String realPath = "D:/apache-tomcat-7.0.42/webapps/tccp/upload/uploadFiles/";
		
		file.transferTo(new File(realPath+file.getOriginalFilename()));

		return "success";
	}
	@RequestMapping("/toUploadImage1")
	public String toUploadImage1() {
		return "uploadImage";
	}
	
	@RequestMapping("/uploadImage1")
	public String uploadImage1(MultipartFile file) throws IOException {
		String realPath = "D:/apache-tomcat-7.0.42/webapps/tccp/upload/uploadImages/";
	//	String realPath = "D:/Git/TCCP/tccp/WebRoot/upload/";
		file.transferTo(new File(realPath+file.getOriginalFilename()));
		System.out.println(file.getOriginalFilename());

		return "success";
	}
	
	
//	@RequestMapping("/toUploadImage2")
//	public String toUploadImage2() {
//		return "uploadImage";
//	}
//	
//	@RequestMapping(value="/uploadImage2")
//	public String uploadImage2(HttpServletRequest request,HttpServletResponse response,HttpSession httpSession,
//	@RequestParam(value="file",required=false )MultipartFile file
//	)throws Exception{
//		String filePath="";
//		if (!file.isEmpty()) {  
//			try {  
//					// 文件保存路径  
//	                filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"  
//	                        + file.getOriginalFilename();  
//	                // 转存文件  
//	                file.transferTo(new File(filePath));  
//	            } catch (Exception e) {  
//	                e.printStackTrace();  
//	            }  
//	        }
//		httpSession.setAttribute("path", "upload/"+file.getOriginalFilename());
//	return "redirect:/other/toUploadImage";
//	}
//	
//	@RequestMapping("/toUploadHeadImage")
//	public String toUploadHeadImage() {
//		return "testImage";
//	}
//	
//	@RequestMapping("/uploadHeadImage")
//	    public String uploadHeadImage(
//	            HttpServletRequest request,
//	            @RequestParam(value = "x") String x,
//	            @RequestParam(value = "y") String y,
//	            @RequestParam(value = "h") String h,
//	            @RequestParam(value = "w") String w,
//	            @RequestParam(value = "imgFile") MultipartFile imageFile
//	    ) throws Exception{
//	        System.out.println("==========Start=============");
//	        String realPath = request.getSession().getServletContext().getRealPath("/");
//	        String resourcePath = "resources/uploadImages/";
//	        if(imageFile!=null){
//	            if(FileUploadUtil.allowUpload(imageFile.getContentType())){
//	                String fileName = FileUploadUtil.rename(imageFile.getOriginalFilename());
//	                int end = fileName.lastIndexOf(".");
//	                String saveName = fileName.substring(0,end);
//	                File dir = new File(realPath + resourcePath);
//	                if(!dir.exists()){
//	                    dir.mkdirs();
//	                }
//	                File file = new File(dir,saveName+"_src.jpg");
//	                imageFile.transferTo(file);
//	                String srcImagePath = realPath + resourcePath + saveName;
//	                int imageX = Integer.parseInt(x);
//	                int imageY = Integer.parseInt(y);
//	                int imageH = Integer.parseInt(h);
//	                int imageW = Integer.parseInt(w);
//	                //这里开始截取操作
//	                System.out.println("==========imageCutStart=============");
//	                imgCut(srcImagePath,imageX,imageY,imageW,imageH);
//	                System.out.println("==========imageCutEnd=============");
//	            }
//	        }
//	        return "test";
//	    }
//	 /**
//	     * 截取图片
//	     * @param srcImageFile  原图片地址
//	     * @param x    截取时的x坐标
//	     * @param y    截取时的y坐标
//	     * @param desWidth   截取的宽度
//	     * @param desHeight   截取的高度
//	     */
//	    public static void imgCut(String srcImageFile, int x, int y, int desWidth,
//	                              int desHeight) {
//	        try {
//	            Image img;
//	            ImageFilter cropFilter;
//	            BufferedImage bi = ImageIO.read(new File(srcImageFile+"_src.jpg"));
//	            int srcWidth = bi.getWidth();
//	            int srcHeight = bi.getHeight();
//	            if (srcWidth >= desWidth && srcHeight >= desHeight) {
//	                Image image = bi.getScaledInstance(srcWidth, srcHeight,Image.SCALE_DEFAULT);
//	                cropFilter = new CropImageFilter(x, y, desWidth, desHeight);
//	                img = Toolkit.getDefaultToolkit().createImage(
//	                        new FilteredImageSource(image.getSource(), cropFilter));
//	                BufferedImage tag = new BufferedImage(desWidth, desHeight,
//	                        BufferedImage.TYPE_INT_RGB);
//	                Graphics g = tag.getGraphics();
//	                g.drawImage(img, 0, 0, null);
//	                g.dispose();
//	                //输出文件
//	                ImageIO.write(tag, "JPEG", new File(srcImageFile+"_cut.jpg"));
//	            }
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }
}
