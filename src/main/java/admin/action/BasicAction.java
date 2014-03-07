package admin.action;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.lang.StringUtils;
import org.apache.struts.util.LabelValueBean;
import org.seasar.struts.annotation.Execute;

import coupon.entity.MShop;
import coupon.service.PullDownService;
import coupon.service.ShopService;
import coupon.util.Images;

public class BasicAction extends BaseAction {

	@Resource
	protected ShopService shopService;
	@Resource
	protected PullDownService pullDownService;

	/** IN項目 */
	public String shopName;
	public String description;
	public String url;
	public String address;
	public String tell;
	public String station;
	public String hdn_imamge;

	public Integer areaId;
	public Integer areaDetailId;
	public Integer businessId;

	/** OUT項目 */
	public MShop shop;
	public List<LabelValueBean> areaList;
	public List<LabelValueBean> areaDetailList;
	public List<LabelValueBean> businessList;

	public int dispAreaId;
	public int dispAreaDetailId;
	public int dispBusinessId;

	@Execute(validator = false)
	public String index() {
		this.shop = shopService.getMShop(loginAdminDto.shopId);
		this.areaList = pullDownService.getAreaList();
		this.businessList = pullDownService.getBusinessList();

		if (shop != null) {
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

		MShop mShop = new MShop();
		mShop.shopId = loginAdminDto.shopId;
		mShop.shopName = this.shopName;
		mShop.description = this.description;
		mShop.url = this.url;
		mShop.address = this.address;
		mShop.tell = this.tell;
		mShop.station = this.station;
		mShop.premiumFlg = 0;
		mShop.businessId = businessId;
		mShop.areaId = areaId;
		mShop.areaDetailId = areaDetailId;
		shopService.insertMShop(mShop);

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
