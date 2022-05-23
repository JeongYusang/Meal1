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

	@Scheduled(cron="* 10 * * * *")
	public void goodsCateUpdate() {
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
}
