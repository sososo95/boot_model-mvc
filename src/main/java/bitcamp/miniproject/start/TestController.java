package bitcamp.miniproject.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {

    @GetMapping("/")
    public String test() {
        System.out.println("test");
        return "WEB-INF/views/logonView";
    }

}
