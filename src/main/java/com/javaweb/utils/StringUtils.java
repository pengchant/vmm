package com.javaweb.utils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class StringUtils {
	
	public static int getCharacterPosition(String string){
	    //这里是获取"/"符号的位置
	    Matcher slashMatcher = Pattern.compile("/").matcher(string);
	    int mIdx = 0;
	    while(slashMatcher.find()) {
	       mIdx++;
	       //当"/"符号第四次出现的位置
	       if(mIdx == 4){
	          break;
	       }
	    }
	    return slashMatcher.start();
	 }
}
