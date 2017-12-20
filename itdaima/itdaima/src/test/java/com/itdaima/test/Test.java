package com.itdaima.test;

import com.itdaima.common.utils.DateUtils;
import com.itdaima.common.utils.StringUtils;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.geom.AffineTransform;
import java.awt.image.*;
import java.io.*;
import java.util.*;

public class Test {

	/*public static void main (String[] args) {
		Calendar c = Calendar.getInstance();

	//	c.setFirstDayOfWeek(Calendar.MONDAY - 1);

		String startMonth = DateUtils.formatDate(c.getTime(), "yyyy-MM");
		System.out.println(startMonth);

		String group = "<img alt=\"测试\" src=\"/itdaima/uploadImage/201707/1500649338917.jpg\" style=\"height:172px; width:775px\" />";
		String url =group.substring(group.indexOf("src=\"")+5,group.indexOf("\" style"));
		System.out.println(url);


		scale("E:\\MyIdea\\images\\QQ截图20170728115105.jpg","E:\\MyIdea\\images\\img\\QQ截图20170728115105.jpg");

	}



	public static void scale(String srcImageFile, String result){
		try
		{
			BufferedImage src = ImageIO.read(new File(srcImageFile)); // 读入文件
			int width = src.getWidth(); // 得到源图宽
			int height = src.getHeight(); // 得到源图长
			if(width>650 && height>360){
				width = 650;
				height = 360;
			}
			if(width>650 && height<360){
				width = 650;
			}
			if(width<650 && height>360){
				height = 360;
			}
			Image image = src.getScaledInstance(width, height, Image.SCALE_DEFAULT);
			BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
			Graphics g = tag.getGraphics();
			g.drawImage(image, 0, 0, null); // 绘制缩小后的图
			g.dispose();
			ImageIO.write(tag, "JPEG", new File(result));// 输出到文件流
		}
		catch (IOException e)
		{
			e.printStackTrace();
		}
	}*/
	public static void main (String[] args) {
		String str="<p><a href=\"/userfiles/1/images/1097fdc2eb594e62ae904b0e2c152876.jpeg\" target=\"_blank\" " +
				"class=\"thumbnail\"><img alt=\"13.50\" data-original=\"/userfiles/1/images/1097fdc2eb594e62ae904b0e2c152876.jpeg\" " +
				"class=\"lazy\" src=\"/static/jquery/grey.gif\" /></a></p>";


		java.util.List<String> img = StringUtils.getImg(str,"123123");


		System.out.println(img.get(0));
	}





}
