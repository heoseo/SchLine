package kosmo.project3.schline;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {
	
	@RequestMapping("/member/login.do")
	public String securityIndex2Login(Model model, Principal principal) {
		System.out.println("LoginController > login.do controller들어옴");
		String user_id = "";
		
		try {
			user_id = principal.getName();
			System.out.println("SecurityController > user_id : " + user_id);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		model.addAttribute("user_id", user_id);
		
		
		
		
		return "member/login";
	}
	
	@RequestMapping("/member/accessDenied.do")
	public String securityIndex2AccessDenied() {
		
		return "member/accessDenied";
	}

}
