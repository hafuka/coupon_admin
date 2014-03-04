package admin.action;

import org.seasar.struts.annotation.Execute;

/**
 * 管理者メニュー
 */
public class MenuAction {
	
	@Execute(validator=false)
	public String index() {
		return "menu.ftl";
	}
}
