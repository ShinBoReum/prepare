package com.boreum.web;

import java.security.spec.DSAGenParameterSpec;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.boreum.service.UserService;
import com.boreum.service.domain.User;
import com.tobesoft.platform.PlatformRequest;
import com.tobesoft.platform.PlatformResponse;
import com.tobesoft.platform.data.ColumnInfo;
import com.tobesoft.platform.data.Dataset;
import com.tobesoft.platform.data.DatasetList;
import com.tobesoft.platform.data.VariableList;

@Controller
@RequestMapping("/user/*")
public class UserController {
	
	@Autowired
	UserService userService;
	
	public UserController(){
		System.out.println(this.getClass());
	}
	
	@SuppressWarnings("deprecation")
	@RequestMapping( value = "/test", method=RequestMethod.POST)
	public void test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(request.getParameter("name"));

		User user = new User();
		
		user = userService.getUser("123");
		DatasetList out_dl = new DatasetList();
		VariableList out_vl = new VariableList();
		/*
		Dataset dataset = new Dataset("user");
		dataset.addColumn("sabun",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("name",ColumnInfo.CY_COLINFO_STRING, 20);
		
		int row = dataset.appendRow();
		dataset.setColumn(row, "sabun", user.getUser_no());
		dataset.setColumn(row, "name", user.getKor_name());
		
		
		out_dl.addDataset(dataset);
		*/
		
		
		List<User> list = userService.lists();
		
		System.out.println(list.get(1).getUser_no());
		
		Dataset dataset = new Dataset("user");
		dataset.addColumn("sabun",ColumnInfo.CY_COLINFO_STRING, 20);
		dataset.addColumn("name",ColumnInfo.CY_COLINFO_STRING, 20);
		for(int i = 0; i<list.size(); i++) {
			
			int row = dataset.appendRow();
			dataset.setColumn(row, "sabun", list.get(i).getUser_no());
			dataset.setColumn(row, "name", list.get(i).getKor_name());
			
			out_dl.addDataset(dataset);
			
		}
		
		System.out.println(dataset);
		
		
		PlatformResponse platformResponse = new PlatformResponse(response, PlatformRequest.XML,"utf-8");
		platformResponse.sendData(out_vl, out_dl);
		
	}
	@RequestMapping( value="/", method=RequestMethod.GET )
	public String index(@ModelAttribute("user")  User user, Model model) throws Exception{
	
		System.out.println("/index : GET");
		
		Map<String , Object> map=userService.list();
		
		System.out.println(map);
		
		model.addAttribute("list", map.get("list"));
		
		return "/index";
		
		
	}
	
	@RequestMapping( value="/list", method=RequestMethod.GET )
	public String list(@ModelAttribute("user")  User user, Model model) throws Exception{
	
		System.out.println("/list : GET");
		
		Map<String , Object> map=userService.list();
		
		System.out.println(map);
		
		model.addAttribute("list", map.get("list"));
		
		return "/main";
		
		
	}
	
	@RequestMapping( value="/updateProfile", method=RequestMethod.GET )
	public String updateProfile(@RequestParam("userno") String userno, Model model) throws Exception{
	
		System.out.println("/user/updateProfile : GET");
		System.out.println(userno);
		User user = userService.getUser(userno);
		
		model.addAttribute("user", user);
		
		System.out.println("휴" + user);
		return "/page4";
		//return null;
	}
	
	@RequestMapping( value="/updateProfile", method=RequestMethod.POST )
	public String updateProfile( @ModelAttribute("user")  User user, Model model) throws Exception{
	
		System.out.println("/user/updateProfile : POST");
		
		System.out.println(user);
		
		userService.updateProfile(user);
		
		//model.addAttribute("user", user);
		
		return "redirect:/user/list";
	}
	
	@RequestMapping( value="/insertview", method=RequestMethod.GET )
	public String insertview() throws Exception{
	
		System.out.println("/user/insert : GET");
		
		return "/page5";
	}
	
	@RequestMapping( value="insert", method=RequestMethod.POST )
	public String insert( @ModelAttribute("user")  User user, Model model) throws Exception{
	
		System.out.println("/user/updateProfile : POST");
		
		System.out.println(user);
		
		userService.insert(user);
		
		//model.addAttribute("user", user);
		
		return "redirect:/user/list";
	}
	
	
}
