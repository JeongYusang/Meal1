package com.meal.common.scheduler;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.meal.goods.dao.GoodsDAO;
import com.meal.goods.vo.GoodsVO;

@Component("Scheduler")
public class SchedulerController {

	Logger logger = LoggerFactory.getLogger(SchedulerController.class);

	@Autowired
	private GoodsDAO goodsDAO;

	@Scheduled(cron="0 15 13 * * ?")
	public void goodsCateUpdate() {
		//goods cate 변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			//해당 상품조회는 상품등록후 24시간이 지난상황의 상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsDAO.selectNew_Goods();
			for (GoodsVO item : newGoodsList) {
				goodsDAO.updateNomalGoods(item);
				System.out.println(item.getG_name());
				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : ["+batchResult+"] "+dateFormat.format(calendar.getTime()));

	}
	
	
	// 상품 세일 지정
	@Scheduled(cron="0 30 9 * * ?")
	public void goodsSaleBegin() {
		//goods saleprice 변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			//해당 상품조회는 할인기간 지난 상황의 상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsDAO.selectNew_Goods();
			for (GoodsVO item : newGoodsList) {
				int goodsPrice = item.getG_price();
				// 할인 율로 지정했을경우
				int goodsSaleP = item.getG_salePer();
				// 할인 금액으로 지정했을경우
				int goodsSaleW = item.getG_saleWon();
				
				int salePrice = 0;
				
				if (goodsSaleP != 0 ) {
					// 퍼센트 할인일경우
					goodsSaleP = (100-goodsSaleW)%100 ;
					salePrice = goodsPrice * goodsSaleW;
					item.setG_saleprice(salePrice);

				}else if(goodsSaleW != 0){
					// 가격 할인일경우
					salePrice = goodsPrice - goodsSaleP;
					item.setG_saleprice(salePrice);
	
				}
				goodsDAO.goodsSaleBegin(item);
				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : ["+batchResult+"] "+dateFormat.format(calendar.getTime()));

	}
	
	// 상품 세일 종료
	@Scheduled(cron="0 15 13 * * ?")
	public void goodsSaleEnd() {
		//goods saleprice 변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			//해당 상품조회는 상품할인기간이 끝난상황의 상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsDAO.searchGoodsSaleE();
			for (GoodsVO item : newGoodsList) {
		
				goodsDAO.goodsSaleEnd(item);
				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : ["+batchResult+"] "+dateFormat.format(calendar.getTime()));

	}
	
	
	
}
