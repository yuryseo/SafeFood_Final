package com.ssafy.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
		session.invalidate();
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
	String[] nations = {"가나","가봉","가이아나","감비아","과테말라","그레나다","그리스","기니","기니비사우",//ㄱ
			"나미비아","나우루","나이지리아","남수단","남아프리카","네덜란드","네팔","노르웨이","뉴질랜드","니제르","니카라과","남오세티야",//ㄴ
			"대만","덴마크","도미니카","독일","동티모르",//ㄷ
			"라오스","라이베리아","라트비아","러시아","레바논","레소토","루마니아","룩셈부르크","르완다","리비아","리투아니아","리히텐슈타인",//ㄹ
			"마다가스카르","마셜","말라위","말레이시아","말리","멕시코","모나코","모로코","모리셔스","모리타니","모잠비크","몬테네그로","몰도바","몰디브","몰타","몽골","미국","미얀마","미크로네시아",//ㅁ
			"바누아투","바레인","바베이도스","바티칸","바하마","방글라데시","베냉","베네수엘라","베트남","벨기에","벨라루스","벨리즈","벨라루스","벨리즈","보스니아","보츠와나","볼리비아","부룬디","부르키나파소","부탄","북마케도니아","북키프로스","불가리아","브라질","브루나이",//ㅂ
			"사모아","사우디아라비아","사하라 아랍 민주 공화국","산마리노","상투메 프린시페","세네갈","세르비아","세이셸","세인트루시아","소말리아","수단","스리랑카","스웨덴","스위스","스페인","슬로바키아","슬로베니아","시리아","싱가포르",//ㅅ
			"아랍에미리트","아르헨티나","아이슬란드","아이티","아일랜드","아프가니스탄","알바니아","에스토니아","에콰도르","에티오피아","영국","예멘","오만","오스트레일리아","오스트리아","온두라스","요르단","우간다","우루과이","우즈베키스탄","우크라이나","이라크","이란","이스라엘","이집트","이탈리아","인도","인도네시아","일본",//ㅇ
			"중국","자메이카","잠비아","북한","짐바브웨",//ㅈ
			"체코","칠레",//ㅊ
			"카메룬","카타르","캄보디아","캐나다","콜롬비아","콩고","쿠바","쿠웨이트","크로아티아",//ㅋ
			"타이완","타지키스탄","탄자니아","태국","터키","토고","튀니지",//ㅌ
			"파나마","파라과이","파키스탄","파푸아뉴기니","페루","포르투칼","폴란드","프랑스","피지","핀란드","필리핀",//ㅍ
			"헝가리","호주","홍콩",//ㅎ
			"외국","수입"//번외
			};
	@GetMapping("foodDetail.do")
	public String foodDetail(int foodcode, HttpSession session, Model model) {
		int code = foodcode;
		Food food = foodservice.search(code);
		String materials = food.getMaterial();
		foodservice.searchcount(foodcode);
		System.out.println("searchcount++");
		String allergies;
		String madein = "";
		Member member = (Member) session.getAttribute("member");
		for (int i = 0; i < nations.length; i++) {
			if(materials.contains(nations[i])) {
				madein+=nations[i]+"산 ";
			}
		}
		System.out.println("madein......"+madein);
		if(madein.equals("")) {
			madein = "국내산";
		}
		if (member != null) {
			System.out.println("food detail member allergy..." + member.getAllergy());
			allergies = memberservice.getAllergyIngredients(food, member.getAllergy());
			System.out.println("널이면 이 다음에 아무것도 안나오지~ : " + allergies);
		} else {
			allergies = "";
		}
		model.addAttribute("allergyIngredients", allergies);
		model.addAttribute("food", food);
		model.addAttribute("madein", madein);

		return "detailList";

	}

	@GetMapping("myFoodList.do")
	public String myFoodListGet(String searchOption, String searchItem, String sortOption, HttpSession session,
			Model model) {
		List<MyFood> list;
		List<MyFood> searchList = new ArrayList<MyFood>();
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
		model.addAttribute("list", list2); // 모든 섭취 식품들

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		String date = dateFormat.format(time);
		list = myfoodservice.searchDate(key, word);
		for (MyFood myFood : list) {
			if (myFood.getId().equals(id) && myFood.getDate().equals(date))
				searchList.add(myFood);
		}
		model.addAttribute("searchList", searchList); // 날짜별 검색된 섭취 식품들

		return "ateFood";
	}


	
	@RequestMapping(value="addwishlist.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String myFoodUpdate(int code,HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		
		Wishlist wishlist = new Wishlist(id, code);
		System.out.println("addwishlist......."+wishlist);
		wishlistservice.insert(wishlist);
		return "redirect:wishlist.do";
	}
	
	@RequestMapping(value="deletewishlist.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String deletewishlist(int code,HttpSession session, Model model) {
		
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("deletewishlist....."+code);
		Wishlist wishlist = new Wishlist(id,code);
		wishlistservice.delete(wishlist);
		
		System.out.println("deletewishlist........");
		return "redirect:/wishlist.do";
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
	public String myFoodUpdate(int code, String date, int quantity,HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("--code : " + code + " quantity : " + quantity + " date : " + date);
		myfoodservice.update(new MyFood(id, code, quantity, date));
		return "redirect:myFoodList.do";
	}

	@PostMapping("myFoodDelete.do")
	public String myFoodDelete(int code, String date, HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		myfoodservice.remove(id, code, date);
		return "redirect:myFoodList.do";
	}

	@RequestMapping(value="myFoodInsert.do",method= {RequestMethod.POST,RequestMethod.GET})
	public String myFoodInsert(int code, int quantity, String date, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String id = member.getId();
		System.out.println("----code : " + code + ", quantity : " + quantity + ", id : " + id + ", date : " + date);
		MyFood find = myfoodservice.search(id, code, date);
		if(date == null) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date time = new Date();
			date = dateFormat.format(time);			
		}
		System.out.println("----1 : " + find);
		if (find == null) {
			myfoodservice.insert(new MyFood(id, code, quantity, date));
		} else {
			if(find.getDate().equals(date))
				myfoodservice.update(new MyFood(id, code, quantity + find.getQuantity(), date));
			else
				myfoodservice.insert(new MyFood(id, code, quantity, date));
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
