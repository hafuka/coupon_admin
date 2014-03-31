package admin.action;

import javax.annotation.Resource;

import org.seasar.struts.annotation.Execute;

import admin.service.AdminService;
import coupon.entity.IAdminAuthentication;

public class ChangeMailAction extends BaseAction {

	@Resource
	protected AdminService adminService;

	public String newEmail;
	public String errorMsg;

	/**
	 * 初期表示
	 * @return
	 * @throws Exception
	 */
	@Execute(validator = false)
	public String index() throws Exception {
		return "change_mail.ftl";
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
		adminService.updateEmail(adminAuth, newEmail);

		loginAdminDto.mail = this.newEmail;

		return "result.ftl";
	}
}
