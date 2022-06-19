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
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.order.service.OrderService;
import com.meal.order.vo.OrderVO;

@Component("Scheduler")
public class SchedulerController {

	Logger logger = LoggerFactory.getLogger(SchedulerController.class);

	@Autowired
	private GoodsDAO goodsDAO;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private OrderService orderService;

	@Scheduled(cron = "5/30 * * * * ?")
	public void goodsCateUpdate() {
		// goods cate변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			// 해당 상품조회는 상품등록후 24시간이 지난상황의상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsService.selectNew_Goods();
			for (GoodsVO item : newGoodsList) {
				goodsService.updateNomalGoods(item);
				System.out.println(item.getG_name());
				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : [" + batchResult + "] " + dateFormat.format(calendar.getTime()));

	}
	// 6-16
	@Scheduled(cron = "5/30 * * * * ?")
	public void BestgoodsCateUpdate() {
		// goods cate변경
		// 인기상품검색 검색
		String batchResult = "성공";
		try {
			// 인기상품 신상품으로 변경
			List<GoodsVO> bestGoodsN = (List<GoodsVO>) goodsService.selectBestGoodsN();
			if (bestGoodsN != null) {
				for (GoodsVO item : bestGoodsN) {
					int g_id = item.getG_id();
					goodsService.changeBestGoodsN(g_id);
				}
				logger.debug("인기상품 변환중");
				System.out.println("인기상품 변환중");
			}
			// 인기상품 일반상품으로 변경
			List<GoodsVO> bestGoodsN1 = (List<GoodsVO>) goodsService.selectAllBestGoods();
			if (bestGoodsN1 != null) {
				for (GoodsVO item : bestGoodsN1) {
					int g_id = item.getG_id();
					goodsService.changeNomalGoods(g_id);
				}
				logger.debug("인기상품 변환중");
			}

			// 인기상품 새등록
			List<OrderVO> orderList = (List<OrderVO>) orderService.BestGoodsCount();
			if (orderList != null) {
				for (OrderVO item : orderList) {
					int g_id = item.getG_id();
					goodsService.changeBestGoods(g_id);
				}
				logger.debug("인기상품 변환완료");
			}

		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : [" + batchResult + "] " + dateFormat.format(calendar.getTime()));

	}

	// 상품 세일 지정
	@Scheduled(cron = "5/30 * * * * ?")
	public void goodsSaleBegin() {
		// goods saleprice 변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			// 해당 상품조회는 할인기간 지난 상황의 상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsDAO.searchGoodsSale();
			for (GoodsVO item : newGoodsList) {
				int goodsPrice = item.getG_price();
				// 할인 율로 지정했을경우
				int goodsSaleP = item.getG_salePer();
				// 할인 금액으로 지정했을경우
				int goodsSaleW = item.getG_saleWon();

				int salePrice = 0;

				if (goodsSaleP != 0) {
					// 퍼센트 할인일경우
					goodsSaleP = 100 - goodsSaleP;
					salePrice = goodsPrice * goodsSaleP / 100;
					item.setG_saleprice(salePrice);
					logger.info("goodsPrice: " + goodsPrice);
					logger.info("goodsSaleP: " + goodsSaleP);
					logger.info("goodsSalePrice: " + salePrice);
					goodsDAO.goodsSaleBegin(item);
				} else if (goodsSaleW != 0) {
					// 가격 할인일경우
					salePrice = goodsPrice - goodsSaleW;
					item.setG_saleprice(salePrice);
					goodsDAO.goodsSaleBegin(item);
					logger.info("goodsPrice: " + goodsPrice);
					logger.info("goodsSaleW: " + goodsSaleW);
					logger.info("goodsSalePrice: " + salePrice);
				}

				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : [" + batchResult + "] " + dateFormat.format(calendar.getTime()));

	}

	// 상품 세일 종료
	@Scheduled(cron = "5/30 * * * * ?")
	public void goodsSaleEnd() {
		// goods saleprice 변경
		// 신상품 검색
		String batchResult = "성공";
		try {
			// 해당 상품조회는 상품할인기간이 끝난상황의 상품을 검색해줌.
			List<GoodsVO> newGoodsList = (List<GoodsVO>) goodsDAO.searchGoodsSaleE();
			for (GoodsVO item : newGoodsList) {
				int g_id = item.getG_id();
				goodsService.goodsSaleEnd(g_id);
				logger.debug("goodsCateUpdate");
			}
		} catch (Exception e) {
			batchResult = "실패";
		}
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		logger.info("schedule start : [" + batchResult + "] " + dateFormat.format(calendar.getTime()));

	}

}
