package admin.action;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.util.LabelValueBean;
import org.seasar.struts.annotation.Execute;

import coupon.dao.MShopCouponDao;
import coupon.entity.MShop;
import coupon.entity.MShopCoupon;
import coupon.enums.RarityType;
import coupon.service.PullDownService;
import coupon.service.ShopService;
import coupon.util.Images;

public class BasicAction extends BaseAction {

	@Resource
	protected ShopService shopService;
	@Resource
	protected PullDownService pullDownService;
	@Resource
	protected MShopCouponDao mShopCouponDao;

	/** IN項目 */
	public String shopName;
	public String description;
	public String url;
	public String address;
	public String tel;
	public String station;
	public String hdn_imamge;

	public String srCouponText;
	public String rCouponText;
	public String nCouponText;
	public Integer srScore;
	public Integer rScore;
	public Integer nScore;

	public Integer areaId;
	public Integer areaDetailId;
	public Integer businessId;

	/** OUT項目 */
	public MShop shop;
	public MShopCoupon srCoupon;
	public MShopCoupon rCoupon;
	public MShopCoupon nCoupon;
	public List<LabelValueBean> areaList;
	public List<LabelValueBean> areaDetailList;
	public List<LabelValueBean> businessList;

	public int dispAreaId;
	public int dispAreaDetailId;
	public int dispBusinessId;

	public String dispImagePath;

	@Execute(validator = false)
	public String index() {
		this.shop = shopService.getMShop(loginAdminDto.shopId);
		List<MShopCoupon> shopCoupons = shopService.getMShopCoupons(loginAdminDto.shopId);
		if (CollectionUtils.isNotEmpty(shopCoupons)) {
			for (MShopCoupon shopCoupon : shopCoupons) {
				RarityType type = RarityType.getEnum(shopCoupon.rarity);
				switch (type) {
				case SR:
					srCoupon = shopCoupon;
					break;
				case R:
					rCoupon = shopCoupon;
					break;
				case N:
					nCoupon = shopCoupon;
					break;
				default:
					throw new IllegalArgumentException("coupon rarity is error. rarity=" + shopCoupon.rarity);
				}
			}
		}

		this.areaList = pullDownService.getAreaList();
		this.businessList = pullDownService.getBusinessList();

		if (shop != null) {

			dispImagePath = Images.getImageFilePath(shop.shopId);

			if (shop.areaId != null) {
				this.areaDetailList = pullDownService.getAreaDetailList(shop.areaId);
				dispAreaId = shop.areaId;
			}
			if (shop.areaDetailId != null) {
				dispAreaDetailId = shop.areaDetailId;
			}
			if (shop.businessId != null) {
				dispBusinessId = shop.businessId;
			}
		}
		return "basic.ftl";
	}

	@Execute(validator = false)
	public String regist() throws FileNotFoundException, IOException {

		if (!StringUtils.isEmpty(this.hdn_imamge)) {
			String img = this.hdn_imamge;
			img = img.replaceFirst("data:image/jpeg;base64,", "");
			String fileName = loginAdminDto.shopId + ".jpg";
			Images.writeImage("/var/www/images/coupon/"+fileName, Base64.decodeBase64(img));
		}

		// ショップ情報登録
		MShop mShop = new MShop();
		mShop.shopId = loginAdminDto.shopId;
		mShop.shopName = this.shopName;
		mShop.description = this.description;
		mShop.url = this.url;
		mShop.address = this.address;
		mShop.tell = this.tel;
		mShop.station = this.station;
		mShop.premiumFlg = 0;
		mShop.businessId = this.businessId;
		mShop.areaId = this.areaId;
		mShop.areaDetailId = this.areaDetailId;
		shopService.registMShop(mShop);

		// SRクーポン登録
		if (StringUtils.isNotEmpty(this.srCouponText) && this.srScore != null) {
			MShopCoupon mShopCoupon = new MShopCoupon();
			mShopCoupon.shopId = loginAdminDto.shopId;
			mShopCoupon.couponId = 1;
			mShopCoupon.couponName = this.srCouponText;
			mShopCoupon.probability = this.srScore;
			mShopCoupon.limitDays = 7;
			mShopCoupon.rarity = RarityType.SR.value;
			shopService.registMShopCoupon(mShopCoupon);
		}

		// Rクーポン登録
		if (StringUtils.isNotEmpty(this.rCouponText) && this.rScore != null) {
			MShopCoupon mShopCoupon = new MShopCoupon();
			mShopCoupon.shopId = loginAdminDto.shopId;
			mShopCoupon.couponId = 2;
			mShopCoupon.couponName = this.rCouponText;
			mShopCoupon.probability = this.rScore;
			mShopCoupon.limitDays = 7;
			mShopCoupon.rarity = RarityType.R.value;
			shopService.registMShopCoupon(mShopCoupon);
		}

		// Nクーポン登録
		if (StringUtils.isNotEmpty(this.nCouponText) && this.nScore != null) {
			MShopCoupon mShopCoupon = new MShopCoupon();
			mShopCoupon.shopId = loginAdminDto.shopId;
			mShopCoupon.couponId = 3;
			mShopCoupon.couponName = this.nCouponText;
			mShopCoupon.probability = this.nScore;
			mShopCoupon.limitDays = 7;
			mShopCoupon.rarity = RarityType.N.value;
			shopService.registMShopCoupon(mShopCoupon);
		}

		this.shop = mShop;

		return "/basic?redirect=true";
	}

	/**
	 *
	 * @return
	 * @throws IOException
	 */
	@Execute(validator = false)
	public String changeArea() throws IOException {
		areaDetailList = new ArrayList<LabelValueBean>();
		if (this.areaId != 0) {
			areaDetailList = pullDownService.getAreaDetailList(areaId);
		}
        super.setJsonData(areaDetailList);
		return null;
	}
}
