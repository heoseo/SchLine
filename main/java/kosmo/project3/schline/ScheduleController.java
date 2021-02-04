package kosmo.project3.schline;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ScheduleController {

	//일정>알림 이동.
	@RequestMapping("/schedule/alertList.do")
	public String alertListGo() {
		
		System.out.println("■■[Schedule컨트롤러 > alertList.do 요청 들어옴.]■■");

		return "/schedule/alertList";
	}

	//일정>알림>왼쪽바 알림 클릭시 이동.
	@RequestMapping("/schedule/calendar.do")
	public String calendarLeftGo() {
		
		System.out.println("■■ [Schedule컨트롤러 > calendarLeft.do 요청 들어옴.]■■");

		return "/schedule/calendar";
	}
	
//#################################################################################
	
	//일정>알림>공지읽음 클릭시 이동.
	@RequestMapping("/schedule/alertNoticeRead.do")
	public String alertNoticeReadGo() {
		
		System.out.println("■■ [Schedule컨트롤러 > alertNoticeRead.do 요청 들어옴.]■■");

		return "/schedule/alertNoticeRead";
	}
	
	//일정>알림>공지읽음 클릭시 이동.
	@RequestMapping("/schedule/alertNoticeNotRead.do")
	public String alertNoticeNotReadGo() {
		
		System.out.println("■■ [Schedule컨트롤러 > alertNoticeRead.do 요청 들어옴.]■■");

		return "/schedule/alertNoticeNotRead";
	}
	
	//일정>알림>공지읽음 클릭시 이동.
	@RequestMapping("/schedule/correction.do")
	public String correctionGo() {
		
		System.out.println("■■ [Schedule컨트롤러 > alertNoticeRead.do 요청 들어옴.]■■");

		return "/schedule/correction";
	}
	
	//일정>알림>공지읽음 클릭시 이동.
	@RequestMapping("/schedule/deadLine.do")
	public String deadLineGo() {
		
		System.out.println("■■ [Schedule컨트롤러 > alertNoticeRead.do 요청 들어옴.]■■");

		return "/schedule/deadLine";
	}
	

}
