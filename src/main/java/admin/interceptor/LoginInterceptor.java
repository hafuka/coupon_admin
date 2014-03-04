package admin.interceptor;

import java.util.Map;

import javax.annotation.Resource;

import org.aopalliance.intercept.MethodInvocation;
import org.seasar.framework.aop.interceptors.AbstractInterceptor;
import org.seasar.framework.container.SingletonS2Container;

import admin.dto.LoginAdminDto;


public class LoginInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	@Resource
	protected LoginAdminDto loginAdminDto;

	/**
	 * AbstractInterceptorを継承する際に、実装する必要のあるメソッド。
	 * 割り込ませる処理を記述。
	 */
	@Override
	public Object invoke(MethodInvocation invocation) throws Throwable {
		
		Map<String, Object> sessionScope = SingletonS2Container.getComponent("sessionScope");
		LoginAdminDto loginDto = (LoginAdminDto) sessionScope.get("loginAdminDto");
		// loginDtoがNULLだったり、NULLでなくてもコードがNULLの場合タイムアウトと見なす。
		if (loginDto == null || loginDto.shopId == null) {
			// タイムアウト画面
			return "/";	
		}
		
//		String cookieValue = null;
//		Cookie cookie[] = RequestUtil.getRequest().getCookies();
//    	if(cookie != null){
//    	    for(int i = 0; i < cookie.length; i++){
//    	        if(cookie[i].getName().equals("_coupon_island_login_")){
//    	        	cookieValue = cookie[i].getValue();
//    	        }
//    	    }
//    	}
//    	if (StringUtils.isEmpty(cookieValue)) {
//    		return "/";
//    	}
//    	IUserLogin userLogin = loginService.getIUserLogin(cookieValue);
//    	if (userLogin == null) {
//    		Cookie c = new Cookie("_coupon_island_login_", null);
//    		c.setMaxAge(0);  // 即死にする
//    		c.setPath(RequestUtil.getRequest().getContextPath());
//    		ResponseUtil.getResponse().addCookie(c);
//    		return "/";
//    	}
//    	
//    	loginUserDto.userId = userLogin.userId;
    	
		return invocation.proceed();
	}
}

