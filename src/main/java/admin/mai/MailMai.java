package admin.mai;

import org.seasar.mai.annotation.Subject;

import admin.dto.RegistMailDto;

/**
 * メールサービス
 */
public interface MailMai {

  @Subject("【COUPON-ISLAND】会員登録完了のお知らせ")
  public void sendRegistMail(RegistMailDto dto);

}
