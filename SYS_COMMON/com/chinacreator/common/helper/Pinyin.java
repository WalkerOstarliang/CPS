package com.chinacreator.common.helper;
import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;
import net.sourceforge.pinyin4j.format.HanyuPinyinVCharType;
import net.sourceforge.pinyin4j.format.exception.BadHanyuPinyinOutputFormatCombination;

public class Pinyin {
	/**
	 * 获取中文首字母简称
	 * @param name
	 * @return
	 * @date Mar 12, 2015 2:47:50 PM
	 */
	public static String getPinYingJC(String name) 
	{
		char[] t1 = null;
		t1 = name.toCharArray();
		String[] t2 = new String[t1.length];
		HanyuPinyinOutputFormat t3 = new HanyuPinyinOutputFormat();
		t3.setCaseType(HanyuPinyinCaseType.LOWERCASE);
		t3.setToneType(HanyuPinyinToneType.WITHOUT_TONE);
		t3.setVCharType(HanyuPinyinVCharType.WITH_V);
		String py = "";
		int t0 = t1.length;
		try 
		{
			for (int i = 0; i < t0; i++) 
			{
				if (java.lang.Character.toString(t1[i]).matches(
						"[\\u4E00-\\u9FA5]+")) 
				{
					t2 = PinyinHelper.toHanyuPinyinStringArray(t1[i], t3);
					if (t2[0] != null) 
					{
						py += t2[0].substring(0, 1);
					}
				} 
				else 
				{
					py += java.lang.Character.toString(t1[i]);
				}
			}
		} 
		catch (BadHanyuPinyinOutputFormatCombination e1) 
		{
			e1.printStackTrace();
		}

		return py.toUpperCase();
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) 
	{
		System.out.println(getPinYingJC("asdf"));
	}

}
