package admin.mai;

import org.seasar.mai.annotation.Subject;

import admin.dto.RegistMailDto;

/**
 * メールサービス
 */
public interface MailMai {

  @Subject("【coupon island】店舗登録")
  public void sendRegistMail(RegistMailDto dto);

}
