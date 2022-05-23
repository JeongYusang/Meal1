package com.meal.common.File;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.goods.vo.Img_gVO;

import net.coobird.thumbnailator.Thumbnails;
@Controller
public class DownLoad {

	@Autowired
	private Img_gVO img_gVO;
	@Autowired
	private GoodsVO goodsVO;
	@Autowired
	private GoodsService goodsService;

	private static String CURR_IMAGE_PATH = "C:\\Meal\\Image";
	// 경로 C:\\Meal\\Image\\goods\\ g_id\\cate \\fileName(상품기준)
	// 경로 C:\\Meal\\Image\\goods\\ g_id\\b_gr_id\\fileName(게시판기준)

	// 이미지 다운로드 상황은 3가지 (어드민 공지이미지 /이벤트이미지 | 상품에대한 이미지 | 상품후기에 관한 이미지 |

	// download1 = 상품페이지에 관한 다운르도
	@RequestMapping("/download1.do")
	protected void download1(@RequestParam("cate") String cate, @RequestParam("g_id") String g_id,
			 HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		//g_id 는 메인페이지에서 g_vo로 들고옴 
		// 그것을 통해서 img_g꺼내주는것이 목적(이미지 이름때문임)
		int g_id1 = Integer.parseInt(g_id);
		List<Img_gVO> listGoodsImg = goodsService.selectImgList(g_id1);
		for (Img_gVO goodsImg : listGoodsImg) {

			if (goodsImg.getCate().equals(cate)) {
				//상품 이미지폴더 지정
				String filePath = CURR_IMAGE_PATH + "\\" + "goods" + "\\" + g_id + "\\" + goodsImg.getCate() + "\\" + goodsImg.getFileName();
				System.out.println(filePath);
				File image = new File(filePath);
				response.setHeader("Cache-Control", "no-cache");
				response.addHeader("Content-disposition", "attachment; fileName=" + goodsImg.getFileName());
				FileInputStream in = new FileInputStream(image);
				byte[] buffer = new byte[1024 * 8];
				while (true) {
					int count = in.read(buffer);
					if (count == -1)
						break;
					out.write(buffer, 0, count);
				}
				in.close();
				out.close();
			}

		}
	}
	
	//상품후기에 관한 이미지 경로
	@RequestMapping("/download2")
	   protected void download(@RequestParam("fileName") String fileName, @RequestParam("b_gr_id") int b_gr_id, @RequestParam("g_id") int g_id,
	         HttpServletResponse response) throws Exception {
	      OutputStream out = response.getOutputStream();
	      
	      String filePath = CURR_IMAGE_PATH  + "\\"+ "goods" + "\\"+ g_id + "\\" + "Gr" + "\\" + b_gr_id + "\\" + fileName;
	      File image = new File(filePath);
	      response.setHeader("Cache-Control", "no-cache");
	      response.addHeader("Content-disposition", "attachment; fileName=" + fileName);
	      FileInputStream in = new FileInputStream(image);
	      byte[] buffer = new byte[1024 * 8];
	      while (true) {
	         int count = in.read(buffer);
	         if (count == -1)
	            break;
	         out.write(buffer, 0, count);
	      }
	      in.close();
	      out.close();
	   }

	

	
//썸네일에 관한 다운로드
	@RequestMapping("/thumbnails.do")
	protected void thumbnails(@RequestParam("g_id") String g_id,
			HttpServletResponse response) throws Exception {
		OutputStream out = response.getOutputStream();
		int g_id1 = Integer.parseInt(g_id);
		String cate = "main";
		HashMap<String,Object> map = new HashMap<String,Object>();
		map.put("cate", cate);
		map.put("g_id", g_id1);
		Img_gVO goodsImg = (Img_gVO) goodsService.selectOneImg(map);		
		String filePath = CURR_IMAGE_PATH + "\\" + "goods" + "\\" + g_id + "\\" + goodsImg.getCate() + "\\" + goodsImg.getFileName();
		File image = new File(filePath);

		if (image.exists()) {
			Thumbnails.of(image).size(121, 154).outputFormat("png").toOutputStream(out);
		}
		byte[] buffer = new byte[1024 * 8];
		out.write(buffer);
		out.close();
	}
}
