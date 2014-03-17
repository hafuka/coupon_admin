package admin.action;

import javax.annotation.Resource;

import org.seasar.mai.mail.MailAddress;
import org.seasar.struts.annotation.Execute;

import admin.dto.RegistMailDto;
import admin.mai.MailMai;
import admin.service.AdminService;
import coupon.service.ShopService;
import coupon.util.CryptUtils;

public class RegisterAction extends BaseAction {

	@Resource
	protected AdminService adminService;
	@Resource
	protected ShopService shopService;

	@Resource
	protected MailMai mailMai;

	public String email;

	@Execute(validator=false)
	public String index() throws Exception {
		return "register.ftl";
	}

	@Execute(validator=false)
	public String regist() throws Exception {
		Integer shopId = shopService.findNextShopId();
		String password = CryptUtils.encrypt(shopId.toString());
		RegistMailDto mailDto = new RegistMailDto();
		mailDto.to = new MailAddress[]{new MailAddress(email)};
		mailDto.loginPassword = password;
		mailMai.sendRegistMail(mailDto);
		return "regist_result.ftl";
	}
}
