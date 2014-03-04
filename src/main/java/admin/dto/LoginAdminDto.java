package admin.dto;

import java.io.Serializable;

import org.seasar.framework.container.annotation.tiger.Component;
import org.seasar.framework.container.annotation.tiger.InstanceType;

/**
 * ログインユーザー情報
 */
@Component(instance = InstanceType.SESSION)
public class LoginAdminDto implements Serializable {
	public Integer shopId;
}