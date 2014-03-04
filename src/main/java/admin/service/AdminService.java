package admin.service;

import coupon.entity.IAdminAuthentication;

public interface AdminService {
	
	public abstract Integer regist(String email, String password) throws Exception;

	public abstract IAdminAuthentication getIAdminAuth(String email, String password) throws Exception;

}
