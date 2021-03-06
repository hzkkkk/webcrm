package com.hj.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class CodeUtil {
	private static final String[] chars = { "0", "1", "2", "3", "4", "5", "6",
		"7", "8", "9", "a", "b", "c" };
private static final int SIZE = 4;
private static final int LINES = 8;
private static final int WIDTH = 55;
private static final int HEIGHT = 25;
private static final int FONT_SIZE = 16;

public static Map<String,BufferedImage> createImage() {
	StringBuffer sb = new StringBuffer();
	BufferedImage image = new BufferedImage(WIDTH, HEIGHT,
			BufferedImage.TYPE_INT_RGB);
	Graphics graphic = image.getGraphics();
	graphic.setColor(Color.WHITE);
	graphic.fillRect(0, 0, WIDTH, HEIGHT);
	Random ran = new Random();
	//画随机字符
	for(int i=1;i<=SIZE;i++){
		
		int r = ran.nextInt(chars.length);
		graphic.setColor(getRandomColor());
		graphic.setFont(new Font(null,Font.BOLD+Font.ITALIC,FONT_SIZE));
		graphic.drawString(chars[r],(i-1)*WIDTH/SIZE , HEIGHT/2);
		sb.append(chars[r]);//将字符保存，存入Session
	}
	//画干扰线
	for(int i=2;i<=LINES;i++){
		graphic.setColor(getRandomColor());
		graphic.drawLine(ran.nextInt(WIDTH), ran.nextInt(HEIGHT), ran.nextInt(WIDTH),ran.nextInt(HEIGHT));
	}
	Map<String,BufferedImage> map = new HashMap<String,BufferedImage>();
	map.put(sb.toString(), image);
	return map;
}

public static Color getRandomColor(){
	Random ran = new Random();
	Color color = new Color(ran.nextInt(256),ran.nextInt(256),ran.nextInt(256));
	return color;
}
}
