package admin.dto;

import org.seasar.mai.mail.MailAddress;

public class RegistMailDto {
	//
	public MailAddress[] to;
	//
	public MailAddress[] cc;
	//
	public MailAddress[] bcc;

	public String loginPassword;

	public MailAddress[] getTo() {
		return to;
	}

	public void setTo(MailAddress[] to) {
		this.to = to;
	}

	public MailAddress[] getCc() {
		return cc;
	}

	public void setCc(MailAddress[] cc) {
		this.cc = cc;
	}

	public MailAddress[] getBcc() {
		return bcc;
	}

	public void setBcc(MailAddress[] bcc) {
		this.bcc = bcc;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

}