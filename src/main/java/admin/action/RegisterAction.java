package admin.action;

import javax.annotation.Resource;

import org.seasar.struts.annotation.Execute;

import admin.service.AdminService;

public class RegisterAction extends BaseAction {
	
	@Resource
	protected AdminService adminService;
	
	public String email;
	public String password;
	
	@Execute(validator=false)
	public String index() throws Exception {
		return "register.ftl";
	}
	
	@Execute(validator=false)
	public String regist() throws Exception {
		Integer shopId = adminService.regist(email, password);
		loginAdminDto.shopId = shopId;
		return "/menu?redirect=true";
	}
}
