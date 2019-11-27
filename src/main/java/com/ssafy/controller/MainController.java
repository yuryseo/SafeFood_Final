package com.ssafy.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ssafy.model.dto.Food;
import com.ssafy.model.dto.Member;
import com.ssafy.model.dto.MyFood;
import com.ssafy.model.dto.SafefoodException;
import com.ssafy.model.dto.Wishlist;
import com.ssafy.service.FoodServiceImp;
import com.ssafy.service.MemberServiceImp;
import com.ssafy.service.MyFoodServiceImp;
import com.ssafy.service.WishlistServiceImp;

@Controller
public class MainController {
	@Autowired
	private FoodServiceImp foodservice;
	@Autowired
	private MyFoodServiceImp myfoodservice;
	@Autowired
	private MemberServiceImp memberservice;
	@Autowired
	private WishlistServiceImp wishlistservice;

	@ExceptionHandler
	public ModelAndView handler(Exception e) {
		ModelAndView mav = new ModelAndView("ErrorHandler");
		mav.addObject("msg", e.getMessage());
		return mav;
	}

	@GetMapping("/")
	String start(HttpSession session) {
		//session.invalidate();
		return "redirect:index.jsp";
	}

	@GetMapping("index.do")
	String index(HttpSession session) {
		List<Food> searchTop4 = foodservice.searchcountTop4();
		session.setAttribute("searchTop4", searchTop4);
		List<Food> intakeTop4 = foodservice.intakecountTop4();
		session.setAttribute("intakeTop4", intakeTop4);
		return "redirect:index.jsp";
	}

	@PostMapping("login.do")
	protected String login(HttpSession session, String id, String password) throws Exception {
		if (memberservice.login(id, password)) {
			Member m = memberservice.search(id);
			session.setAttribute("member", m);
		}
		List<Food> searchTop4 = foodservice.searchcountTop4();
		session.setAttribute("searchTop4", searchTop4);
		List<Food> intakeTop4 = foodservice.intakecountTop4();
		session.setAttribute("intakeTop4", intakeTop4);
		return "redirect:index.jsp";

	}

	@PostMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		List<Food> searchTop4 = foodservice.searchcountTop4();
		session.setAttribute("searchTop4", searchTop4);
		List<Food> intakeTop4 = foodservice.intakecountTop4();
		session.setAttribute("intakeTop4", intakeTop4);
		return "redirect:index.jsp";
	}

	@GetMapping("RegisterGo.do")
	public String RegisterGo(HttpSession session) {
		return "Register";
	}

	@PostMapping("Register.do")
	public String memberRegiste(Member member) {
		try {
			memberservice.insert(member);
			System.out.println("member allergy" + member.getAllergy());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new SafefoodException("회원가입 중 에러 발생");
		}
		return "redirect:index.jsp";
	}

	@GetMapping("memberInfoGo.do")
	public String memberInfoGo(HttpSession session, Model model) {
		Member m = (Member) session.getAttribute("member");
		return "Modify";
	}

	@PostMapping("memberUpdate.do")
	public String memberUpdate(Member member, HttpSession session, Model model) {
		System.out.println("Member update " + member);
		memberservice.update(member);
		session.setAttribute("member", member);
		return "index";
	}

	@PostMapping("memberRemove.do")
	public String memberRemove(Member member, HttpSession session, Model model) {
		String id = member.getId();
		System.out.println("remove) id : " + id);
		session.invalidate();
		memberservice.remove(id);

		return "index";
	}

	@GetMapping("findIdGo.do")
	public String findIdGo() {

		return "findId";
	}

	@GetMapping("findPasswordGo.do")
	public String findPasswordGo() {
		return "findPassword";
	}
	// idFind.do
	// passwordFind.do

	@PostMapping("idFind.do")
	public String idFind(Member member, HttpSession session, Model model) {

		String name = member.getName();
		String phone = member.getPhone();
		System.out.println("id 찾기..............." + name + " " + phone);
		Member m = memberservice.searchbyname(name);
		if (m == null) {
			session.invalidate();
			System.out.println("멤버가 없지여");
			return "redirect:findIdGo.do";
		}
		String mid = m.getId();
		String mname = m.getName();
		String mphone = m.getPhone();
		if (mname.equals(name) && mphone.equals(phone)) {
			model.addAttribute("mid", mid);
		} else {
			throw new SafefoodException("회원정보를 정학히 입력해주세요");
		}

		return "findId";
	}

	@PostMapping("passwordFind.do")
	public String passwordFind(Member member, HttpSession session, Model model) {

		String id = member.getId();
		String name = member.getName();
		String phone = member.getPhone();
		System.out.println("비밀번호 찾기..............." + name + " " + phone);
		Member m = memberservice.search(id);
		if (m == null) {
			session.invalidate();
			System.out.println("멤버가 없지여");
			throw new SafefoodException("회원정보를 정학히 입력해주세요");

		}
		String mid = m.getId();
		String mname = m.getName();
		String mphone = m.getPhone();
		String mpassword = m.getPassword();
		if (mid.equals(id) && mname.equals(name) && mphone.equals(phone)) {
			model.addAttribute("password", mpassword);
		} else {
			// model.addAttribute("msg", "회원정보를 정학히 입력해주세요");
			throw new SafefoodException("회원정보를 정학히 입력해주세요");
			// return "ErrorHandler";
		}

		return "findPassword";
	}

	@GetMapping("foodList.do")
	public String foodList(String searchOption, String searchItem, String sortOption, Model model) {
		System.out.println("foodList............" + searchOption + searchItem + sortOption);
		try {
			List<Food> list;
			String key = searchOption;
			String word = searchItem;
			String sortKey = sortOption;
			if (key == null && word == null && sortKey == null) {
				key = "all";
				word = "";
				sortKey = "sortName";
			}
			// list = foodservice.All();
			System.out.println(key + "          " + word);
			list = foodservice.searchAll(key, word);
			Collections.sort(list, new foodSortComparator(sortKey));
			model.addAttribute("list", list);
			System.out.println(list);
		} catch (Exception e) {
			e.printStackTrace();
			throw new SafefoodException("foodlist 조회중 에러발생 ");
		}
		return "productList";
	}

	@GetMapping("foodDetail.do")
	public String foodDetail(int foodcode, HttpSession session, Model model) {
		int code = foodcode;
		Food food = foodservice.search(code);
		foodservice.searchcount(foodcode);
		System.out.println("searchcount++");
		String allergies;
		Member member = (Member) session.getAttribute("member");
		if (member != null) {
			System.out.println("food detail member allergy..." + member.getAllergy());
			allergies = memberservice.getAllergyIngredients(food, member.getAllergy());
			System.out.println("널이면 이 다음에 아무것도 안나오지~ : " + allergies);
		} else {
			allergies = "";
		}
		model.addAttribute("allergyIngredients", allergies);
		model.addAttribute("food", food);

		return "detailList";

	}

	@GetMapping("myFoodList.do")
	public String myFoodListGet(String searchOption, String searchItem, String sortOption, HttpSession session,
			Model model) {
		List<MyFood> list;
		List<MyFood> list2 = new ArrayList<MyFood>();
		String key = searchOption;
		String word = searchItem;
		String sortKey = sortOption;
		if (key == null && word == null && sortKey == null) {
			key = "searchName";
			word = "";
			sortKey = "sortName";
		}
		list = myfoodservice.searchAll(key, word);
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		for (MyFood myFood : list) {
			if (myFood.getId().equals(id))
				list2.add(myFood);
		}
		model.addAttribute("list", list2);
		return "ateFood";
	}

	//찜 누르는 거 디비에 추가하게
	
	
	
	@GetMapping("deletewishlist.do")
	public void deletewishlist(int code,HttpSession session, Model model) {
		
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("deletewishlist....."+code);
		Wishlist wishlist = new Wishlist(id,code);
		wishlistservice.delete(wishlist);
		
		System.out.println("deletewishlist........");
	}
	
	
	
	
	@GetMapping("wishlist.do")	// 리스트 불러오는거
	public String WishListGet(HttpSession session, Model model) {
		System.out.println("wishlist");
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println(id);
		List<Wishlist> list = wishlistservice.search(id); // 해당아이디에 맞는 리스트만 불러옴
		// 리턴 타입을 새로 만들어줘야해
		List<Food> find =  new ArrayList<Food>() ;
		if (list != null) {
			System.out.println("list.size()....."+list.size());
			for (int i = 0; i < list.size(); i++) {
				int code = list.get(i).getCode();
				System.out.println((i+1)+"번째 wish list food......."+code);
				Food food  = foodservice.search(code);
				System.out.println("food............"+food);
				find.add(food);
			}
			model.addAttribute("list",  find);
		}
		return "wishlist";
	}

	@PostMapping("myFoodList.do")
	public String myFoodListPost(String searchOption, String searchItem, String sortOption, HttpSession session,
			Model model) {
		List<MyFood> list;
		List<MyFood> list2 = new ArrayList<MyFood>();
		String key = searchOption;
		String word = searchItem;
		String sortKey = sortOption;
		if (key == null && word == null && sortKey == null) {
			key = "searchName";
			word = "";
			sortKey = "sortName";
		}
		list = myfoodservice.searchAll(key, word);
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		for (MyFood myFood : list) {
			if (myFood.getId().equals(id))
				list2.add(myFood);
		}
		model.addAttribute("list", list2);
		return "ateFood";
	}

	@PostMapping("myFoodUpdate.do")
	public String myFoodUpdate(int code, int quantity, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("--code : " + code + " quantity : " + quantity);
		myfoodservice.update(new MyFood(id, code, quantity));
		return "redirect:myFoodList.do";
	}

	@PostMapping("myFoodDelete.do")
	public String myFoodDelete(int code, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		myfoodservice.remove(id, code);
		// session.invalidate();
		return "redirect:myFoodList.do";
	}

	@PostMapping("myFoodInsert.do")
	public String myFoodInsert(int code, int quantity, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("----code : " + code + ", quantity : " + quantity + ", id : " + id);
		MyFood find = myfoodservice.search(id, code);
		System.out.println("----1 : " + find);
		if (find == null) {
			myfoodservice.insert(new MyFood(id, code, quantity));
		} else {
			myfoodservice.update(new MyFood(id, code, quantity + find.getQuantity()));
		}
		foodservice.intakecount(code);
		System.out.println("intake count++");
		return "redirect:myFoodList.do";
	}

	private class foodSortComparator implements Comparator<Food> {
		String sortKey;

		public foodSortComparator(String sortKey) {
			this.sortKey = sortKey;
		}

		@Override
		public int compare(Food o1, Food o2) {
			int res = 0;
			// 브랜드 명으로 정렬
			if (sortKey.equals("sortMaker")) {
				res = o1.getMaker().compareTo(o2.getMaker());
			}
			// 기본 형은 이름순으로 정렬
			else { // if(sortKey.equals("name")) {
				res = o1.getName().compareTo(o2.getName());
			}
			return res;
		}
	};

	@GetMapping("qna.do")
	public String qna(HttpSession session, Model model) {
		/*
		 * Member member = (Member) session.getAttribute("member"); String id =
		 * member.getId();
		 */

		return "qna";
	}

	@GetMapping("guideProgram.do")
	public String guideProgram(HttpSession session, Model model) {

		return "guideProgram";
	}

}
