package admin.action;

import org.seasar.struts.annotation.Execute;

/**
 * 使い方ページ
 */
public class HowtoAction extends BaseAction {

	@Execute(validator = false)
	public String index() {
		return "howto.ftl";
	}

}
