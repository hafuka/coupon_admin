package admin.utils;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * 画像ファイル操作ユーディリティ
 * 
 * @author hafuka
 * 
 */
public class ImageFileUtils {

	private ImageFileUtils() {
	}

	/**
	 * 画像出力
	 * @param filePath
	 * @param imageData
	 * @throws IOException
	 */
	public static void writeImage(String filePath, byte[] imageData) throws IOException {
		// byte[]⇒BufferedImage変換
		BufferedImage image = ImageIO.read(new ByteArrayInputStream(imageData));
		File file = new File(filePath);
		if (!file.exists()) {
			file.mkdirs();
		}
		ImageIO.write(image, "jpg", file);
	}

}
