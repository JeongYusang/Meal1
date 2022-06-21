package com.meal.order.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.meal.board.gr.service.BoardGrService;
import com.meal.board.gr.vo.BoardGrVO;
import com.meal.cart.service.CartService;
import com.meal.cart.vo.CartVO;
import com.meal.common.controller.BaseController;
import com.meal.goods.service.GoodsService;
import com.meal.goods.vo.GoodsVO;
import com.meal.member.vo.MemberVO;
import com.meal.order.service.OrderService;
import com.meal.order.vo.OrderVO;

@RequestMapping("/order")
@Controller("orderController")
public class OrderControllerImpl extends BaseController implements OrderController {

	private static final Logger logger = LoggerFactory.getLogger(OrderControllerImpl.class);

	@Autowired
	OrderService orderService;

	@Autowired
	GoodsService goodsService;

	@Autowired
	CartService cartService;

	@Autowired
	BoardGrService boardGrService;

	@Override
	@RequestMapping(value = "/OrderForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView OrderForm(@RequestParam("g_id") int g_id, @RequestParam("o_goods_qty") int o_goods_qty,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		OrderVO orderVO = new OrderVO();
		orderVO.setO_goods_qty(o_goods_qty);
		if (memberInfo != null) {
			GoodsVO goodsVO = goodsService.selectGoodsDetail(g_id);
			// 1차 계산
			int G_price = goodsVO.getG_price();
			int G_saleprice = goodsVO.getG_saleprice();
			if (G_saleprice != 0) {
				int sum = G_saleprice * o_goods_qty;

				if (sum < 30000) {
					int D_price = 3000;
					orderVO.setSum(sum);
					orderVO.setD_price(D_price);
				} else {
					int D_price = 0;
					orderVO.setSum(sum);
					orderVO.setD_price(D_price);
				}
				mav.setViewName(viewName);
				mav.addObject("goodsVO", goodsVO);
				mav.addObject("orderVO", orderVO);
				return mav;

			} else {
				int sum = G_price * o_goods_qty;

				if (sum < 30000) {
					int D_price = 3000;
					orderVO.setSum(sum);
					orderVO.setD_price(D_price);
				} else {
					int D_price = 0;
					orderVO.setSum(sum);
					orderVO.setD_price(D_price);
				}
				mav.setViewName(viewName);
				mav.addObject("goodsVO", goodsVO);
				mav.addObject("orderVO", orderVO);
				return mav;
			}

		} else {
			String viewName2 = "/main/loginForm";
			String message = "로그인 해주시길 바랍니다";
			mav.setViewName(viewName2);
			mav.addObject("message", message);
			String non = "비회원관련된 것 꺼내기위한 아무 내용없는 변수";
			mav.addObject("non", non);
		}
		return mav;
	}

	// 6-10 수정중 replace 메소드를 사용해서 split할 length 추출 고민중 // split("/").length 에 대한
	// int값 추출해볼것 (완료)
	// 해당값을 JSP전해줄것 (진행중) 6-13
	@Override
	@RequestMapping(value = "/CartOrderForm.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView CartOrderForm(@RequestParam("OrderToCart") String OrderToCart, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		String viewName = (String) request.getAttribute("viewName");

		// 쪼개기 선작업
		List<CartVO> cartList = new ArrayList<CartVO>();
		List<GoodsVO> goodsList = new ArrayList<GoodsVO>();
		String[] cartList1 = OrderToCart.split("/");

		// 반복문으로 쪼갠후 바인딩을 할예정
		for (int i = 0; i < OrderToCart.split("/").length; i++) {
			String c_id = cartList1[i];
			System.out.println("==============================");
			System.out.println("cartInfo : " + c_id);
			System.out.println("==============================");

			// selectall 체크박스 누를시 값을 가져오므로 이부분에 대하여 제외하기위한 조건
			if (c_id.equals("selectall")) {
				continue;
			}
			int c_id1 = Integer.parseInt(c_id);
			CartVO cartInfo = cartService.selectCartInfo(c_id1);
			int g_id = cartInfo.g_id;
			GoodsVO goodsinfo = goodsService.selectGoodsDetail(g_id);
			String g_name = goodsinfo.getG_name();
			cartInfo.setG_name(g_name);
			// 배송비관련 구문
			int G_price = goodsinfo.getG_price();
			int g_saleprice = goodsinfo.getG_saleprice();
			int c_qty = cartInfo.getC_qty();
			if (g_saleprice != 0) {

				if (g_saleprice * c_qty > 30000) {
					int c_sum = g_saleprice * c_qty;
					int c_deleP = 0;
					cartInfo.setC_sum(c_sum);
					cartInfo.setC_deleP(c_deleP);
				} else {
					int c_deleP = 3000;
					int c_sum = g_saleprice * c_qty + c_deleP;

					cartInfo.setC_sum(c_sum);
					cartInfo.setC_deleP(c_deleP);
				}
			} else {
				if (G_price * c_qty > 30000) {
					int c_sum = G_price * c_qty;
					int c_deleP = 0;
					cartInfo.setC_sum(c_sum);
					cartInfo.setC_deleP(c_deleP);
				} else {
					int c_deleP = 3000;
					int c_sum = G_price * c_qty + c_deleP;

					cartInfo.setC_sum(c_sum);
					cartInfo.setC_deleP(c_deleP);
				}
			}

			cartList.add(cartInfo);
			goodsList.add(goodsinfo);
		}

		// mav.addObject("CartList", cartList);
		session.setAttribute("CartList", cartList);
		mav.addObject("GoodsList", goodsList);
		mav.addObject("OrderToCart", OrderToCart);
		mav.setViewName(viewName);
		return mav;

	}

	// 한개 주문시 !
	@Override
	@RequestMapping(value = "/insertOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView insertOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		int g_id = _orderVO.getG_id();
		GoodsVO goodsInfo = goodsService.goodsG_Info(g_id);
		int g_price = goodsInfo.getG_price();
		int g_saleprice = goodsInfo.getG_saleprice();
		System.out.println("saleprice" + g_saleprice);
		_orderVO.setO_goods_price(g_price);
		if (g_saleprice != 0) {
			_orderVO.setO_goods_saleprice(g_saleprice);
		} else {
			g_saleprice = 0;
			_orderVO.setO_goods_saleprice(g_saleprice);

		}
		int parentNo = orderService.insertOrder(_orderVO);

		if (parentNo != 0) {
			String viewName = (String) session.getAttribute("viewName");
			String message = "주문완료 되었습니다.";
			mav.addObject(message);
			mav.setViewName(viewName);
			return mav;
		} else {
			parentNo = 1;
			String viewName = (String) session.getAttribute("viewName");
			String message = "주문완료 되었습니다.";
			mav.addObject(message);
			mav.setViewName(viewName);
			return mav;

		}
	}

	// 6-14

	@Override

	@RequestMapping(value = "/insertCartOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView insertCartOrder(@ModelAttribute("orderVO") OrderVO _orderVO, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		List<CartVO> cartList = (List<CartVO>) session.getAttribute("CartList");
		int parentNo = (Integer) orderService.MaxOrderNum();
		_orderVO.setParentNo(parentNo);

	
			int totalUseMilage = _orderVO.getO_useMile();
			System.out.println("total Use Milage" + totalUseMilage);
			int i = 1;
			// saleprice에 대한 구문도 추가하긴해야함. 완
			for (CartVO item : cartList) {
				i++;
				int qty = item.getC_qty();
				_orderVO.setO_goods_qty(qty);
				String g_name = item.getG_name();
				_orderVO.setG_name(g_name);
				int g_id = item.getG_id();
				_orderVO.setG_id(g_id);
				GoodsVO goodsInfo = (GoodsVO) goodsService.selectGoodsDetail(g_id);
				String s_id = goodsInfo.getS_id();
				_orderVO.setS_id(s_id);
				int price = goodsInfo.getG_price();
				int saleprice = goodsInfo.getG_saleprice();

				if (saleprice != 0) {
					_orderVO.setO_goods_price(price);
					_orderVO.setO_goods_saleprice(saleprice);
					int buyprice = qty * saleprice;
					if (item.getC_deleP() != 0) {
						int deliP = 3000;
						buyprice += deliP;
						if (totalUseMilage >= buyprice) {
							totalUseMilage -= buyprice;
							_orderVO.setO_useMile(buyprice);

						} else {
							_orderVO.setO_useMile(totalUseMilage);
							totalUseMilage = 0;
						}
					} else if (item.getC_deleP() == 0) {
						if (totalUseMilage >= buyprice) {
							totalUseMilage -= buyprice;
							_orderVO.setO_useMile(buyprice);

						} else {
							_orderVO.setO_useMile(totalUseMilage);
							totalUseMilage = 0;
						}
						System.out.println("total Use Milage" + i + "번째" + totalUseMilage);
					}
					orderService.insertCartOrder(_orderVO); // 마일리지 관련하여 추후 생각을 해야함. int c_id =
					int c_id = item.getC_id();
					cartService.removeCartGoods(c_id);

				} else {
					_orderVO.setO_goods_saleprice(0);
					_orderVO.setO_goods_price(price);

					int buyprice = qty * price;
					if (item.getC_deleP() != 0) {
						int deliP = 3000;
						buyprice += deliP;
						if (totalUseMilage >= buyprice) {
							totalUseMilage -= buyprice;
							_orderVO.setO_useMile(buyprice);

						} else {
							_orderVO.setO_useMile(totalUseMilage);
							totalUseMilage = 0;
						}
					} else if (item.getC_deleP() == 0) {
						if (totalUseMilage >= buyprice) {
							totalUseMilage -= buyprice;
							_orderVO.setO_useMile(buyprice);

						} else {
							_orderVO.setO_useMile(totalUseMilage);
							totalUseMilage = 0;
						}
						System.out.println("total Use Milage" + i + "번째" + totalUseMilage);
					}
					orderService.insertCartOrder(_orderVO); // 마일리지 관련하여 추후 생각을 해야함. int c_id =
					int c_id =item.getC_id();
					cartService.removeCartGoods(c_id);

				}
			}
			session.removeAttribute("CartList");
			String viewName1 = "redirect:/order/CartOrderForm.do";
			mav.setViewName(viewName1);
			return mav;
	
	}

	

	@Override
	@RequestMapping(value = "/OrderResult.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView OrderResult(@RequestParam(value = "parentNo", required = false) String parentNo,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");

		if (parentNo == null) {
			String u_id = memberInfo.getU_id();
			String _parentNo = orderService.selectMaxParentNO(u_id);
			List<OrderVO> OrderList = orderService.OrderResult(_parentNo);
			String viewName = (String) request.getAttribute("viewName");
			mav.addObject("OrderList", OrderList);
			mav.setViewName(viewName);
			return mav;
		} else {
			String viewName = (String) request.getAttribute("viewName");
			List<OrderVO> OrderList = orderService.OrderResult(parentNo);
			mav.addObject("OrderList", OrderList);
			mav.setViewName(viewName);
			return mav;
		}
	}

	// 6월 14일 취소된 주문 조회

	@Override
	@RequestMapping(value = "/selectCanceledOrders.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectCanceledOrders(

			@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("뷰네임" + viewName);

		ModelAndView mav = new ModelAndView(viewName);
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		if (memberInfo != null) {
			String u_id = memberInfo.getU_id();
			HashMap<String, Object> Map = new HashMap<String, Object>();
			Map.put("pageNum", pageNum);
			Map.put("section", section);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
			pagingMap.put("u_id", u_id);

			List<OrderVO> OrderVO = orderService.CanceledUserOrderPage(pagingMap);

			List<OrderVO> OrderList = orderService.CanceledUserOrders(u_id);

			mav.addObject("OrderList", OrderList);
			mav.addObject("OrderVO", OrderVO);
			mav.setViewName(viewName);

			return mav;
		} else {
			String message = "회원 아이디로 로그인 해주시길 바랍니다";
			String viewName1 = "redirect:/main/main.do";
			mav.addObject(message);
			mav.setViewName(viewName1);

		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/selectUserOrders.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectUserOrders(@RequestParam(value = "dateMap", required = false) Map<String, Object> dateMap,
			@RequestParam(value = "section", required = false) String section,
			@RequestParam(value = "pageNum", required = false) String pageNum, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String viewName = (String) request.getAttribute("viewName");
		System.out.println("뷰네임" + viewName);
		ModelAndView mav = new ModelAndView(viewName);
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		if (memberInfo != null) {
			String u_id = memberInfo.getU_id();
			HashMap<String, Object> Map = new HashMap<String, Object>();
			Map.put("pageNum", pageNum);
			Map.put("section", section);
			HashMap<String, Object> pagingMap = (HashMap<String, Object>) paging(Map);
			pagingMap.put("u_id", u_id);
			List<OrderVO> OrderVO = orderService.UserboardOrderPage(pagingMap);
			for (OrderVO item : OrderVO) {
				int o_id = item.getO_id();
				String review = orderService.overlappedO_id(o_id);
				item.setReview(review);
				BoardGrVO o_idSearch = (BoardGrVO) boardGrService.o_idSearch(o_id);
				if (o_idSearch != null) {
					if ((int) item.getO_id() == (int) ((BoardGrVO) o_idSearch).getO_id()) {
						item.setB_gr_id(((BoardGrVO) o_idSearch).getB_gr_id());
					}
				}
			}
			Map<String, List<OrderVO>> orderMap = orderService.orderlist(pagingMap);
			mav.addObject("orderMap", orderMap);
			mav.addObject("OrderVO", OrderVO);
			mav.setViewName(viewName);
			return mav;
		} else {
			String message = "회원 아이디로 로그인 해주시길 바랍니다";
			String viewName1 = "redirect:/main/main.do";
			mav.addObject(message);
			mav.setViewName(viewName1);

		}
		return mav;
	}

	@Override
	@RequestMapping(value = "/deleteOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView deleteOrder(@RequestParam("o_id") int o_id, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ModelAndView mav = new ModelAndView();
		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		OrderVO orderVO = orderService.selectOrder(o_id);

		String _U_id = orderVO.getU_id();

		if (memberInfo != null) {
			if (memberInfo.getU_id().equals(_U_id)) {
				orderService.deleteOrder(o_id);
				String message = "주문이 취소 되었습니다.";
				String viewName = "redirect:/order/selectUserOrders.do";
				mav.addObject(message);
				mav.setViewName(viewName);
				return mav;

			} else {
				String message = "본인의 주문내역만 취소 할 수 있습니다.";
				mav.addObject(message);
				String viewName1 = "/order/selectUserOrders.do";
				mav.setViewName(viewName1);
				return mav;
			}

		} else {
			String message = "로그인 정보 확인해주시기 바랍니다.";
			mav.addObject(message);
			String viewName2 = "/order/selectUserOrders.do";
			mav.setViewName(viewName2);
			return mav;
		}
	}

	// 6월 14일 주문 정보 가져오기
	@Override
	@RequestMapping(value = "/selectOrder.do", method = { RequestMethod.POST, RequestMethod.GET })
	public ModelAndView selectOrder(@RequestParam("o_id") int o_id,
			@RequestParam(value = "message", required = false) String message, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		MemberVO memberInfo = (MemberVO) session.getAttribute("memberInfo");
		OrderVO orderVO = orderService.selectOrder(o_id);
		String u_id = orderVO.getU_id();
		if (memberInfo.getU_id().equals(u_id)) {
			if (orderVO.getGood_cancel().equals("Y")) {
				if (message != null) {
					mav.addObject(message);
				}
				String viewName = (String) request.getAttribute("viewName");
				mav.addObject("orderVO", orderVO);
				mav.setViewName(viewName);
			} else {
				message = "취소된 주문이 아닙니다.";
				mav.addObject(message);
				String viewName = "redirect:/order/selectCanceledOrders.do";
				mav.setViewName(viewName);
			}
		} else {
			message = "로그인 해주시길 바랍니다";
			mav.addObject(message);
			String viewName = "redirect:/main/loginForm.do";
			mav.setViewName(viewName);

		}
		return mav;

	}

}
