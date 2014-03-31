package admin.action;

import javax.annotation.Resource;

import org.seasar.struts.annotation.Execute;

import admin.service.AdminService;
import coupon.entity.IAdminAuthentication;

public class ChangePasswordAction extends BaseAction {

	@Resource
	protected AdminService adminService;

	public String newPassword;
	public String errorMsg;

	/**
	 * 初期表示
	 * @return
	 * @throws Exception
	 */
	@Execute(validator = false)
	public String index() throws Exception {
		return "change_pwd.ftl";
	}

	/**
	 * 更新処理
	 * @return
	 * @throws Exception
	 */
	@Execute(validator = false)
	public String update() throws Exception {

		IAdminAuthentication adminAuth = adminService.getIAdminAuth(loginAdminDto.mail, loginAdminDto.password);
		if (adminAuth == null) {
			throw new Exception("IAdminAuthentication is null.");
		}
		adminService.updatePassword(adminAuth, this.newPassword);

		loginAdminDto.password = this.newPassword;

		return null;
	}
}
