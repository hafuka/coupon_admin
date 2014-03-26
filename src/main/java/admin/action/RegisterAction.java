package admin.action;

import javax.annotation.Resource;

import org.apache.commons.lang.RandomStringUtils;
import org.seasar.mai.mail.MailAddress;
import org.seasar.struts.annotation.Execute;

import admin.dto.RegistMailDto;
import admin.mai.MailMai;
import admin.service.AdminService;

public class RegisterAction extends BaseAction {

	@Resource
	protected AdminService adminService;


	@Resource
	protected MailMai mailMai;

	public String email;

	@Execute(validator=false)
	public String index() throws Exception {
		return "register.ftl";
	}

	@Execute(validator=false)
	public String regist() throws Exception {
		// 6桁のランダム文字列をログインパスワードとする
		String password = RandomStringUtils.randomAlphanumeric(6);
		RegistMailDto mailDto = new RegistMailDto();
		mailDto.to = new MailAddress[]{new MailAddress(email)};
		mailDto.loginPassword = password;
		mailMai.sendRegistMail(mailDto);

		// 管理者認証情報登録
		adminService.regist(email, password);

		return "regist_result.ftl";
	}
}
