package admin.action;

import javax.annotation.Resource;

import org.seasar.framework.util.StringUtil;
import org.seasar.struts.annotation.Execute;

import admin.service.AdminService;
import coupon.entity.IAdminAuthentication;
import coupon.service.ShopService;

/**
 * 管理者ログイン
 */
public class LoginAction extends BaseAction {
	
	@Resource
	protected AdminService adminService;
	@Resource
	protected ShopService shopService;
	
	public String email;
	public String password;
	
	public String errorMsg;
	
	@Execute(validator=false)
	public String index() {
		return "login.ftl";
	}
	@Execute(validator=false)
	public String login() throws Exception {
		
		// 入力チェック
		if (!this.checkInput()) {
			return "login.ftl";
		}
		
//		// ログインチェック
//		if (!userService.checkLogin(email, password)) {
//			errorMsg = "emailまたはパスワードが間違っています";
//			return "/login/login.ftl";
//		}
		
		IAdminAuthentication iUserAuthentication = adminService.getIAdminAuth(email, password);
		if (iUserAuthentication == null) {
			errorMsg = "アカウント情報が存在しません。新規登録してください";
			return "login.ftl";
		}
		
		loginAdminDto.shopId = iUserAuthentication.shopId;
		
		return "/menu?redirect=true";
	}
	
	/**
	 * 入力チェック
	 * @return
	 */
	private boolean checkInput() {
		
		if (StringUtil.isEmpty(email) || StringUtil.isEmpty(password)) {
			errorMsg = "emailとpasswordの両方を入力してください";
			return false;
		} else {
			//Eメール　の正規表現パターン  
			String emailPattern = "[0-9a-zA-Z_\\-]+@[0-9a-zA-Z_\\-]+(\\.[0-9a-zA-Z_\\-]+){1,}"; 
			if (!email.matches(emailPattern)) {
				errorMsg = "正しいemailアドレスを入力してください";
				return false;
			}
		}
		return true;
	}
}
