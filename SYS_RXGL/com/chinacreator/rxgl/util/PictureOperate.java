package com.chinacreator.rxgl.util;

import java.awt.Graphics;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.image.BufferedImage;
import java.awt.image.CropImageFilter;
import java.awt.image.FilteredImageSource;
import java.awt.image.ImageFilter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.io.Serializable;

import javax.imageio.ImageIO;

import com.chinacreator.common.helper.ValidateHelper;

public class PictureOperate implements Serializable{
	private static final long serialVersionUID = 1317859244394323096L;

	private int x;
	
	private int y;
	
	private int width;
	
	private int height;
	
	public PictureOperate(int x,int y, int width, int height){
		this.x = x;
		this.y = y;
		this.width = width;
		this.height = height;
	}
	
	//裁剪图片
	public File picCut(String fileName,InputStream is) throws Exception{
		if(is == null){
			throw new FileNotFoundException("源文件不存在!");
		}else if(ValidateHelper.isNotEmptyString(fileName)){
			throw new Exception("需要生成的文件名为空!");
		}
		//生成的目标文件
		File goalFile = new File(fileName);
		Graphics g = null;
		try{
			//图片过滤器
			ImageFilter imgF = new CropImageFilter(this.x,this.y,this.width,this.height);
			//从流中读取源图像
			BufferedImage buffImg = ImageIO.read(is);
			//根据过滤器和源图像生成剪裁后的图像
			Image img = Toolkit.getDefaultToolkit().createImage(new FilteredImageSource(buffImg.getSource(),imgF));
			//创建一个与剪裁后大小相同的图像
			BufferedImage newImg = new BufferedImage(this.width,this.height,BufferedImage.TYPE_INT_BGR);
			g = newImg.getGraphics();
			//把剪裁后的图像绘到新的图像上
			g.drawImage(img, 0,0,null);
			//生成目标文件
			ImageIO.write(newImg, "jpg", goalFile);
		}catch (Exception e) {
			goalFile = null;
			throw e;
		}
		
		finally{
			if(g != null){
				//释放绘图工具引用的资源
				g.dispose();
			}
		}
		return goalFile;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getWidth() {
		return width;
	}

	public void setWidth(int width) {
		this.width = width;
	}

	public int getHeight() {
		return height;
	}

	public void setHeight(int height) {
		this.height = height;
	}
}
