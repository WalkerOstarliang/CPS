package com.chinacreator.rxgl.action;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import org.apache.commons.codec.binary.Base64;

import com.chinacreator.common.bean.LoginInfo;
import com.chinacreator.common.constant.CommonConstant;
import com.chinacreator.common.cps.action.CPSBaseAction;
import com.chinacreator.common.helper.ActionContextHelper;
import com.chinacreator.common.helper.CommonDBBaseHelper;
import com.chinacreator.common.helper.DictionaryCacheHellper;
import com.chinacreator.common.helper.ValidateHelper;
import com.chinacreator.lsgl.bean.RkzpxxBean;
import com.chinacreator.lsgl.services.LsglRkService;
import com.chinacreator.lsgl.services.impl.LsglRkServiceImpl;
import com.chinacreator.remote.business.RemoteRequestService;
import com.chinacreator.rxgl.util.ImageUtils;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class RxglAction extends CPSBaseAction 
{

	private static final long serialVersionUID = 3504871552919314015L;
	
	private LsglRkService lsglrkService;
	private RemoteRequestService remoteService;
	private File[] uploads;
	
	private String[] uploadsFileName;
	
	private RkzpxxBean rkzpBean;
	
	private List<RkzpxxBean> rkzpBeanList = null;
	
	private String rybh;
	
	private String sfzh;
	
	private String zpid;
	
	private String saveFileName;
	
	private int x;
	
	private int y;
	
	private int w;
	
	private int h;
	
	public RxglAction(){
		super();
		lsglrkService = new LsglRkServiceImpl();
		remoteService = new RemoteRequestService(); 
	}
	
	public String toRyzpglPageInfo()
	{
		try
		{
			rkzpBeanList = lsglrkService.queryRkzpxxBeansByRybh(rybh);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			rkzpBeanList = new ArrayList<RkzpxxBean>();
		}
		return "toRyzpglPageInfo";
	}
	
	public void uploadFile()
	{
		String tempAccessPath = "";
		try
		{
			
			String tempPath = DictionaryCacheHellper.getSystemParamenterValueByKey("rxgl.image.upload.path");
			File pathf = new File(tempPath);
			if (!pathf.exists() && !pathf.isDirectory())
			{
				pathf.mkdirs();
			}
			if (ValidateHelper.isNotEmptyArray(uploads))
			{
				String fileName = UUID.randomUUID().toString();
				String extname = uploadsFileName[0].substring(uploadsFileName[0].lastIndexOf("."));
				String tempFileName = tempPath + "/" + fileName + extname;
				saveFileName = fileName + extname;
				tempAccessPath = request.getContextPath() + "/rk/rxgl/showUploadImage.action?saveFileName=" + saveFileName;
				FileOutputStream fos = new FileOutputStream(tempFileName);
				byte[] b = new byte[1024];
				FileInputStream fis = new FileInputStream(uploads[0]);
				while(fis.read(b) > 0)
				{
					fos.write(b);
				}
				fis.close();
				fos.close();
			}
			String json = "{\"tempAccessPath\":\"" + tempAccessPath + "\",\"saveFileName\":\"" + saveFileName + "\"}";
			responseWrite(json);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			if (e instanceof FileNotFoundException)
			{
				responseWrite("sizeisnull");
			}
			else
			{
				responseWrite("updateerror");
			}
		}
	}
	
	public void showUploadImage()
	{
		String tempPath = DictionaryCacheHellper.getSystemParamenterValueByKey("rxgl.image.upload.path");
		String path = tempPath + "/" + saveFileName;
		FileInputStream fis = null;
		OutputStream os = null;
		try
		{
			os = response.getOutputStream();
			fis = new FileInputStream(new File(path));
			byte[] b = new byte[1024];
			while(fis.read(b) > 0)
			{
				os.write(b);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				fis.close();
				os.close();
			}
			catch(Exception e1)
			{
			}
		}
	}
	
	/**
	 * 保存远程服务照片
	 * 
	 * @date Feb 23, 2014 10:42:42 AM
	 */
	public void saveRemoteZpxx()
	{
		String zpid = "";
		LoginInfo loginInfo = ActionContextHelper.getLoginInfo();
		OutputStream out = null;
		File zpfile = null;
		try
		{
			String jpegStr = remoteService.queryXpBySfzh(sfzh);
			if (ValidateHelper.isNotEmptyString(jpegStr))
			{
				//先把照片存放到本地，然后再读取本地临时文件，最后删除
				String tempPath = DictionaryCacheHellper.getSystemParamenterValueByKey("rxgl.image.upload.path");
				File pathf = new File(tempPath);
				if (!pathf.exists() && !pathf.isDirectory())
				{
					pathf.mkdirs();
				}
				String tempfilename = UUID.randomUUID().toString() + ".jpg";
				out = new FileOutputStream(tempPath + "/" + tempfilename);
				
				ImageIcon imgIcon = new ImageIcon(Base64.decodeBase64(jpegStr.getBytes()));
				
				Image theImg = imgIcon.getImage();
				int width = theImg.getWidth(null);
				int height = theImg.getHeight(null);
				
				BufferedImage bimage = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
				
				Graphics2D g = bimage.createGraphics();
				g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);  
				g.setColor(Color.red);
				g.setBackground(Color.white);
				g.drawImage(theImg, 0, 0, null);
				g.dispose();
				
				JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(out);
				JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(bimage);
				param.setQuality(50f, true);
				encoder.encode(bimage, param);
 
				zpfile = new File(tempPath + "/" + tempfilename);
				zpid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"seq_lsg_zpid");
				rkzpBean = new RkzpxxBean();
				rkzpBean.setId(zpid);
				rkzpBean.setRxfw("01"); //正面照
				rkzpBean.setDjdwdm(loginInfo.getOrgcode());
				rkzpBean.setDjdwmc(loginInfo.getOrgname());
				rkzpBean.setDjrxm(loginInfo.getRealname());
				rkzpBean.setMs("远程服务照片");
				rkzpBean.setRybh(rybh);
				rkzpBean.setSfzh(sfzh);
				rkzpBean.setYcfwzp("1");
				rkzpBean.setZp(zpfile);
				lsglrkService.saveRkzpxxBean(rkzpBean);
				
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		finally
		{
			try
			{
				out.close();
				
				//删除临时文件
				zpfile.delete();
			}
			catch(Exception e)
			{
				e.printStackTrace();
			}
		}
		responseWrite(zpid);
	}
	public void deleteRkzpImage() throws Exception
	{
		try
		{
			lsglrkService.deleteRkzpImage(zpid);
			responseWrite(true);
		}
		catch(Exception e)
		{
			e.printStackTrace();
			responseWrite(false);
		}
		
	}
	
	public void saveCutImage()
	{
		String zpid = "";
		try
		{
			String tempPath = DictionaryCacheHellper.getSystemParamenterValueByKey("rxgl.image.upload.path");
			File pathf = new File(tempPath);
			if (!pathf.exists() && !pathf.isDirectory())
			{
				pathf.mkdirs();
			}
			File sourcefileimg = new File(tempPath + "/" + saveFileName);
			String tempfilename = System.currentTimeMillis() + saveFileName.substring(saveFileName.lastIndexOf("."));
			File fileDest = new File(tempPath + "/" + tempfilename);
			boolean cutsuccess = cutImage(sourcefileimg, fileDest, x, y, w, h);
			if (cutsuccess)
			{
				zpid = CommonDBBaseHelper.getSequence(CommonConstant.DBNAME_SQJW,"seq_lsg_zpid");
				rkzpBean.setId(zpid);
				rkzpBean.setZp(fileDest);
				rkzpBean.setYcfwzp("0");//不是远程服务照片
				lsglrkService.saveRkzpxxBean(rkzpBean);
				//删除临时文件
				sourcefileimg.delete();
				fileDest.delete();
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		responseWrite(zpid);
	}
	
	public boolean cutImage(File sourceimg, File fileDest, int x, int y, int w, int h) throws IOException 
	{      
		if(!fileDest.getParentFile().exists()) 
		{
			fileDest.getParentFile().mkdirs();      
		}
		String ext = ImageUtils.getExtension(fileDest).toLowerCase();      
		BufferedImage bi = (BufferedImage)ImageIO.read(sourceimg);      
		h = Math.min(h, bi.getHeight());      
		w = Math.min(w, bi.getWidth());      
		if(h <= 0) h = bi.getHeight();      
		if(w <= 0) w = bi.getWidth();      
		y = Math.min(Math.max(0, y), bi.getHeight()-h);      
		x = Math.min(Math.max(0, x), bi.getWidth()-w);      
		BufferedImage bi_cropper = bi.getSubimage(x, y, w, h);
		return ImageIO.write(bi_cropper, ext, fileDest);      
	}     

	
	public String getRybh()
	{
		return rybh;
	}

	public void setRybh(String rybh)
	{
		this.rybh = rybh;
	}

	public String getSfzh()
	{
		return sfzh;
	}

	public void setSfzh(String sfzh)
	{
		this.sfzh = sfzh;
	}

	public RkzpxxBean getRkzpBean()
	{
		return rkzpBean;
	}

	public void setRkzpBean(RkzpxxBean rkzpBean)
	{
		this.rkzpBean = rkzpBean;
	}
	 
	public File[] getUploads()
	{
		return uploads;
	}

	public void setUploads(File[] uploads)
	{
		this.uploads = uploads;
	}

	public String[] getUploadsFileName()
	{
		return uploadsFileName;
	}

	public void setUploadsFileName(String[] uploadsFileName)
	{
		this.uploadsFileName = uploadsFileName;
	}

	public int getX()
	{
		return x;
	}

	public void setX(int x)
	{
		this.x = x;
	}

	public int getY()
	{
		return y;
	}

	public void setY(int y)
	{
		this.y = y;
	}

	public int getW()
	{
		return w;
	}

	public void setW(int w)
	{
		this.w = w;
	}

	public int getH()
	{
		return h;
	}

	public void setH(int h)
	{
		this.h = h;
	}

	public String getSaveFileName()
	{
		return saveFileName;
	}

	public void setSaveFileName(String saveFileName)
	{
		this.saveFileName = saveFileName;
	}

	public List<RkzpxxBean> getRkzpBeanList()
	{
		return rkzpBeanList;
	}

	public void setRkzpBeanList(List<RkzpxxBean> rkzpBeanList)
	{
		this.rkzpBeanList = rkzpBeanList;
	}

	public String getZpid()
	{
		return zpid;
	}

	public void setZpid(String zpid)
	{
		this.zpid = zpid;
	}
	
}
