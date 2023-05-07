//package bitcamp.miniproject.common;
//
//import org.springframework.web.bind.annotation.ControllerAdvice;
//import org.springframework.web.bind.annotation.ExceptionHandler;
//import org.springframework.web.servlet.ModelAndView;
//
//import javax.servlet.http.HttpServletRequest;
//
//@ControllerAdvice
//public class Error {
//    @ExceptionHandler(NullPointerException.class)
//    public ModelAndView handleNullPointerException(HttpServletRequest request, Exception ex) {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("common/nullError");
//        return modelAndView;
//    }
//
//    @ExceptionHandler(NumberFormatException.class)
//    public ModelAndView handleNumberFormatException(HttpServletRequest request, Exception ex) {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("common/numberFormatError");
//        return modelAndView;
//    }
//
//    @ExceptionHandler(Exception.class)
//    public ModelAndView handleException(HttpServletRequest request, Exception ex) {
//        ModelAndView modelAndView = new ModelAndView();
//        modelAndView.setViewName("common/error");
//        return modelAndView;
//    }
//}
