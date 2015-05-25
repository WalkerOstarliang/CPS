package com.chinacreator.tjbb.bean;

import java.util.Calendar;
import java.util.Date;

import com.chinacreator.common.bean.BaseValue;
import com.chinacreator.common.helper.DateTimeHelper;
import com.chinacreator.common.helper.ValidateHelper;

/**
 * 
 * 周统计情况
 * 
 * @filename WeekTjbbBean.java
 * @author mingchun.xiong
 * @date Feb 10, 2015
 *
 */
public class WeekTjbbBean extends BaseValue
{

	/**
	 * 
	 */
	private static final long	serialVersionUID	= -6006420582568854103L;
	
	private String tjdwdm;
	private int leve;
	private String tjrq;
	private String tjlb;
	
	private String onestart;
	private String oneend;
	private String twostart;
	private String twoend;
	private String threestart;
	private String threeend;
	private String fourstart;
	private String fourend;
	private String fivestart;
	private String fiveend;
	private String sixstart;
	private String sixend;
	
	private String firstweekisvalid = "1";
	private String secondweekisvalid = "1";
	private String thirdweekisvalid = "1";
	private String fourthweekisvalid = "1";
	private String fifthweekisvalid = "1";
	private String sixthweekisvalid = "1";
	
	private String orgcode;
	private String orgname;
	private String zs;
	private String firstweek;
	private String secondweek;
	private String thirdweek;
	private String fourthweek;
	private String fifthweek;
	private String sixthweek;
	private String jwqzs;
	private String wwczcjsjwqs;
	
	public void initDate()
	{
		if (ValidateHelper.isNotEmptyString(tjrq))
		{
			String firstday = tjrq + "01";
			setOnestart(firstday);
			Calendar ca = Calendar.getInstance();
			ca.setTime(DateTimeHelper.convertToDate(firstday, "yyyyMMdd"));
			int lastdaytime = ca.getActualMaximum(Calendar.DAY_OF_MONTH);
			String lastday = tjrq+lastdaytime;
			String currentDate = firstday;
			int countweek = 1;
			for (int i=1;i<lastdaytime;i++)
			{
				Date d = DateTimeHelper.convertToDate(currentDate, "yyyyMMdd");
				Calendar c = Calendar.getInstance();
				c.setTime(d);
				int week = c.get(Calendar.DAY_OF_WEEK);
				if (week == 7 && countweek == 1)
				{
					setOneend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 7 && countweek == 2)
				{
					setTwoend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 7 && countweek == 3)
				{
					setThreeend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 7 && countweek == 4)
				{
					setFourend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 7 && countweek == 5)
				{
					setFiveend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 7 && countweek == 5)
				{
					setSixend(DateTimeHelper.conver(d, "yyyyMMdd"));
					countweek++;
				}
				else if (week == 1 && countweek == 1)
				{
					setOnestart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				else if (week == 1 && countweek == 2)
				{
					setTwostart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				else if (week == 1 && countweek == 3)
				{
					setThreestart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				else if (week == 1 && countweek == 4)
				{
					setFourstart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				else if (week == 1 && countweek == 5)
				{
					setFivestart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				else if (week == 1 && countweek == 6)
				{
					setSixstart(DateTimeHelper.conver(d, "yyyyMMdd"));
				}
				currentDate = DateTimeHelper.conver(DateTimeHelper.addDateTime(d.getTime(), 1),"yyyyMMdd");
			}
			if (countweek == 4)
			{
				setFourend(lastday);
			}
			else if (countweek == 5)
			{
				setFiveend(lastday);
			}
			else if (countweek == 6)
			{
				setSixend(lastday);
			}
			//第一周是否有效
			if (ValidateHelper.isNotEmptyString(onestart))
			{
				int onenumstart = Integer.parseInt(onestart);
				int onenumend = Integer.parseInt(oneend);
				if (onenumend - onenumstart <= 2)
				{
					firstweekisvalid = "0";
				}
			}
			else
			{
				firstweekisvalid = "0";
			}
			int currentdateint = Integer.parseInt(DateTimeHelper.getNowDateStr("yyyyMMdd"));
			//第二周是否有效
			if (ValidateHelper.isNotEmptyString(twoend))
			{
				if (currentdateint < Integer.parseInt(twoend))
				{
					secondweekisvalid = "0";
				}
			}
			else
			{
				secondweekisvalid = "0";
			}
			//第三周是否有效
			if (ValidateHelper.isNotEmptyString(threeend))
			{
				if (currentdateint < Integer.parseInt(threeend))
				{
					thirdweekisvalid = "0";
				} 
			}
			else
			{
				thirdweekisvalid = "0";
			}
			//第四周是否有效
			if (ValidateHelper.isNotEmptyString(fourend))
			{
				if (currentdateint < Integer.parseInt(fourend))
				{
					fourthweekisvalid = "0";
				} 
			}
			else
			{
				fourthweekisvalid = "0";
			}
			//第五周是否有效
			if (ValidateHelper.isNotEmptyString(fivestart))
			{
				int fivenumstart = Integer.parseInt(fivestart);
				int fivenumend = Integer.parseInt(fiveend);
				if (fivenumend - fivenumstart <= 2 || currentdateint < fivenumend)
				{
					fifthweekisvalid = "0";
				}
			}
			else
			{
				fifthweekisvalid = "0";
			}
			//第六周是否有效
			if (ValidateHelper.isNotEmptyString(sixstart))
			{
				int sixnumstart = Integer.parseInt(sixstart);
				int sixnumend = Integer.parseInt(sixend);
				if (sixnumend - sixnumstart <= 2 || currentdateint < sixnumend)
				{
					sixthweekisvalid = "0";
				}
			}
			else
			{
				sixthweekisvalid = "0";
			}
		}
	}
	
	public String getTjdwdm()
	{
		return tjdwdm;
	}
	public void setTjdwdm(String tjdwdm)
	{
		this.tjdwdm = tjdwdm;
	}
	
	public int getLeve()
	{
		return leve;
	}

	public void setLeve(int leve)
	{
		this.leve = leve;
	}

	public String getTjrq()
	{
		return tjrq;
	}
	public void setTjrq(String tjrq)
	{
		this.tjrq = tjrq;
	}
	public String getTjlb()
	{
		return tjlb;
	}
	public void setTjlb(String tjlb)
	{
		this.tjlb = tjlb;
	}
	public String getOnestart()
	{
		return onestart;
	}
	public void setOnestart(String onestart)
	{
		this.onestart = onestart;
	}
	public String getOneend()
	{
		return oneend;
	}
	public void setOneend(String oneend)
	{
		this.oneend = oneend;
	}
	public String getTwostart()
	{
		return twostart;
	}
	public void setTwostart(String twostart)
	{
		this.twostart = twostart;
	}
	public String getTwoend()
	{
		return twoend;
	}
	public void setTwoend(String twoend)
	{
		this.twoend = twoend;
	}
	public String getThreestart()
	{
		return threestart;
	}
	public void setThreestart(String threestart)
	{
		this.threestart = threestart;
	}
	public String getThreeend()
	{
		return threeend;
	}
	public void setThreeend(String threeend)
	{
		this.threeend = threeend;
	}
	public String getFourstart()
	{
		return fourstart;
	}
	public void setFourstart(String fourstart)
	{
		this.fourstart = fourstart;
	}
	public String getFourend()
	{
		return fourend;
	}
	public void setFourend(String fourend)
	{
		this.fourend = fourend;
	}
	public String getFivestart()
	{
		return fivestart;
	}
	public void setFivestart(String fivestart)
	{
		this.fivestart = fivestart;
	}
	public String getFiveend()
	{
		return fiveend;
	}
	public void setFiveend(String fiveend)
	{
		this.fiveend = fiveend;
	}
	public String getOrgcode()
	{
		return orgcode;
	}
	public void setOrgcode(String orgcode)
	{
		this.orgcode = orgcode;
	}
	public String getOrgname()
	{
		return orgname;
	}
	public void setOrgname(String orgname)
	{
		this.orgname = orgname;
	}
	public String getFirstweek()
	{
		return firstweek;
	}
	public void setFirstweek(String firstweek)
	{
		this.firstweek = firstweek;
	}
	public String getSecondweek()
	{
		return secondweek;
	}
	public void setSecondweek(String secondweek)
	{
		this.secondweek = secondweek;
	}
	public String getThirdweek()
	{
		return thirdweek;
	}
	public void setThirdweek(String thirdweek)
	{
		this.thirdweek = thirdweek;
	}
	public String getFourthweek()
	{
		return fourthweek;
	}
	public void setFourthweek(String fourthweek)
	{
		this.fourthweek = fourthweek;
	}
	public String getFifthweek()
	{
		return fifthweek;
	}
	public void setFifthweek(String fifthweek)
	{
		this.fifthweek = fifthweek;
	}
	public String getJwqzs()
	{
		return jwqzs;
	}
	public void setJwqzs(String jwqzs)
	{
		this.jwqzs = jwqzs;
	}
	public String getWwczcjsjwqs()
	{
		return wwczcjsjwqs;
	}
	public void setWwczcjsjwqs(String wwczcjsjwqs)
	{
		this.wwczcjsjwqs = wwczcjsjwqs;
	}
	
	public String getSixstart()
	{
		return sixstart;
	}

	public void setSixstart(String sixstart)
	{
		this.sixstart = sixstart;
	}

	public String getSixend()
	{
		return sixend;
	}

	public void setSixend(String sixend)
	{
		this.sixend = sixend;
	}
	

	public String getFirstweekisvalid()
	{
		return firstweekisvalid;
	}

	public void setFirstweekisvalid(String firstweekisvalid)
	{
		this.firstweekisvalid = firstweekisvalid;
	}

	public String getSecondweekisvalid()
	{
		return secondweekisvalid;
	}

	public void setSecondweekisvalid(String secondweekisvalid)
	{
		this.secondweekisvalid = secondweekisvalid;
	}

	public String getThirdweekisvalid()
	{
		return thirdweekisvalid;
	}

	public void setThirdweekisvalid(String thirdweekisvalid)
	{
		this.thirdweekisvalid = thirdweekisvalid;
	}

	public String getFourthweekisvalid()
	{
		return fourthweekisvalid;
	}

	public void setFourthweekisvalid(String fourthweekisvalid)
	{
		this.fourthweekisvalid = fourthweekisvalid;
	}

	public String getFifthweekisvalid()
	{
		return fifthweekisvalid;
	}

	public void setFifthweekisvalid(String fifthweekisvalid)
	{
		this.fifthweekisvalid = fifthweekisvalid;
	}

	public String getSixthweekisvalid()
	{
		return sixthweekisvalid;
	}

	public void setSixthweekisvalid(String sixthweekisvalid)
	{
		this.sixthweekisvalid = sixthweekisvalid;
	}

	public String getSixthweek()
	{
		return sixthweek;
	}

	public void setSixthweek(String sixthweek)
	{
		this.sixthweek = sixthweek;
	}

	public String getZs()
	{
		int count = 0;
		if (ValidateHelper.isNotEmptyString(firstweek))
		{
			count+=Integer.parseInt(firstweek);
		}
		if (ValidateHelper.isNotEmptyString(secondweek))
		{
			count+=Integer.parseInt(secondweek);
		}
		if (ValidateHelper.isNotEmptyString(thirdweek))
		{
			count+=Integer.parseInt(thirdweek);
		}
		if (ValidateHelper.isNotEmptyString(fourthweek))
		{
			count+=Integer.parseInt(fourthweek);
		}
		if (ValidateHelper.isNotEmptyString(fifthweek))
		{
			count+=Integer.parseInt(fifthweek);
		}
		if (ValidateHelper.isNotEmptyString(sixthweek))
		{
			count+=Integer.parseInt(sixthweek);
		}
		zs = String.valueOf(count);
		return zs;
	}

	public void setZs(String zs)
	{
		this.zs = zs;
	}
	/*
	public static void main(String[] args)
	{
		WeekTjbbBean bean = new WeekTjbbBean();
		bean.setTjrq("201502");
		bean.initDate();
		System.out.println(bean.getOnestart());
		System.out.println(bean.getOneend());
		
		System.out.println(bean.getTwostart());
		System.out.println(bean.getTwoend());
		
		System.out.println(bean.getThreestart());
		System.out.println(bean.getThreeend());
		
		System.out.println(bean.getFourstart());
		System.out.println(bean.getFourend());
		
		System.out.println(bean.getFivestart());
		System.out.println(bean.getFiveend());
		
		System.out.println(bean.getSixstart());
		System.out.println(bean.getSixend());
		
		System.out.println("firstweekisvalid:" + bean.getFirstweekisvalid());
		System.out.println("secondweekisvalid:" + bean.getSecondweekisvalid());
		System.out.println("thirdweekisvalid:" + bean.getThirdweekisvalid());
		System.out.println("fourthweekisvalid:" + bean.getFourthweekisvalid());
		System.out.println("fifthweekisvalid:" + bean.getFifthweekisvalid());
		System.out.println("sixthweekisvalid:" + bean.getSixthweekisvalid());
		
	}
	*/
}
