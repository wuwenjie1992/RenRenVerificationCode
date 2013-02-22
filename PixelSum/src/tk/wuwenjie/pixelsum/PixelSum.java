package tk.wuwenjie.pixelsum;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import javax.imageio.ImageIO;

/**
 * @author wuwenjie
 * @version 20130218 RenRenVerificationCode v 0.0.1
 */
public class PixelSum {

	static MyImage mi;
	static int[][] out = null;
	static int i, j;
	static String inpath, outpath, t_s;
	static FileWriter fw;

	/**
	 * @param args
	 */
	public static void main(String[] args) {

		System.out.println("Running:");

		// System.out.println(System.getProperty("user.dir")+System.getProperty("file.separator"));
		// System.out.println(System.getProperty("user.home"));

		// 分析传入参数
		for (i = 0; i < args.length; i++) {
			//System.out.println(args[i]);
			if (i == 0) {
				inpath = args[0];
				System.out.println("read from:" + args[0]);
			} else if (i == 1) {
				outpath = args[1];
				System.out.println("saved to:" + args[1]);
			} else {
				break;
			}
		}

		try {
			mi = new MyImage();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// inpath = "/home/wuwenjie/hello/EX/1.1.F.jpg";
		out = mi.getImageNum(inpath);
		// outpath = "/home/wuwenjie/hello/EX/1.txt";

		// 输出到文件
		try {
			fw = new FileWriter(outpath, true);// public FileWriter(String
												// fileName,boolean append)

			for (j = 0; j < mi.ih; j++) {
				for (i = 0; i < (mi.iw) / 4; i++) {

					t_s = Integer.toString(out[i][j]);
					// System.out.print(t_s);
					fw.append(t_s);

				}// for 2

				// System.out.println();
			}// for1

			t_s = "\n";
			fw.append(t_s);
			fw.flush();
			fw.close();

		} catch (IOException e) {
			e.printStackTrace();
		}

	}// 主函数

	public static class MyImage {
		// static BufferedImage bim; //待识别图像
		// public final static String path="/home/wuwenjie/hello/";
		int iw;
		int ih;

		public MyImage() throws IOException {

			super();
		}

		// 得到图像的值
		public int[][] getImageNum(String file) {

			int[][] num = null;

			BufferedImage bim = null;

			File ifile = new File(file);
			int tmp = 0;
			int sum = 0;

			if (ifile.exists()) {// 如果文件存在

				try {
					bim = ImageIO.read(ifile);
				} catch (Exception e) {
					e.printStackTrace();
				}

				iw = bim.getWidth();// 图像宽
				ih = bim.getHeight();// 图像高
				num = new int[iw / 4][ih];

				// BufferedImage bims = new BufferedImage(iw, ih,
				// BufferedImage.TYPE_INT_RGB);

				for (int y = 0; y < ih; y++) {
					for (int x = 0; x < iw; x++) {

						tmp = bim.getRGB(x, y);

						// System.out.print("tmp" + x + "=" + tmp + "	");

						if (tmp <= -1184274) {// 16777216=256 * 256 * 256
												// 1184274#121212
							sum++;
							// bims.setRGB(x, y, 0x000000);//黑
						} else {
							// bims.setRGB(x, y, 0xFFFFFF);//白
						}

						if (x % 4 == 0) {

							num[x / 4][y] = sum;

							sum = 0;

							// System.out.print("num=" + num[x / 4][y] + "	");

						}

					}
					// System.out.println("\n");
				}// for1

				// try {
				// ImageIO.write(bims, "jpg", new File(
				// "/home/wuwenjie/hello/f_1184274.jpg"));
				// } catch (IOException e) {
				// e.printStackTrace();
				// }

			} else {
				System.out.println("不存在！");
			}
			return num;
		}// getImageNum
	}// MyImage

}
