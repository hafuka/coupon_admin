package admin.service.impl;

import java.sql.Timestamp;

import javax.annotation.Resource;

import admin.service.AdminService;
import coupon.dao.IAdminAuthenticationDao;
import coupon.dao.MShopDao;
import coupon.entity.IAdminAuthentication;
import coupon.util.CouponDateUtils;
import coupon.util.CryptUtils;

public class AdminServiceImpl implements AdminService {

	@Resource
	protected IAdminAuthenticationDao iAdminAuthenticationDao;
	@Resource
	protected MShopDao mShopDao;

	@Override
	public Integer regist(String email, String password) throws Exception {

		Timestamp nowDate = CouponDateUtils.getCurrentDate();
		Integer shopId = iAdminAuthenticationDao.findMaxShopId() + 1;
		IAdminAuthentication record = new IAdminAuthentication();
		record.shopId = shopId;
		record.email = email;
		record.password = CryptUtils.encrypt(password);
		record.insDatetime = nowDate;
		record.updDatetime = nowDate;
		iAdminAuthenticationDao.insert(record);

		return shopId;

	}

	@Override
	public IAdminAuthentication getIAdminAuth(String email, String password) throws Exception {
		return iAdminAuthenticationDao.findByEmailAndPassword(email, password);
	}

	@Override
	public void updateEmail(IAdminAuthentication iAdminAuthentication, String newEmail) throws Exception {
		iAdminAuthentication.email = newEmail;
		iAdminAuthentication.updDatetime = CouponDateUtils.getCurrentDate();
		iAdminAuthenticationDao.update(iAdminAuthentication);
	}

	@Override
	public void updatePassword(IAdminAuthentication iAdminAuthentication, String newPassword) throws Exception {
		iAdminAuthentication.password = CryptUtils.encrypt(newPassword);
		iAdminAuthentication.updDatetime = CouponDateUtils.getCurrentDate();
		iAdminAuthenticationDao.update(iAdminAuthentication);
	}

}
