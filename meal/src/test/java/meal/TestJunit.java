package meal;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.meal.member.dao.MemberDAO;
import com.meal.member.service.MemberService;
import com.meal.member.vo.MemberVO;

@WebAppConfiguration

//단위테스트를 스프링과 연동
@RunWith(SpringJUnit4ClassRunner.class)

//환경설정 파일 명시
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml", 
"file:src/main/webapp/WEB-INF/spring/mybatis-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml"})

public class TestJunit {

   @Autowired
   MemberService memberService;
   @Autowired
   MemberDAO memberDAO;

   @Test
   public void testDecode() throws Exception {
      MemberVO mem = new MemberVO();
      mem.setU_id("민슈");
      MemberVO min = memberService.decode("민슈");
      
      assertNotNull("min");
   }

}