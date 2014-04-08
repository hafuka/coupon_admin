package admin.util;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.seasar.framework.util.ResourceUtil;

/**
 * 画像ファイル操作ユーディリティ
 *
 * @author hafuka
 *
 */
public final class Images {

	// サーバーの画像パス
	public static final String IMAGE_URL = ResourceUtil.getProperties("coupon.properties").getProperty("imageUrl");
	// 画像作成用のパス
	public static final String IMAGE_FILE_PATH = "/var/www/images/coupon/";

	private Images(){}

	/**
	 * 画像出力
	 * @param filePath
	 * @param imageData
	 * @throws IOException
	 */
	public static void writeImage(String fileName, byte[] imageData) throws IOException {
		// byte[]⇒BufferedImage変換
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageData));
		File file = new File(IMAGE_FILE_PATH + fileName);

		if (!file.exists()) {
			file.mkdirs();
		}
		ImageIO.write(image, "jpg", file);
	}

	public static String getImageFilePath(Integer shopId) {
		return IMAGE_URL + shopId + ".jpg";
	}

	public static String getNoImagePath() {
		return "/coupon/no_image.png";
	}

}
